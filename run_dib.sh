#!/bin/bash

build_scripts='build_image_centos6.sh'

if [ -d diskimage-buidler ]; then
    cd diskimage-builder
    git pull
    cd ..
else
    git clone https://git.openstack.org/openstack/diskimage-builder
fi

if [ -d venv ]; then
    source venv/bin/activate
else
    virtualenv venv
    source venv/bin/activate
    pip install -U pip
fi

for script in build_scripts
do
    date    > logs/${script}.log
    $script >> logs/${script}.log
done
