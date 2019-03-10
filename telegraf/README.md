Telegraf

An Ansible role to configure Telegraf.  

Requirements
------------

Assumes a Unix/Linux OS, and has only been tested on the RedHat OS family

Role Variables
--------------

    telegraf_version: 1.9.5
    telegraf_download: true
    telegraf_outputs_influxdb_host: 127.0.0.1
    telegraf_outputs_influxdb_port: 8086
    telegraf_outputs_influxdb_database: telegraf
    telegraf_outputs_influxdb_retention_policy: ten_days
    
    telegraf_inputs_mongodb:
    
Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      vars:
        telegraf_global_tags:
          - clusterName: "production"
      roles:
        - name: Telegraf
          role: telegraf


    - name: Example Playbook
      hosts: servers
      roles:
        - name: configure telegraf
          role: telegraf

License
-------

MIT
