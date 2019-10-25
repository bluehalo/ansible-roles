mitogen
===

An Ansible role to install mitogen on CentOS 7 and Amazon Linux 2

Requirements
------------

Target host must be able to reach yum repositories, pip repository, and be a supported OS

Role Variables
--------------

    set_umask: umask to set mitogen installation path (Default: "0022"). Default allows all users to use mitogen.

Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: install mitogen via pip
          role: mitogen

License
-------

MIT

