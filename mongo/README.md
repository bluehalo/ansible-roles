mongo
=====

Use this role to install, configure, and manage MongoDB. Role installs Mongo via yum by default, but can optionally install
from local rpm files instead.

Requirements
------------

Assumes a Unix/Linux OS, and has only been tested on the RedHat OS family

Role Variables
--------------

The most commonly modified variables are listed below:

    # the mongo version to use when installing via yum, ignored when installing from rpm files
    mongo_version: 3.6

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
    mongo_log_append: false
    mongo_log_rotate: rename
    mongo_log_verbosity: 0
    
    # Determines whether the process should be forked
    mongo_fork_process: true
    
    mongo_cluster_role: shardsvr
    
    mongo_authorization: disabled

    # Whether to perform selinux-specific configuration, default is true
    selinux_enabled: true

    # ssl properties:
    mongo_ssl_enabled: false
    # the following are required if mongo_ssl_enabled is true:
    #mongo_ssl_mode:
    #mongo_ssl_pem_key_file:
    #mongo_ssl_pem_key_password: (optional)
    #mongo_ssl_ca_file:
    #mongo_ssl_allow_invalid_certificates:
    #mongo_ssl_allow_invalid_hostnames:

Properties used to configure a replica set:

    # enable to initialize replica set
    mongo_init_replica_set: false

    # list of servers in the replica set
    mongo_replica_servers: []

    # replicate set name
    mongo_replica_set_name: rs0

    # sleep time between adding nodes to the replica set
    mongo_replica_sleep_millis: 10000

Properties used to install from rpm files (the rpm files must first be uploaded to host system):

    local_artifact: true

    # complete paths to rpm files on the host system:
    mongo_server_rpm_name:
    mongo_shell_rpm_name:
    mongo_tools_rpm_name:

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

