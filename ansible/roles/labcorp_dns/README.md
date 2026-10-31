# LabCorp DNS service

Ansible-managed authoritative DNS for an independent infrastructure homelab.

## Architecture

- dns01: 10.50.20.10, primary for all three zones.
- dns02: 10.50.20.11, secondary receiving zone transfers from dns01.
- OPNsense Unbound: client-facing resolver, forwarding the three internal
  zones to both DNS servers and handling external name resolution.
- Clients continue using their network's OPNsense interface as their resolver.
- BIND recursion is disabled.

## Managed zones

| Zone | Purpose |
| --- | --- |
| labcorp.internal | Internal forward records |
| 20.50.10.in-addr.arpa | SERVERS network reverse records |
| 10.50.10.in-addr.arpa | MGMT network reverse records |

Primary zone files are installed by Ansible. Secondary zone files are
obtained by BIND through zone transfers and saved under /var/named/slaves.

## Automation scope

The role manages:

- BIND package installation.
- Main configuration and zone declarations.
- Primary forward and reverse zone records.
- File ownership, permissions and backups when replacing existing content.
- Candidate zone validation with named-checkzone.
- Candidate configuration validation with named-checkconf.
- named service startup and boot enablement.
- Restart notifications when templates change.
- Permanent and runtime DNS access through the public firewalld zone.

Host-specific values live in ansible/inventory/host_vars.
The playbook uses order: sorted, serial: 1 and any_errors_fatal: true.
With the current hostnames, dns01 completes before dns02 begins.

OPNsense query-forwarding entries are configured manually.
Diagnostic tools installed through ad hoc commands are not managed by this role.

## Access policy

- Both servers permit queries from localhost and OPNsense at 10.50.20.1.
- Primary zone declarations additionally permit queries from dns02.
- Primary zones permit transfers to dns02 at 10.50.20.11.
- Transfers from secondary zones are denied by the global configuration.
- Dynamic updates to primary zones are disabled.

## Deployment

Run from the repository root on ops-control01.

Prerequisites: existing inventory, working SSH and privilege escalation,
the ansible.posix collection, and the established Rocky Linux foundation
including firewalld.

    ansible-playbook ansible/playbooks/dns_service.yml --syntax-check
    ansible-playbook ansible/playbooks/dns_service.yml --check --diff
    ansible-playbook ansible/playbooks/dns_service.yml --diff

Check mode previews changes; it does not prove successful deployment or
zone transfer. Template validation is per file, not an atomic deployment
of the complete configuration.

## Record changes

Edit the appropriate primary zone template and increase that zone's SOA
serial. Deploy through the playbook, then verify the answer on the
secondary and through the client resolver.

Do not edit transferred zone files on dns02.
The dns-test forward record is retained as a learning/test record.

## Verified evidence

- Both servers answer authoritatively for the forward zone.
- Both servers answer PTR queries for the SERVERS and MGMT reverse zones.
- A forward-record change propagated to dns02 after a serial increase.
- Secondary logs showed successful zone transfers.
- Packet capture demonstrated Unbound querying dns02 and receiving its answer.
- Internal forward and reverse lookups succeeded through OPNsense.
- Representative MGMT and SERVERS clients resolved short internal names.
- Both representative clients resolved example.com through system lookup.
- The final repeat deployment reported changed=0 and failed=0 on both hosts.

The tests above were performed manually. Generated files under tests/
are role scaffolding, not an implemented acceptance-test suite.

## Limitations and deferred work

- A direct query from monitor01 to dns01 timed out. The blocking component
  has not been identified; this does not prove a BIND ACL rejection.
- Controlled DNS service failure/recovery testing remains deferred.
- Zone-transfer authorization currently uses source IP addresses, not TSIG.
- Both DNS VMs share one physical hypervisor.
- Template backups do not provide automatic rollback.
- Monitoring, automated acceptance tests and rebuild/restore evidence are
  future work.

## Recovery boundary

For a record correction, update the template and use a serial greater than
the deployed serial. Reverting an old Git version alone may restore an
older serial that the secondary will not accept as a newer zone.

For configuration problems, correct or restore the reviewed configuration,
validate it, deploy it and verify DNS answers. This milestone does not
claim a tested recovery procedure.
