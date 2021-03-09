nist_compliance
========

An Ansible role for applying secure configurations in compliance with NIST standards.

Requirements
------------

Assumes an Amazon Linux/CentOS Linux OS, and has only been tested on the Amazon Linux OS family

Role Variables
--------------

Other variables that can be passed to this role and a brief description about
them are as follows. We recommend reconfiguring these variables as group_vars.

    # Email to send system warnings to
    compliance_email_sysadmin: <username>@<domain>
    # Pool of public NTP servers for chrony template
    ntp_pool: <ntp_server_pool>
    # Local NTP servers for chrony template
    ntp_servers: <local_ntp_servers>
    # Repos to exclude from gpgcheck setting updates
    team_repo_name: <repo>
    # System users for use in sshd_config template
    users: <users>

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

