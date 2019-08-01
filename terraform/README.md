terraform
===

An Ansible role to install Terraform.

Requirements
------------

Target host must have unzip installed and access to the download URL

Role Variables
--------------

    tf_version: Version of Terraform to install (default: 0.11.14)
    tf_installation_dir: /usr/bin

Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: Install terraform
          role: terraform

License
-------

MIT

