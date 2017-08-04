sonar
=====

An Ansible role to install and configure [SonarQube](https://www.sonarqube.org/)

Requirements
------------

Assumes RedHat OS family, installing packages from yum.

Role Variables
--------------

Variables that can be passed to this role and their default values are as follows.

	sonar_yum_repo_url: http://downloads.sourceforge.net/project/sonar-pkg/rpm

	sonar_user: sonar
	sonar_group: sonar

	sonar_home: /opt/sonar
	sonar_data_dir: /data/sonar
	sonar_log_dir: /var/log/sonar

	java_path: /usr/bin/java

	sonar_jdbc_url: jdbc:postgresql://localhost/sonar
	sonar_db_name: sonar
	sonar_db_username: sonar
	sonar_db_password: sonar

Dependencies
------------

- postgresql
- openjdk

Example Playbook
----------------

    - name: Example Playbook
      hosts: servers
      roles:
        - name: Install sonar
          role: sonar

License
-------

MIT

