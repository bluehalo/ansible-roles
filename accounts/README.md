accounts
========

An Ansible role to create and delete user accounts.

Requirements
------------

Assumes a Unix/Linux OS, and has only been tested on the RedHat OS family.
Requires ansible 2.6.x for new "include_task" syntax.

Role Variables
--------------

This role uses 2 lists to control the user accounts to be created and deleted.
These variables should be configured as group_vars.

To create user accounts, configure a list like the following:

    accounts_create_users:
      - username: john
        name: John Lennon
        uid: 1001
        groups: [wheel]
        admin: yes
        ssh_key:
          - "ssh-rsa ......."
      - username: paul
        name: Paul McCartney
        admin: yes
        ssh_key:
          - "ssh-rsa ......."
      - username: george
        name: George Harrison
        admin: no
        ssh_key:
          - "ssh-rsa ......."

To delete previously created user accounts, configure a list of their names like the following:

    accounts_delete_users: [ ringo ]

Other variables that can be passed to this role and a brief description about
them are as follows.

    # base directory for all users' home directories
    accounts_home_root: /home/
    # default shell for all users
    accounts_shell: /bin/bash
    # default umask
    accounts_umask: "022"
    # optional: override to add a prefix to users' prompts (enclosed square brackets and followed by a space)
    #accounts_prompt_prefix: 
    # whether to create a home directory for the user
    accounts_createhome: yes

    # Password aging controls set in /etc/login.defs:

    # Maximum number of days a password may be used.
    accounts_pass_max_days: 99999
    # Minimum number of days allowed between password changes.
    accounts_pass_min_days: 1
    # Minimum acceptable password length.
    accounts_pass_min_len: 14
    # Number of days warning given before a password expires.
    accounts_pass_warn_age: 14
    # Number of days of inactivity after a password has expired before the account is locked;
    # -1 will remove an account's inactivity
    accounts_inactive_days: -1
    # Date or number of days since January 1, 1970 on which the user's account will no longer be accessible;
    # -1 will remove an account expiration date
    accounts_expire_date: -1

    # Whether to restore default SELinux security contexts on user home dir, default is true
    selinux_enabled: true

Example Playbook
----------------

Create user accounts with a more restrictive umask:

    - name: Perform Initialization
      become: yes
      become_method: sudo
      remote_user: "{{ remote_user | default(omit) }}"
      hosts: servers
      roles:
        - name: Configure User Accounts
          role: accounts
          accounts_umask: "077"

License
-------

MIT

