influxdb
========

An Ansible role to configure influxDB.  This role does not currently support installing influxDB.  However,
it is easily installed using the following commands:
     
     wget https://dl.influxdata.com/influxdb/releases/influxdb-1.3.5.x86_64.rpm
     sudo yum localinstall influxdb-1.3.5.x86_64.rpm 

Requirements
------------

Assumes a Unix/Linux OS, and has only been tested on the RedHat OS family

Role Variables
--------------

    influxdb_meta_dir: "/var/lib/influxdb/meta"
    influxdb_data_dir: "/data"
    influxdb_index_version: "inmem"
    influxdb_wal_dir: "/var/lib/influxdb/wal"
    influxdb_retention_check_interval: "30m"
    influxdb_http_log_enabled: true

Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: configure influxdb
          role: influxdb

License
-------

MIT
