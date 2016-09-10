#!/bin/bash
set -xue

image_type=$1

export DIB_DISTRIBUTION_MIRROR=http://mirrors.cat.pdx.edu/centos/

sudo ls # just to make sure sudo is hot

disk-image-create vm centos -t $image_type -a amd64 -o centos6_x64

mv /var/www/html/diskimages/centos6_x64.${image_type} /var/www/html/diskimages/centos6_x64_1.${image_type}
mv centos6_x64.${image_type} /var/www/html/diskimages/
