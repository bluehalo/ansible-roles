mongo
=====

Use this role to install, configure, and manage MongoDB.

Requirements
------------

Assumes a Unix/Linux OS, and has only been tested on the RedHat OS family

Role Variables
--------------

The most commonly modified variables are listed below:

    # The name of the mongo process
    mongo_process_name: mongod

    # The location of the database files
    mongo_db_dir: /data/db

    # The location of the configuration file
    mongo_conf_file: "/etc/mongod.conf"

    # The location of the pid file
    mongo_pid_file: "/var/run/mongodb/mongod.pid"
    
    # The location of the log file
    mongo_log_path: "/var/log/mongodb/mongod.log"
    
    # Mongo port
    mongo_port: 27017
    
    # Mongo logging properties
    mongo_log_append: true
    mongo_log_rotate: reopen
    mongo_log_verbosity: 0
    
    # Determines whether the process should be forked
    mongo_fork_process: true
    
    mongo_slow_op_threshold_ms: 1000
    mongo_operation_profiling_mode: slowOp
    mongo_cluster_role: shardsvr
    
    # WiredTiger configurations
    mongo_wt_cache_gb: 0
    mongo_wt_directory_for_indexes: false
    mongo_authorization: disabled

    # Whether to perform selinux-specific configuration, default is true
    selinux_enabled: true

Example Playbook
----------------

Install and configure mongo

    - name: Install MongoDB
      hosts: servers
      roles:
        - role: mongo

License
-------

MIT

