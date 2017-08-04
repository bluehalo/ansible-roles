postgresql
==========

An Ansible role to install and configure PostgreSQL.

Requirements
------------

Assumes RedHat OS family, installing packages from yum.

Role Variables
--------------

Variables that can be passed to this role and their default values are as follows.

    postgresql_data_dir: /data/postgresql

Dependencies
------------

None

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - name: Example Playbook
      hosts: dbserver
      roles:
        - name: Install postgresql
          role: postgresql

License
-------

MIT

