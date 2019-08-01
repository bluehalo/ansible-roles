Google Cloud SDK
===

An Ansible role to install the Google Cloud Platform SDK

Requirements
------------

Target host must be an RPM-based OS (e.g. Centos, Amazon) and have access to the Internet

Role Variables
--------------

    gcloud_yum_repo_url: URL of the Google Cloud Yum Repository
    gcloud_yum_gpg_keys: List of GPG keys for accessing repo

Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: Install Google Cloud SDK
          role: google-cloud-sdk

License
-------

MIT

