# README #

## Developer Setup
These instructions assume you are developing on mac-osx

#### Python Virtual Environment
Run the following make command to initialize your env. If
prompted for password, enter your `sudo` password.  Close
and reopen your terminal session upon completion

    make init

#### Default login shells to {{ project_name }} environment
To activate the {{ project_name }} environment:

    pyenv activate $PROJECT_NAME

To deactivate a virtual environment, run the following

    deactivate

### Running unit tests
    make test

### To finish configuring your local dev environment with ansible (assumes that repo is cloned to ~/team_repos)

    cd ~/team_repos/$PROJECT_NAME/ansible
    ansible-playbook playbooks/dev_local_env.yml --limit localhost

    NOTE: Additionally it may be necessary to specify the following options:
      --vault-password   (specify a vault password file)
      --ask-become-pass  (prompt for sudo password on execution)
      --extra-vars "ansible_python_interpreter=/usr/bin/python2.7"

    For AWS workspace instances running AL2:
        cd ~/team_repos/$PROJECT_NAME/ansible-roles/dev_local_env/files/amazon_linux_2

        make init
            NOTE: May prompt for sudo login password
        Close terminal and open a new session

        cd ~/repos/$PROJECT_NAME/ansible/
        Create a file containing the ansible vault password in ~/.ansible_vault_pass.txt

        ansible-playbook playbooks/dev_local_env.yml --limit localhost --vault-password ~/.ansible_vault_pass.txt --ask-become-pass --extra-vars "ansible_python_interpreter=/usr/bin/python2.7"
            NOTE: May prompt for sudo login password

        Close terminal and open a new session

### Variables that can be configured as part of this role

## Makefile
    PROJECT_NAME: The project/team name for the group
    PYTHON_VERSION: The version of python to install
    PYENV_VERSION: The version of python virtual environment to install
    requirements.txt: This file can be updated to include specific pip based software/versions

## Ansible
    project_name: The project/team name for the group

    install_openjdk: True/False to install OpenJDK software.  Default is true.
    install_mongodb: True/False to install MongoDB software.  Default is true.
    install_elasticsearch: True/False to install Elasticsearch software.  Default is true.
    install_nvm: True/False to install NVM software.  Default is false.
    install_asdf: True/False to install ASDF software.  Default is true.

    openjdk_repo: Homebrew repo to tap for OpenJDK
    openjdk_package: Homebrew package name for OpenJDK
    openjdk_version: Version of OpenJDK

    mongodb_repo: Homebrew repo to tap for MongoDB
    mongodb_package: Homebrew package name for MongoDB
    mongodb_version: Version of MongoDB

    elasticsearch_version: Version of Elasticsearch
    elasticsearch_repo: URL for Elasticsearch download
    elasticsearch_install_dir: Installation directory for Elasticsearch

    nodejs_versions: Versions of Node.js to install for NVM

    asdf_plugins: Plugins to install for ASDF (ex. nodejs)

    asdf_packages: Package and versions to install for ASDF 
        Example: { package: '', version: x.x.x }

    npm_packages: Packages to install as part of NPM

    bashrc_location: Path for local bash profile (ex. ~/.bash_profile)
    zshrc_location: Path for local zshrc (ex. "~/.zshrc")
    path_value: System environment PATH variable

    additional_dev_packages: Additional Homebrew development packages to install

    git_repo_dest: Path to store locally cloned repos
    git_repo_sources: Remote repos to clone locally