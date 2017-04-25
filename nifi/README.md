nifi
====

Use this role to install, configure, and manage Apache NiFi.

Requirements
------------

- NiFi distribution must be accssible on the target system prior to executing this role
  - if RPM, the RPM must be installed
  - if tar.gz, it must be unarchived

Role Variables
--------------

### Variables that determine the nifi install location, and their default values:

    nifi_base_dir: /var/lib/nifi
    nifi_etc_dir: /etc/nifi
    nifi_log_dir: /var/log/nifi
    nifi_pid_dir: /var/run/nifi

### Other Default variables are listed below:
    # A complete list of IP addresses for each nodes within the nifi cluster
    nifi_nodes_list: []
    
    # nifi_extra_args is a list of key/value pairs that are made available in NiFi, for example:
    nifi_extra_args:
      - file.encoding: "UTF-8"
      - environment: "{{ env }}"
    
    # List of directories for nifi to look in for additional nars.
    nifi_custom_nars: []
        
    nifi_node_jvm_memory: '1024m'
    nifi_java_command: 'java'
    
    # defaults file / directories for nifi
    nifi_database_repository: "{{ nifi_home }}/database_repository"
    nifi_flowfile_repository: "{{ nifi_home }}/flowfile_repository"
    nifi_content_repositories: [ "{{ nifi_home }}/content_repository" ]
    nifi_provenance_repositories: [ "{{ nifi_home }}/provenance_repository" ]
    
    # NiFi cluster settings
    nifi_single_node: True
    nifi_input_socket_host:
    nifi_input_socket_port:
    nifi_cluster_node_protocol_port:
    nifi_web_http_port: 8080
    
    # Queue swap settings
    nifi_queue_swap_threshold: 20000
    nifi_swap_in_threads: 1
    nifi_swap_out_threads: 4
    
    # Provenance settings
    nifi_provenance_implementation: VolatileProvenanceRepository
    nifi_provenance_max_storage_time: '24 hours'
    nifi_provenance_max_storage_size: '1 GB'
    nifi_provenance_rollover_time: '30 secs'
    nifi_provenance_rollover_size: '100 MB'
    nifi_provenance_query_threads: 2
    nifi_provenance_index_threads: 1
    nifi_provenance_repository_buffer_size: 100000
    
    # Status repository settings
    nifi_components_status_repository_buffer_size: 1440
    nifi_components_status_snapshot_frequency: '1 min'
    
    # NiFi zookeeper settings
    nifi_zookeeper_servers: []
    nifi_zookeeper_dir: /data/zookeeper
    nifi_state_management_embedded_zookeeper_start: False
    nifi_zookeeper_root_node: '/nifi'
    nifi_zookeeper_session_timeout: '10 seconds'
    nifi_zookeeper_autopurge_purgeInterval: 24
    nifi_zookeeper_autopurge_snapRetainCount: 30
    
    # Security settings
    nifi_initial_admin:
    nifi_is_secure: False

    # Logback logging levels and settings
    nifi_log_app_file_retention: 10
    nifi_log_user_file_retention: 10
    nifi_log_boot_file_retention: 10
    nifi_log_level_root: INFO
    nifi_log_level_org_apache_nifi: INFO
    nifi_log_level_org_apache_nifi_processors: WARN
    nifi_log_level_org_apache_nifi_processors_standard_LogAttribute: INFO
    nifi_log_level_org_apache_nifi_controller_repository: WARN
    nifi_log_level_org_apache_nifi_controller_repository_StandardProcessSession: WARN
    nifi_log_level_org_apache_nifi_cluster: INFO
    nifi_log_level_org_apache_nifi_server_JettyServer: INFO
    nifi_log_level_org_eclipse_jetty: INFO
    nifi_log_level_org_apache_nifi_web_security: INFO
    nifi_log_level_org_apache_nifi_web_api_config: INFO
    nifi_log_level_org_apache_nifi_authorization: INFO
    nifi_log_level_org_apache_nifi_cluster_authorization: INFO
    nifi_log_level_org_apache_nifi_bootstrap: INFO
    nifi_log_level_org_apache_nifi_bootstrap_Command: INFO
    nifi_log_level_org_apache_nifi_web_filter_RequestLogger: INFO
    nifi_log_level_org_wali: WARN
    nifi_custom_log_levels: []

Dependencies
------------

NiFi requires java

Example Playbook
----------------

Install and configure NiFi

    - name: Install nifi
      hosts: servers
      vars: 
          nifi_log_level_root: WARN
          nifi_node_jvm_memory: '10240M'
          nifi_custom_nars: [ '/usr/lib/extra-nars' ]
          nifi_single_node: False
          nifi_nodes_list: ['nifi-node-1', 'nifi-node-2']      
      roles:
        - role: nifi
          nifi_rpm_file: "/opt/nifi/nifi-assembly-{{ nifi_version }}.rpm"

License
-------

MIT

Author Information
------------------

[Asymmetrik, Ltd.](https://www.asymmetrik.com/)
