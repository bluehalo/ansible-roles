x11_forwarding
===

An Ansible role to allow x11 forwarding on CentOS 7 and Amazon Linux 2

Requirements
------------

Target host must be able to reach yum repositories and be a supported OS

Role Variables
--------------

    mate_version: Version of mate to install on Amazon Linux 2 only (Default: latest)

Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: setup x11 forwarding
          role: x11_forwarding

License
-------

MIT

