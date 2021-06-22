# README #

## Developer Setup
These instructions assume you are developing on mac-osx

#### Python Virtual Environment
Run the following make command to initialize your env. If
prompted for password, enter your `sudo` password.

    make init

#### Default login shells to {{ project_name }} environment
To activate the {{ project_name }} environment:

    pyenv activate $PROJECT_NAME

To deactivate a virtual environment, run the following

    deactivate

### Running unit tests
    make test

### To finish configuring your local dev environment with ansible

    cd ~/team_repos/$PROJECT_NAME/ansible
    ansible-playbook playbooks/dev_local_env.yml --limit localhost

### Variables that can be configured as part of this role

## Makefile
    PROJECT_NAME: The project/team name for the group

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