local_artifact
==============

An Ansible role for uploading an artifact from the local system. The main benefit of this role to pair with the
the ```repository_artifact``` role in a when clause to use either a "released" artifact from a repository or a local artifact.

Requirements
------------

None

Role Variables
--------------

The following variables should be passed to the role:

    local_artifact_src - local path to the file to be uploaded; overridden by ```local_artifact_srcglob```

    local_artifact_srcglob - local path glob, used in a with_fileglob loop; overrides ```local_artifact_src```

    local_artifact_dest - path where the artifact should be written to

Role sets the following register variables:

    local_artifact_result - when local_artifact_src is passed

    local_artifact_glob_result - when local_artifact_srcglob is passed

Example Playbook
----------------

Retrieve an artifact from either localhost or Maven Central based on
```use_local_artifact``` variable:

    - name: Get foo artifact from repository
      hosts: servers
      vars:
        - foo_version: 1.0.0-SNAPSHOT
        - foo_local_src: /path/to/local/foo.rpm
        - foo_dest: "/opt/foo/foo-{{ foo_version }}.rpm"
        - maven_repository_url: "http://repo1.maven.org/maven2"
      roles:
        - name: Get foo rpm from repository
          role: maven_repository_artifact
          maven_repository_artifact_group: org.example
          maven_repository_artifact_version: "{{ foo_version }}"
          maven_repository_artifact_extension: rpm
          maven_repository_artifact_classifier: bin
          maven_repository_artifact_dest: "{{ foo_dest }}"
          when: local_artifact is undefined

        - name: Get locally-built foo rpm
          role: local_artifact
          local_artifact_src: "{{ foo_local_src }}"
          local_artifact_dest: "{{ foo_dest }}"
          when: local_artifact is defined

        # example of using the retrieved rpm in a subsequent role
        - name: Install and configure retrieved foo rpm
          role: foo_install
          foo_path: "{{ foo_dest }}"
          when: (maven_repository_artifact_result is defined and maven_repository_artifact_result.changed) or
                (local_artifact_result is defined and local_artifact_result.changed)

License
-------

MIT

