ansible
===

An Ansible role to install Ansible via Pip

Requirements
------------

Assumes RedHat OS family and access to the Internet (or access to local Pypi servers)

Role Variables
--------------

    ansible_install_version: 2.6.5

Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: Install ansible
          role: ansible

License
-------

MIT

