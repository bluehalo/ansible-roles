grafana
=======

An Ansible role to configure grafana.  This role does not currently support installing grafana.  However,
it is easily installed using the following commands:
     
    wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-4.4.3-1.x86_64.rpm 
    sudo yum localinstall grafana-4.4.3-1.x86_64.rpm

Requirements
------------

Assumes a Unix/Linux OS, and has only been tested on the RedHat OS family

Role Variables
--------------

    grafana_app_mode: production
    
    grafana_root_url: 'http://localhost:3000'
    grafana_admin_user: "admin"
    grafana_admin_password: "admin"
    
    grafana_log_mode: 'console file'
    grafana_log_level: 'info'
    
    grafana_external_image_storage_provider: ''
    grafana_external_image_storage_s3_bucket_url: ''

Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: configure grafana
          role: grafana

License
-------

MIT
