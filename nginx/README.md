nginx
=====

Installs and configures Nginx for RedHat systems. Differs from other available roles in that it has hooks for configuring SSL and basic auth, and attempts to simplify create reverse proxies.

Requirements
------------

Assumes a RedHat OS

Role Variables
--------------

See defaults/main.yml for a complete list.

Example Playbook
----------------

Creates a reverse proxy for ui.example.com forwarding to {{ ui_host }}:8080 with basic auth.

    - name: Install nginx
      hosts: servers
      vars:
        - domain: example.com
      roles:
        - role: nginx
          nginx_enable_ssl: true
          nginx_configure_selinux: true
          nginx_basic_auth_file: files/htpasswd
          nginx_servers:
            - name: ui
              server_name: "ui.{{ domain }}"
              proxy: "{{ webserver_host }}:8080"
              basic_auth: true

License
-------

MIT

