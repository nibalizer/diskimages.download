#!/bin/bash
set -x

export DIB_DISTRIBUTION_MIRROR=http://mirrors.cat.pdx.edu/centos/

sudo ls # just to make sure sudo is hot

disk-image-create vm centos -a amd64 -o centos6_x64
