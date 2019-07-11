openjdk
=======

An Ansible role to install openjdk via yum.

Requirements
------------

Assumes a Unix/Linux OS, and has only been tested on the RedHat OS family

Role Variables
--------------

    # based on available yum packages
    # values include: 1.6.0, 1.7.0, 1.8.0, 11, latest
    openjdk_version: 1.8.0

Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: Install openjdk
          role: openjdk
          openjdk_version: 1.8.0

License
-------

MIT

