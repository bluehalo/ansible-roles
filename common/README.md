common
======

An Ansible role for performing "common" server initialization tasks.

Does the following:

- Adds epel yum repository
- Installs common packages via yum:
    - ntp
    - wget
    - yum-plugin-priorities
    - python-lxml
- Starts NTP
- Installs and enables SELINUX if configured
- Configures common best practices if enabled (security limits, disable swappiness, THP, etc.)

Requirements
------------

Assumes a Unix/Linux OS, and has only been tested on the RedHat OS family

Role Variables
------------

    # Whether to install and configure SELinux in enforcing mode, default is true
    selinux_enabled: true

    # Whether to configure some common best practices
    best_practices_enabled: true

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

