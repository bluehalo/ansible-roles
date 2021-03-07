nist_compliance
========

An Ansible role for applying secure configurations in compliance with NIST standards.

Requirements
------------

Assumes an Amazon Linux/CentOS Linux OS, and has only been tested on the Amazon Linux OS family

Role Variables
--------------

Other variables that can be passed to this role and a brief description about
them are as follows. These variables should be configured as group_vars.

    # email to send system warnings to
    compliance_email_sysadmin: <username>@<domain>

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

