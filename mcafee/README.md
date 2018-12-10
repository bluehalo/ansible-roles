mcafee
======

An Ansible role to install and configure mcafee antivirus.

Requirements
------------

Assumes RedHat OS family

Role Variables
--------------

    mcafee_zip_file - name of the zip installer file
    mcafee_local_src_dir - local directory containing the mcafee_zip_file
    mcafee_upload_dir - destination directory where the mcafee_zip_file will be uploaded

Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: Install mcafee
          role: mcafee
          mcafee_zip_file: the zip filename
          mcafee_local_src_dir: /local/path/to/zip
          mcafee_upload_dir: /remote/path/to/zip

License
-------

MIT

