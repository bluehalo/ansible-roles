SHELL:=/bin/bash
export PROJECT_NAME=dev
export PYTHON_VERSION=3.7
export PYENV_VERSION=3.7.10

define PYENV_INIT
#### Begin ${PROJECT_NAME} Makefile Changes ####
alias ll='ls -la'
export DEV_FOLDER="$$HOME/team_repos"
export PYENV_ROOT="$$HOME/.pyenv"
export PATH="$$PYENV_ROOT/bin:$$PATH"
eval "$$(pyenv init --path)"
eval "$$(pyenv init -)"
eval "$$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
pyenv activate ${PROJECT_NAME}
##### End ${PROJECT_NAME} Makefile Changes ####
endef
export PYENV_INIT

init:
	echo "$$PYENV_INIT" && \
	( grep -q '${PROJECT_NAME}' ~/.bashrc || \
	echo "$$PYENV_INIT" >> ~/.bashrc ) && \
	( grep -q '${PROJECT_NAME}' ~/.zshrc || \
	echo "$$PYENV_INIT" >> ~/.zshrc ) && \
	sudo yum groupinstall -y "Development Tools" && \
    sudo yum install -y zlib-devel bzip2 bzip2-devel readline-devel sqlite \
    sqlite-devel openssl-devel xz xz-devel libffi-devel && \
	ls ~/.pyenv || git clone https://github.com/pyenv/pyenv.git ~/.pyenv && \
	ls ~/.pyenv/plugins/pyenv-virtualenv || git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv && \
	source ~/.bashrc && \
	( pyenv install $$PYENV_VERSION || true ) && \
	( pyenv virtualenv $$PYENV_VERSION $$PROJECT_NAME || true ) && \
	source ~/.bashrc && \
	pip install --upgrade pip && \
	( pip install -r ./requirements.txt || true ) && \
	mkdir ~/.mitogen && \
	( ln -s ~/.pyenv/versions/$$PYENV_VERSION/lib/python$$PYTHON_VERSION/site-packages/ansible_mitogen ~/.mitogen/ansible_mitogen || true ) && \
	printf "\n ---- MAKE INIT COMPLETE: PLEASE EXIT YOUR TERMINAL AND OPEN A NEW SESSION ----\n"

test:
	python -m unittest discover ansible/tests -vvv
