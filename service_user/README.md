service_user
============

An Ansible role to create a service user account, i.e. a user without a login.

Requirements
------------

Assumes RedHat OS family

Role Variables
--------------

Required variables:

    # user's name
    service_user_name:

    # user's home directory
    service_user_home:

Optional variables and their default values:

    # user's group
    service_user_group: "{{ service_user_name }}"

Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: Create a new user
          role: service_user
          service_user_name: example
          service_user_home: /opt/example

License
-------

MIT

