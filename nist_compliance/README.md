nist_compliance
========

An Ansible role for applying secure configurations in compliance with NIST standards.

Requirements
------------

Assumes an Amazon Linux/CentOS Linux OS and has only been tested on the Amazon Linux OS family

Role Variables
--------------

Other variables that can be passed to this role and a brief description about them are as follows. 
We recommend configuring these variables as group_vars (or at a minimum in defaults).
The following variables are required:

    # list of services to disable
    compliance_disabled_services: [ 'acpid', 'kdump', 'mdmonitor', 'messagebus', 'portreserve', 'atd' ]
    # Email to send system warnings to
    compliance_email_sysadmin: <username>@<domain>
    # whether to display login banner before login
    compliance_show_ssh_banner: false
    # Pool of public NTP servers for chrony template
    compliance_ntp_pool: <ntp_server_pool>
    # Local NTP servers for chrony template
    compliance_ntp_servers: <local_ntp_servers>
    # Repos to exclude from gpgcheck setting updates
    compliance_team_repo_name: <repo>
    # System users for use in sshd_config template
    compliance_users: <users>

Example Playbook
----------------

    - hosts: servers
      become: yes
      become_method: sudo
      roles:
        - name: Run compliance requirements
          role: nist_compliance

License
-------

MIT

