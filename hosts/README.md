hosts
=====

An Ansible role to configure ```/etc/hosts``` to contain all systems in the inventory within a specific subset

Requirements
------------

- A ```hosts_entries``` variable containing a subset of the inventory to be added to /etc/hosts.
  Each entry in ```hosts_entries``` is looked up in hostvars.
- EC2 inventory variables are assumed; private IP address, private DNS name, and 'Name' tag are
  listed in the hosts file. For example:


    10.0.0.0   ip-10-0-0-0.ec2.internal  host1
    10.0.0.1   ip-10-0-0-1.ec2.internal  host2
    10.0.0.2   ip-10-0-0-2.ec2.internal  host3

Role Variables
--------------

The variables that can be passed to this role and their default values:

    # absolute path to the hosts file
    hosts_dest: /etc/hosts

    # whether to create a backup of the hosts file
    hosts_backup: yes

    # optional extra entries, for example:
    hosts_extra_entries:
      - { ip: '127.0.0.1', hosts: [ 'hostname1', 'hostname2' ] }
      - { ip: '127.0.0.2', hosts: [ 'hostname3', 'hostname4' ] }

Example Playbook
----------------

This example adds all servers in a specific group to ```/etc/hosts```:

    - name: Configure Hosts
      become: yes
      become_method: sudo
      remote_user: "{{ remote_user | default(omit) }}"
      hosts: servers
      roles:
        - name: Configure Hosts
          role: hosts
          hosts_entries: "{{ groups['tag_group_' + group] | sort }}"

License
-------

MIT

