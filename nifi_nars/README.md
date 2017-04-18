Role Name
=========

This Ansible role installs and configures custom Apache NiFi nars.

Requirements
------------

- Role installs custom NiFi nars via rpm, and the rpm file must be accssible on the target system prior to executing this role
- Role assumes Apache NiFi 1.x

Role Variables
--------------

Required variables:

    # a unique identifier for these custom nars, in order to differentiate between multiple calls to this role
    nifi_nars_id

    # base directory where the custom nars are installed, for example /opt/myorg
    nifi_nars_base_dir

    # absolute path to the rpm file to be installed, must already be on the local server
    nifi_nars_rpm

    # subdirectory name under nifi_nars_base_dir containing the nar file(s)
    nifi_nars_dir

    # symlink to the current nars directory
    nifi_nars_symlink

    # NiFi conf directory
    nifi_conf_dir

Variables that can be overridden (nd their default values):

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
        - myorg_nifi_nars_base_dir: /opt/myorg/myorg-nifi-nars
        - myorg_nifi_nars_symlink: "{{ myorg_nifi_nars_base_dir }}/myorg-nifi-nars-current"
        - myorg_nifi_nars_rpm: "{{ myorg_nifi_nars_base_dir }}/myorg-nifi-nars-{{ myorg_nifi_nars_version }}.rpm"
        - nifi_version: 1.1.0
        - myorg_nifi_nars_version: 1.0.0

      roles:
        - name: Install nifi
          role: nifi
          nifi_rpm_file: "/opt/nifi/nifi-assembly-{{ nifi_version }}.rpm"

        - name: Install custom nifi nars
          role: nifi_nars
          nifi_nars_id: myorg
          nifi_nars_base_dir: "{{ myorg_nifi_nars_base_dir }}"
          nifi_nars_rpm: "{{ myorg_nifi_nars_rpm }}"
          nifi_nars_dir: "myorg-nifi-nars-{{ myorg_nifi_nars_version }}"
          nifi_nars_symlink: "{{ myorg_nifi_nars_symlink }}"

License
-------

MIT

Author Information
------------------

[Asymmetrik, Ltd.](https://www.asymmetrik.com/)
