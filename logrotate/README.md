logrotate
=========

An Ansible role to install and configure logrotate. Ensures logrotate is installed,
then adds a configuration for a given service to manage.

Requirements
------------

Assumes RedHat OS family

Role Variables
--------------

Required variables:

    # name of the application whose logs will be managed
    logrotate_filename

    # file pattern to manage
    logrotate_pattern

Optional variables and their default values:

    logrotate_conf_dir: /etc/logrotate.d
    logrotate_log_dir: /var/log/logrotate

    logrotate_pid_file_path: /var/run/logrotate/logrotate.pid
    logrotate_cron_freq: 'hourly'
    logrotate_max_size: '10M'
    logrotate_duration: 'daily'
    logrotate_max_history: 3
    logrotate_compress: 'nocompress'
    logrotate_missingok: True
    logrotate_notifempty: True
    logrotate_copytruncate: True
    logrotate_postrotate: False

Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: Configure logrotate for myapp logs
          role: logrotate
          logrotate_filename: myapp
          logrotate_pattern: /var/log/myapp/*.log

License
-------

MIT

