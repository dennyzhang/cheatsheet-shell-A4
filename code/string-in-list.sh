#!/usr/bin/env bash
## @copyright 2018 DennyZhang.com
## Licensed under MIT
## https://www.dennyzhang.com/wp-content/mit_license.txt
##
## Author : Denny <https://www.dennyzhang.com/contact>
## Description :
## --
## Created : <2018-07-17>
## Updated: Time-stamp: <2018-09-24 10:39:03>
##-------------------------------------------------------------------
IAAS_TYPE="gcp|aws"
TYPE="gcp"

if [[ "gcp|aws" == *${TYPE}* ]]; then
    echo "yes"
else
    echo "no"
fi
