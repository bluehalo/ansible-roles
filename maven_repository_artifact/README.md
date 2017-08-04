maven_repository_artifact
=========================

An Ansible role that is a wrapper around the [maven_artifact](http://docs.ansible.com/ansible/maven_artifact_module.html)
role to simplify downloading an artifact from a Maven repository. The main benefit of this role to extract URL, authentication
and security settings so that they can be specified as group_vars or play vars, rather than needing to specify as parameters on every
invocation.

Requirements
------------

The maven_artifact role requires python-lxml on the host system

Role Variables
--------------

The following variables should be set as group_vars:

    maven_repository_url - URL of the Maven repository
    maven_repository_username - omitted by default
    maven_repository_password - omitted by default
    maven_repository_validate_certs - boolean whether to validate SSL certs, omitted by default (in which case maven_artifact role
 will validate certs)

The following variables should be passed to the role:

    maven_repository_artifact_group - Maven groupId coordinate
    maven_repository_artifact_id - Maven artifactId coordinate
    maven_repository_artifact_version - Maven version coordinate, omitted by default
    maven_repository_artifact_extension - Maven type/extension coordinate, omitted by default
    maven_repository_artifact_classifier - Maven classifier coordinate, omitted by default
    maven_repository_artifact_dest - path where the artifact should be written to

Role uses register variable named ```maven_repository_artifact_result```

Example Playbook
----------------

Retrieve an artifact from Maven Central:

    - name: Get foo artifact from repository
      hosts: servers
      vars:
        - maven_repository_url: "http://repo1.maven.org/maven2"
      roles:
        - role: maven_repository_artifact
          maven_repository_artifact_group: org.example
          maven_repository_artifact_id: foo
          maven_repository_artifact_version: "{{ foo_version }}"
          maven_repository_artifact_extension: rpm
          maven_repository_artifact_classifier: bin
          maven_repository_artifact_dest: "{{ foo_base_dir }}/foo-{{ foo_version }}.rpm"

License
-------

MIT

