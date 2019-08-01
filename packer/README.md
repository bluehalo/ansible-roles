packer
===

An Ansible role to install Packer.

Requirements
------------

Target host must have unzip installed and access to the download URL

Role Variables
--------------

    packer_version: Version of packer to install (Default: 1.4.2)
    packer_installation_dir: Where to install (/usr/bin)

Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: Install packer
          role: packer

License
-------

MIT

