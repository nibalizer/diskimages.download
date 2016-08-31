#!/bin/bash

# Copy the "website" in to place
cp diskimages.download/index.html /var/www/html/diskimages/index.html

build_scripts='build_image_centos6.sh build_image_trusty.sh build_image_xenial.sh'

dib_types="qcow2 tar vhd docker aci raw"

if [ -d diskimage-builder ]; then
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

cd diskimage-builder
pip install -U .
cd ..



for script in $build_scripts
do
    for image_type in $dib_types
    do
	    date    > logs/${script}_${image_type}.log
	    ./diskimages.download/${script} ${image_type} >> logs/${script}_${image_type}.log
    done
done

