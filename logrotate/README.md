logrotate
=========

An Ansible role to install and configure logrotate.

Requirements
------------

Assumes RedHat OS family

Role Variables
--------------

Variables and their default values:

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
        - name: Install logrotate
          role: logrotate

License
-------

MIT

