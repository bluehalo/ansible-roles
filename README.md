# ansible-roles

Reusable Ansible roles

# System Requirements

These roles have only been tested with:

* Mac OS X 10.12 (Sierra)
* Ansible versions:
  * 2.1.1.0
  * 2.3.0.0

In addition, some of the roles specifically target the RedHat OS family,
including CentOS and Amazon Linux, and may not function for other host OS's.

Other roles may assume EC2 dynamic inventory.

If you are interested in other versions or functionality, please provide patches.

# Getting Started

Each role contains a README describing its usage.

# Developer Guide

To create a new role:

1. Create a new role skeleton

```
$ ansible-galaxy init rolename
```

This creates a directory structure like:

    rolename/
        .travis.yml
        README.md
        defaults/
        files/
        handlers/
        meta/
        tasks/
        templates/
        tests/
        vars/

2. Implement role functionality

The following links as guides for best practices in creating the role:

* https://galaxy.ansible.com/intro#share
* https://openedx.atlassian.net/wiki/display/OpenOPS/Ansible+Code+Conventions

Be sure to fill-in the template README.md file

To test your new role:

1. Test syntax

```
$ ansible-playbook -i rolename/tests/inventory rolename/tests/test.yml --syntax-check
```

2. Execute role and validate - this may not be possible locally and may require a container

```
$ ansible-playbook -i rolename/tests/inventory rolename/tests/test.yml --connection=local --sudo
```

3. Execute role again and verify idempotence

```
$ ansible-playbook -i rolename/tests/inventory rolename/tests/test.yml --connection=local --sudo \
  | grep -q 'changed=0.*failed=0' && (echo 'Idempotence test: pass' && exit 0) \
  || (echo 'Idempotence test: fail' && exit 1)
```

