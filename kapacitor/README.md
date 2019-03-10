Kapacitor

An Ansible role to configure Kapacitor.  

Requirements
------------

Assumes a Unix/Linux OS, and has only been tested on the RedHat OS family

Role Variables
--------------
    kapacitor_download: true
    kapacitor_version: 1.5.2
    
    kapacitor_data_dir: /usr/local/var/kapacitor
    
    kapacitor_http_log_enabled: true
    kapacitor_http_write_tracing: false
    kapacitor_http_pprof_enabled: false
    
    kapacitor_logging_file: /usr/local/var/log/kapacitor.log
    kapacitor_logging_level: INFO
    
    kapacitor_load_dir: /etc/kapacitor/load
    
    kapacitor_replay_dir: /usr/local/var/kapacitor/replay
    
    kapacitor_storage_boltdb: /usr/local/var/kapacitor/kapacitor.db
    
    kapacitor_influxdb_urls: http://localhost:0886
    kapacitor_influxdb_username:
    kapacitor_influxdb_password:
    
Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: Kapacitor
          role: kapacitor

License
-------

MIT
