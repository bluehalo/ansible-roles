pip
===

An Ansible role to install Pip.

Requirements
------------

Assumes Debian/Ubuntu or RedHat OS family, and internet connectivity

Role Variables
--------------

    install_with_script: (Default: no). Instructs the tool to install Pip using the get-pip.py script. Otherwise, the role will use apt-get (Debian) or python's easy_install (Redhat).
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

