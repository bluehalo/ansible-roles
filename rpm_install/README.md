rpm_install
===========

This Ansible role installs an RPM from a file. Role calls the rom command directly rather than using yum so that snapshotted
rpm's are able to be updated.

Requirements
------------

Naturally, role assumes an RPM-based distro.

Role Variables
--------------

Optional variables:

    rpm_nosignature - default: True. if True, enables rpm ```--nosignature``` flag to not verify package or header signatures

Dependencies
------------

None

Example Playbook
----------------

See [nifi_nars/README.md](../nifi_nars/README.md) for a complete example.

License
-------

MIT

