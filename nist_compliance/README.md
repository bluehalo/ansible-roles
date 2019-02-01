nist_compliance
========

An Ansible role for applying secure configurations in compliance with NIST standards.

Requirements
------------

Assumes a Unix/Linux OS, and has only been tested on the RedHat OS family

Role Variables
--------------

Other variables that can be passed to this role and a brief description about
them are as follows. These variables should be configured as group_vars.

    # list of services to disable
    compliance_disabled_services: [ 'acpid', 'kdump', 'mdmonitor', 'messagebus', 'portreserve', 'atd' ]
    # email to send system warnings to
    compliance_email_sysadmin: <username>@<domain>
    # whether to display login banner before login
    compliance_show_ssh_banner: false

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

