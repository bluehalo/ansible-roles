aws_cli
=======

An Ansible role to install the AWS CLI client via Pip.

Requirements
------------

Assumes RedHat OS family

Role Variables
--------------

None

Dependencies
------------

- pip

Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: Install aws_cli
          role: aws_cli

License
-------

MIT

