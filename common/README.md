common
======

An Ansible role for performing "common" server initialization tasks.

Does the following:

- Adds epel yum repository
- Installs common packages via yum:
    - ntp
    - wget
    - policycoreutils-python
    - libsemanage-python
    - selinux-policy-targeted
    - yum-plugin-priorities
    - python-lxml
- Enables SELINUX
- Starts NTP

Requirements
------------

Assumes a Unix/Linux OS, and has only been tested on the RedHat OS family

Role Variables
------------

None

Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: Perform common initialization
          role: common

License
-------

MIT

