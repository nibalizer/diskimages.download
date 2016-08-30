#!/bin/bash
set -x

export DIB_DISTRIBUTION_MIRROR=http://mirrors.cat.pdx.edu/ubuntu

sudo ls # just to make sure sudo is hot

disk-image-create vm centos -a amd64 -o centos6_x64

mv /var/www/html/diskimages/centos6_x64.qcow2 /var/www/html/diskimages/centos6_x64_1.qcow2
mv centos6_x64.qcow2 /var/www/html/diskimages/
