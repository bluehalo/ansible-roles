openjdk
=======

An Ansible role to install openjdk via yum.

Requirements
------------

Assumes a Unix/Linux OS, and has only been tested on the RedHat OS family

Role Variables
--------------

None

Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: Install openjdk
          role: openjdk

License
-------

MIT

