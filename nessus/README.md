nessus
======

An Ansible role to install and configure nessus.

Requirements
------------

Assumes RedHat OS family

Role Variables
--------------

Required:

    nessus_rpm_file - name of the nessus rpm file
    nessus_local_src_dir - local directory containing the nessus_rpm_file
    nessus_upload_dir - destination directory where the nessus_rpm_file will be uploaded

    nessus_key
    nessus_manager_host
    nessus_manager_port
    nessus_group

Overridable:

    nessus_install_dir: /opt/nessus_agent

Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: Install nessus
          role: nessus
          nessus_rpm_file: rpm filename
          nessus_local_src_dir: /local/path/to/rpm
          nessus_upload_dir: /remote/path/to/rpm
          nessus_key: nessus configuration
          nessus_manager_host: nessus configuration
          nessus_manager_port: nessus configuration
          nessus_group: nessus configuration

License
-------

MIT

