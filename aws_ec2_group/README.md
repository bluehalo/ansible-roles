aws_ec2_group
=============

An Ansible role to create AWS EC2 security groups. This a wrapper around the ec2_group module with sensible defaults.

Requirements
------------

- python >= 2.6
- boto

Role Variables
--------------

See [Ansible ec2 module documentation](http://docs.ansible.com/ansible/ec2_group_module.html) for complete details on these variables.

Required variables:

    # name of the security group
    aws_ec2_group_name:

    # list of security group rules (see the examples below)
    aws_ec2_group_rules:

Optional variables:

    # AWS region to use, required if aws_ec2_url is not used
    aws_region:

    # URL to connect to EC2, required if aws_region is not used
    aws_ec2_url:

    # boto profile
    aws_boto_profile:

    # ID of the VPC to create the group in
    aws_vpc_id:

    # description of the security group
    aws_ec2_group_description: "{{ aws_ec2_group_name }} ports"

    # whether to remove any existing rules on group that are not defined in aws_ec2_group_rules
    aws_ec2_group_purge_rules: False

    # whether to create tags for the group
    aws_ec2_group_create_tag: True

    # default tags to create, if aws_ec2_group_create_tag is True
    aws_ec2_group_default_tags:
      Name: "{{ aws_ec2_group_name }}"

    # extra tags to create, in addition to those in 'aws_ec2_group_default_tags', if aws_ec2_group_create_tag is True
    aws_ec2_group_tags: {}

Example Playbook
----------------

    - name: Create EC2 Security Groups
      hosts: localhost
      connection: local
      gather_facts: false
      vars:
        - public_cidr: 0.0.0.0/0
      roles:
        - name: "Create internal-open Security Group"
          role: aws_ec2_group
          aws_ec2_group_name: internal-open
          aws_ec2_group_rules:
            - { proto: all, cidr_ip: "{{ aws_subnet_cidr }}" }
          aws_region: us-east-1
          tags: internal-open
        - name: "Create ssh-public Security Group"
          role: aws_ec2_group
          aws_ec2_group_name: ssh-public
          aws_ec2_group_rules:
            - { proto: tcp, from_port: 22, to_port: 22, cidr_ip: "{{ public_cidr }}" }
          aws_region: us-east-1
          tags: ssh-public

License
-------

MIT

