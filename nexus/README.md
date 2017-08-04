nexus
=====

An Ansible role to install and configure [Sonatype Nexus](http://www.sonatype.org/nexus/)

Requirements
------------

Assumes a Unix/Linux OS, and has only been tested on the RedHat OS family

Role Variables
--------------

Variables that can be passed to this role and their default values are as follows.

    nexus_host: 0.0.0.0
    nexus_port: 8081

    nexus_ssl: False
    nexus_ssl_port: 8443
    nexus_ssl_keypass: changeit
    nexus_ssl_storepass: changeit

    nexus_download_base_url: http://www.sonatype.org/downloads

    nexus_version: 2.14.3-02

    nexus_distribution_name: nexus-{{ nexus_version }}-bundle.tar.gz
    nexus_distribution_dir: nexus-{{ nexus_version }}
    nexus_download_force: no

    nexus_dest: "{{ nexus_home }}"
    nexus_link: nexus-current

    nexus_group: nexus
    nexus_user: nexus
    nexus_home: /opt/nexus
    nexus_shell: /sbin/nologin

    nexus_pid_dir: /var/run/nexus

Dependencies
------------

- openjdk

Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: Install nexus
          role: nexus

License
-------

MIT

