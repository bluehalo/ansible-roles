Chronograf

An Ansible role to configure Chronograf.  

Requirements
------------

Assumes a Unix/Linux OS, and has only been tested on the RedHat OS family

Role Variables
--------------
    chronograf_download: true
    chronograf_version: 1.7.9
    
    chronograf_port: 8888
    chronograf_logging_level: info
    
Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: Chronograf
          role: chronograf

License
-------

MIT
