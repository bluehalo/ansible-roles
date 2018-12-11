firewalld
=========

An Ansible role to install and configure firewalld.

Does the following:

- Installs and enables firewalld
- Adds services to firewalld (if configured)
- Adds TCP ports to firewalld (if configured)
- Adds port forwarding rules to firewalld (if configured)

Requirements
------------

Assumes RedHat OS family

Role Variables
--------------

Variables and their defaults:

    # list of service names to add - service must be listed in output of firewall-cmd --get-services
    firewalld_services: []

    # list of TCP ports to add
    firewalld_ports: []

    # port forwarding rules: each entry should contain port, toport, and optionally proto (defaults to TCP)
    firewalld_port_forwards: {}

Example Playbook
----------------

Example 1: Install firewalld, add ssh/http/https, and forward traffic from 443 to 9443

    - name: Example Playbook 1
      role: firewalld
      firewalld_services:
        - ssh
        - http
        - https
      firewalld_port_forwards:
        - port: 443
          toport: 9443

Example 2: Install firewalld and enable port 27017 for MongoDB

    - name: Example Playbook 2
      role: firewalld
      firewalld_ports:
        - 27017

License
-------

MIT

