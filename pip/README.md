pip
===

An Ansible role to install Pip.

Requirements
------------

Assumes RedHat OS family, and internet connectivity

Role Variables
--------------

    install_with_script: no
    pip_url: https://bootstrap.pypa.io/get-pip.py
    pip_script: get-pip.py
    pip_download_dir: /tmp

Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: Install pip
          role: pip

License
-------

MIT

