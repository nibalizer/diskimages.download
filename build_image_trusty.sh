#!/bin/bash
set -xue

image_type=$1

export DIB_DISTRIBUTION_MIRROR=http://mirrors.cat.pdx.edu/ubuntu

sudo ls # just to make sure sudo is hot

disk-image-create vm ubuntu-minimal -t $image_type -a amd64 -o trusty_x64

mv /var/www/html/diskimages/trusty_x64.$image_type /var/www/html/diskimages/trusty_x64_1.$image_type
mv trusty_x64.$image_type /var/www/html/diskimages/
