aws_ec2_instance
================

An Ansible role to create AWS EC2 instances. This a wrapper around the ec2 module with sensible defaults.

Requirements
------------

- python >= 2.6
- boto

Role Variables
--------------

See [Ansible ec2 module documentation](http://docs.ansible.com/ansible/ec2_module.html) for complete details on these variables.

Required variables:

    # Instance type to use for the instance
    aws_ec2_instance_type

    # AMI ID to use for the instance
    aws_ec2_instance_ami

Optional variables:

    # AWS region to use, required if aws_ec2_url is not used
    aws_region:

    # URL to connect to EC2, required if aws_region is not used
    aws_ec2_url:

    # boto profile
    aws_boto_profile:

    # the subnet ID in which to launch the instance (VPC)
    aws_vpc_subnet_id:

    # security group name, or list of group names
    aws_ec2_instance_security_groups: []

    # a list of dictionaries of volumes to add to the new instance
    aws_ec2_instance_volumes: []

    # whether to assign a public IP address provisioning within vpc
    aws_ec2_instance_assign_public_ip: yes

    # AWS availability zone in which to launch the instance
    aws_ec2_instance_availability_zone:

    # Used with 'exact_count' to determine how many nodes based on a specific tag criteria should be running
    aws_ec2_instance_count_tag:
    # how many instances that matching the 'count_tag' parameter should be running
    aws_ec2_instance_exact_count:

    # IAM instance profile name to use
    aws_ec2_instance_profile:

    # dictionary of tags to add to the new instance
    aws_ec2_instance_tags:

    # whether to enable termination protection
    aws_ec2_instance_termination_protection: no

    # whether to wait for the instance to reach its desired state before returning
    aws_ec2_instance_wait: no
    # wait timeout in seconds
    aws_ec2_instance_wait_timeout: 300

Example Playbook
----------------

Create a single webserver instance:

    - name: Create EC2 VM's
      hosts: localhost
      connection: local
      gather_facts: false
      roles:
        - name: Create single webserver instance
          role: aws_ec2_instance
          aws_ec2_instance_type: t2.micro
          aws_ec2_instance_ami: ami-xxxxxxxx
          aws_region: us-east-1
          aws_ec2_instance_availability_zone: us-east-1d
          aws_vpc_subnet_id: subnet-xxxxxxxx
          aws_ec2_instance_profile: MY_IAM_PROFILE
          aws_ec2_instance_exact_count: 1
          aws_ec2_instance_count_tag:
            type: "webserver"
          aws_ec2_instance_tags:
            Name: "my-webserver"
            type: "webserver"
          aws_ec2_instance_security_groups:
            - ssh-public
            - webserver
          aws_ec2_instance_volumes:
            - { device_name: /dev/sdb, volume_type: gp2, volume_size: 50, delete_on_termination: true }
          aws_ec2_instance_termination_protection: yes
          tags: webserver

License
-------

MIT

