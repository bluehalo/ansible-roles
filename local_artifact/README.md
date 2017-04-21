Role Name
=========

An Ansible role for uploading an artifact from the local system. The main benefit of this role to pair with the
the ```repository_artifact``` role in a when clause to use either a "released" artifact from a repository or a local artifact.

Requirements
------------

None

Role Variables
--------------

The following variables should be passed to the role:

    local_artifact_id - an artifact identifier, used in output messages only

    local_artifact_src - local path to the file to be uploaded; overridden by ```local_artifact_srcglob```

    local_artifact_srcglob - local path glob, used in a with_fileglob loop; overrides ```local_artifact_src```

    local_artifact_dest - path where the artifact should be written to

Role uses register variable named ```local_artifact_result```

Example Playbook
----------------

Install and configure NiFi

    - name: Install nifi
      hosts: servers
      roles:
        - role: nifi

License
-------

MIT

Author Information
------------------

[Asymmetrik, Ltd.](https://www.asymmetrik.com/)
