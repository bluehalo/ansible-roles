#!/bin/bash
export PROJECT_NAME=dev
export PYENV_VERSION=3.7.10
export PYTHON_VERSION=3.7

# Setup yum dependencies and clone pyenv repos
sudo mount -o remount,exec /tmp && \
sudo yum install -y @development git zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel xz xz-devel libffi-devel findutils && \
ls ~/.pyenv || git clone https://github.com/pyenv/pyenv.git ~/.pyenv && \
ls ~/.pyenv/plugins/pyenv-virtualenv || git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

# Activate Pyenv manually (adding to bashrc and then sourcing does not work)
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# Create Python virtualenv
pyenv install $PYENV_VERSION || true && \
pyenv virtualenv $PYENV_VERSION $PROJECT_NAME || true

# Install Python dependencies
pyenv activate $PROJECT_NAME && \
python -m pip install --upgrade --force-reinstall pip virtualenv && \
python -m pip install -r ./requirements.txt && \
ln -sf ~/.pyenv/versions/$PYENV_VERSION/lib/python$PYTHON_VERSION/site-packages ~/.mitogen && \
cd ~/.pyenv && src/configure && make -C src  # Optimize pyenv 

# Add Pyenv to the bashrc
if ! grep -Fq "PYENV_ROOT" ~/.bashrc; then
    printf "\n" >> ~/.bashrc && \
    echo '# Setup pyenv and pyenv-virtualenv"' >> ~/.bashrc && \
    echo 'export PYENV_ROOT=$HOME/.pyenv' >> ~/.bashrc && \
    echo 'export PATH=$PYENV_ROOT/bin:$PATH' >> ~/.bashrc && \
    echo 'eval "$(pyenv init --path)"' >> ~/.bashrc && \
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc && \
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc && \
    echo 'export PYENV_VIRTUALENV_DISABLE_PROMPT=1' >> ~/.bashrc
fi

printf "\n---- DEV SETUP COMPLETE ----\n"
