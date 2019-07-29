Azure CLI
===

An Ansible role to install the Azure command-line interface

Requirements
------------

Target host must be an RPM-based OS (e.g. Centos, Amazon) and have access to the Internet

Role Variables
--------------

    ms_repo_key: URL of the Microsoft yum repo key
    azure_yum_repo_url: URL of the Azure Yum Repository

Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: Install azure_cli
          role: azure_cli

License
-------

MIT

