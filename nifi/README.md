nifi
====

Use this role to install, configure, and manage Apache NiFi.

Requirements
------------

- Role has only been tested with CentOS 7.
- Role installs NiFi via rpm, and the rpm file must be accssible on the target system prior to executing this role

Role Variables
--------------

Variables that can be specified are:

    nifi_rpm_file: location of the rpm file to be installed

    nifi_install_rpm: boolean controls whether to update the rpm install or not, defaults to True

    # nifi_extra_args is a list of key/value pairs that are made available in NiFi, for example:
    nifi_extra_args:
      - file.encoding: "UTF-8"
      - environment: "{{ env }}"


Default variables are listed below:

    nifi_base_dir: /opt/nifi
    nifi_home: "{{ nifi_base_dir }}/nifi-current"
    nifi_conf_dir: "{{ nifi_home }}/conf"
    nifi_log_dir: /var/log/nifi
    nifi_pid_dir: /var/run/nifi
    nifi_pid_file: "{{ nifi_pid_dir }}/nifi.pid"

    # number of log files to keep
    nifi_log_retention: 10
    nifi_custom_log_levels: []

Dependencies
------------

NiFi requires java

Example Playbook
----------------

Install and configure NiFi

    - name: Install nifi
      hosts: servers
      roles:
        - role: nifi
          nifi_rpm_file: "/opt/nifi/nifi-assembly-{{ nifi_version }}.rpm"

License
-------

MIT

Author Information
------------------

[Asymmetrik, Ltd.](https://www.asymmetrik.com/)
