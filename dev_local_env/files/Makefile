SHELL:=/bin/bash
PYENV_VERSION="2.7.16"
PYTHON_VERSION="2.7"

define PYENV_INIT
export PROJECT_NAME="---- Enter team name here ----"
#### Begin $$PROJECT_NAME Makefile Changes ####
alias ll='ls -la'
eval "$$(pyenv init --path)"
eval "$$(pyenv init -)"
eval "$$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
pyenv activate $$PROJECT_NAME
##### End $$PROJECT_NAME Makefile Changes ####
endef
export PYENV_INIT

init:
	( grep -q $$PROJECT_NAME ~/.bash_profile || \
	echo "$$PYENV_INIT" >> ~/.bash_profile ) && \
	( grep -q $$PROJECT_NAME ~/.zshrc || \
	echo "$$PYENV_INIT" >> ~/.zshrc ) && \
	brew ls --versions git || brew install git && \
	brew ls --versions pyenv || brew install pyenv && \
	brew ls --versions pyenv-virtualenv || brew install pyenv-virtualenv && \
	( pyenv install $$PYENV_VERSION || true ) && \
	( pyenv virtualenv $$PYENV_VERSION $$PROJECT_NAME || true ) && \
	source ~/.bash_profile && \
	pip install --upgrade pip && \
	( pip install -r ./requirements.txt || true ) && \
	( ln -s ~/.pyenv/versions/$$PYENV_VERSION/envs/$$PROJECT_NAME/lib/python$$PYTHON_VERSION/site-packages/ansible_mitogen ~/.mitogen/ansible_mitogen || true ) && \
	printf "\n ---- MAKE INIT COMPLETE: PLEASE EXIT YOUR TERMINAL AND OPEN A NEW SESSION ----\n"

test:
	python -m unittest discover ansible/tests -vvv