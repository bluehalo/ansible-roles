supervisord
===========

An Ansible role to install and configure supervisord.

Requirements
------------

Assumes RedHat OS family

Role Variables
--------------

Required variables:

    # name for the service to be managed
    supervisord_service_name

Optional variables and their default values:

    supervisord_conf_dir: /etc/supervisord/conf.d
    supervisord_log_dir: /var/log/supervisord

    supervisord_user: root
    supervisord_log_level: warn
    supervisord_autostart: 'true'
    supervisord_autorestart: 'true'
    supervisord_startsecs: 1
    supervisord_startretries: 99
    supervisord_stdout_logfile_maxbytes: '10MB'
    supervisord_stderr_logfile_maxbytes: '10MB'
    supervisord_stdout_logfile_backups: 2
    supervisord_stderr_logfile_backups: 4
    supervisord_num_processes: 1
    supervisord_stopasgroup: 'false'

Dependencies
------------

- logrotate

Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: Install supervisord
          role: supervisord

License
-------

MIT

