uam
===

An Ansible role to install and configure uam.

Requirements
------------

Assumes RedHat OS family

Role Variables
--------------

    uam_installer - name of the installer file
    uam_local_src_dir - local directory containing the uam_installer
    uam_upload_dir - destination directory where the uam_installer will be uploaded

Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: Install uam
          role: uam
          uam_installer: installer filename
          uam_local_src_dir: /local/path/to/installer
          uam_upload_dir: /remote/path/to/installer

License
-------

MIT

