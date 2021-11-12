clamav
========

An Ansible role for installing clamav on a Linux system.

Requirements
------------

Assumes a Unix/Linux OS, and has only been tested on the Amazon Linux 2 OS.  Integration with 
Cloudwatch for virus event notifications is incorporated through the use of two shell scripts 
that require the aws cli tools to be in place on the system.  These scripts also assume the associated
Cloudwatch alarm, SNS topics, etc. are already in place (via terraform or other methods).

Role Variables
--------------

Other variables that can be passed to this role and a brief description about
them are as follows. These variables should be configured as group_vars if possible.

    # Name of the clamav daemon/service
    clamav_daemon: 'clamd@scan'
    # Default state of the clamav daemon/service after apply
    clamav_daemon_state: started
    # Enable/Disable the clamav daemon/service after apply
    clamav_daemon_enabled: true

    # Name of the freshclam virus def update daemon/service 
    clamav_freshclam_daemon: 'clamd-freshclam'
    # Default state of the freshclam daemon/service after apply
    clamav_freshclam_daemon_state: started
    # Enable/Disable the freshclam daemon/service after apply
    clamav_freshclam_daemon_enabled: true

    # Name of the ClamAV OnAccess Scanner daemon/service
    clamav_clamonacc_daemon: 'clamav-clamonacc'
    # Default state of the ClamAV OnAccess Scanner daemon/service after apply
    clamav_clamonacc_daemon_state: started
    # Enable/Disable the freshclam daemon/service after apply
    clamav_clamonacc_daemon_enabled: true

    # Local socket path for the clamav daemon to bind to
    clamav_daemon_localsocket: /var/run/clamd.scan/clamd.sock
    # Location for the clamav configuration files
    clamav_daemon_config_path: /etc/clamd.d/scan.conf
    # List of packages to be installed as part of clamav
    clamav_packages:
      - amazon-linux-extras
      - clamav
      - clamav-update
      - clamd

    # Ownership permissions for cloudwatch alarm bash script  
    clamav_cloudwatch_script_group: root
    clamav_cloudwatch_script_owner: root
    # Name of the Cloudwatch virus event alarm in AWS
    cloudwatch_clamav_alarm_name: cloudwatch-clamav-virus-found

    # The region associated with the AWS account (used for Cloudwatch)
    aws_region: us-east-1

Example Playbook
----------------

    - hosts: servers
      become: yes
      become_method: sudo
      roles:
        - name: Install ClamAV
          role: clamav

License
-------

MIT

