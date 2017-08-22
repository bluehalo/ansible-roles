mounts
======

An Ansible role to configure system mounts.

Role Variables
--------------

Role requires a 'mounts_devices' list, containing each mount device, like the following:

    mounts_devices:
        - name: /var/log
          src: /dev/xvdb
          fstype: ext4
          opts: 'defaults,nofail'
          state: mounted
        - name: /data
          src: /dev/xvdc
          fstype: ext4
          opts: 'defaults,nofail'
          state: mounted

Other variables that can be passed to this role and a brief description about
them are as follows.

    # previously-mounted devices, empty by default; this will skip creation of
    # the filesystem for the named devices
    mounts_mounted: []

    mounts_log_directory: /var/log

    # these defaults are used if not specified in mounts_devices
    mounts_default_opts: defaults
    mounts_default_state: mounted
    mounts_default_dump: 0
    mounts_default_passno: 0
    mounts_default_fstab: /etc/fstab

    # Whether to perform selinux-specific configuration, default is true
    selinux_enabled: true

Example Playbook
----------------

    - name: Configure System Mounts
      hosts: servers
      become: yes
      become_method: sudo
      roles:
        - name: Mount Webserver Devices
          role: mounts
          mounts_devices:
            - name: /var/log
              src: /dev/xvdb
              fstype: ext4
              opts: 'defaults,nofail'
              state: mounted

License
-------

MIT

