#!/bin/bash
set -xue

image_type=$1

export DIB_DISTRIBUTION_MIRROR=http://mirrors.cat.pdx.edu/ubuntu

sudo ls # just to make sure sudo isn't cold

disk-image-create vm ubuntu-minimal -t $image_type -a amd64 -o xenial_x64

mv /var/www/html/diskimages/xenial_x64.$image_type /var/www/html/diskimages/xenial_x64_1.$image_type
mv xenial_x64.$image_type /var/www/html/diskimages
