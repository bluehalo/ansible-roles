terraform
===

An Ansible role to install Terraform.

Requirements
------------

Target host must have unzip installed and access to the download URL

Role Variables
--------------

    tf_zip_url: https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip
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

