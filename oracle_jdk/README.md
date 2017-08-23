oracle_jdk
==========

An Ansible role to install Oracle JDK via rpm.

Requirements
------------

Assumes RedHat OS family

Role Variables
--------------

    # complete path to RPM on the local filesystem
    oracle_jdk_rpm_local_src:

    # complete path to RPM on the remote filesystem
    oracle_jdk_rpm_dest:

Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: Install Oracle JDK
          role: oracle_jdk
          oracle_jdk_rpm_local_src: /local/path/to/rpm
          oracle_jdk_rpm_dest: /remote/path/to/rpm

License
-------

MIT

