#!/bin/bash
export PROJECT_NAME=dev
export PYENV_VERSION=3.7.10
export PYTHON_VERSION=3.7

# Setup yum dependencies and clone pyenv repos
sudo mount -o remount,exec /tmp && \
sudo yum install -y @development git zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel xz xz-devel libffi-devel findutils && \
ls ~/.pyenv || git clone https://github.com/pyenv/pyenv.git ~/.pyenv && \
ls ~/.pyenv/plugins/pyenv-virtualenv || git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

# Setup the user files
if ! grep -Fxq "PYENV_ROOT" ~/.bash_profile; then
    sed -Ei -e '/^([^#]|$)/ {a \
export PYENV_ROOT="$HOME/.pyenv"
a \
export PATH="$PYENV_ROOT/bin:$PATH"
a \
    ' -e ':a' -e '$!{n;ba};}' ~/.bash_profile && \
    echo 'eval "$(pyenv init --path)"' >> ~/.bash_profile
fi
if ! grep -Fxq "PYENV_ROOT" ~/.profile; then
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile && \
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile && \
    echo 'eval "$(pyenv init --path)"' >> ~/.profile
fi
if ! grep -Fxq "pyenv init" ~/.bashrc; then
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc
fi
source ~/.bash_profile  # Turn on pyenv

# Pyenv tasks
pyenv install $PYENV_VERSION || true && \
pyenv virtualenv $PYENV_VERSION $PROJECT_NAME || true && \
pip install --upgrade pip && \
pip install -r ./requirements.txt && \
ln -sf ~/.pyenv/versions/$PYENV_VERSION/lib/python$PYTHON_VERSION/site-packages ~/.mitogen && \
cd ~/.pyenv && src/configure && make -C src  # Optimize pyenv

printf "\n---- DEV SETUP COMPLETE ----\n"
