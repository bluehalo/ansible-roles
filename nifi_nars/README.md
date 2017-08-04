nifi_nars
=========

This Ansible role configures custom Apache NiFi nars:

- creates a symlink to the nars
- optionally adds them to the NiFi configuration

Requirements
------------

- Custom NiFi nars must be accssible on the target system prior to executing this role
  - if RPM, the RPM must be installed
  - if tar.gz, they must be unarchived
- Role assumes Apache NiFi 1.x

Role Variables
--------------

Required variables:

    # base directory where the custom nars are installed, for example /opt/myorg
    nifi_nars_base_dir

    # subdirectory name under nifi_nars_base_dir containing the nar file(s)
    nifi_nars_dir

    # symlink to the current nars directory
    nifi_nars_symlink

    # NiFi conf directory - location of nifi.properties file; this can be reused from the nifi role
    nifi_conf_dir

Optional variables:

    # if specified the nars will be configured in nifi.properties, using this value as a unique identifier
    # if unspecified (default), the nars must be configured by other means (e.g. 'nifi_custom_nars' in nifi role)
    nifi_nars_id

Variables that can be overridden (and their default values):

    nifi_nars_user: nifi
    nifi_nars_group: nifi

Dependencies
------------

- Apache NiFi 1.x must be installed

Example Playbook
----------------

Install and configure NiFi, then install custom nars called "myorg-nifi-nars":

    - name: Install nifi and custom nars
      hosts: servers
      vars:
        - myorg_nifi_nars_local_src: /path/to/local/nars.rpm
        - myorg_nifi_nars_version: 1.0.0
        - myorg_nifi_nars_base_dir: /opt/myorg/myorg-nifi-nars
        - myorg_nifi_nars_rpm: "{{ myorg_nifi_nars_base_dir }}/myorg-nifi-nars-{{ myorg_nifi_nars_version }}.rpm"
        - myorg_nifi_nars_symlink: "{{ myorg_nifi_nars_base_dir }}/myorg-nifi-nars-current"

      roles:
        - name: Upload nars rpm from local system
          role: local_artifact
          local_artifact_src: "{{ myorg_nifi_nars_local_src }}"
          local_artifact_dest: "{{ myorg_nifi_nars_rpm }}"

        - name: Install nars via rpm
          role: rpm_install
          rpm_path: "{{ myorg_nifi_nars_rpm }}"
          when: local_artifact_result.changed

        - name: Configure nars
          role: nifi_nars
          nifi_nars_id: myorg
          nifi_nars_base_dir: "{{ myorg_nifi_nars_base_dir }}"
          nifi_nars_dir: "myorg-nifi-nars-{{ myorg_nifi_nars_version }}"
          nifi_nars_symlink: "{{ myorg_nifi_nars_symlink }}"

License
-------

MIT

