#!/bin/bash
set -x

export DIB_DISTRIBUTION_MIRROR=http://mirrors.cat.pdx.edu/ubuntu

sudo ls # just to make sure sudo isn't cold

disk-image-create vm ubuntu-minimal -a amd64 -o xenial_x64

mv /var/www/html/diskimages/xenial_x64.qcow2 /var/www/html/diskimages/xenial_x64_1.qcow2
mv xenial_x64.qcow2 /var/www/html/diskimages
