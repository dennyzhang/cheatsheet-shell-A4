#!/usr/bin/env bash
##-------------------------------------------------------------------
## @copyright 2017 DennyZhang.com
## Licensed under MIT 
##   https://www.dennyzhang.com/wp-content/mit_license.txt
##
## Author : Denny <https://www.dennyzhang.com/contact>
## Description :
## https://cheatsheet.dennyzhang.com/cheatsheet-shell-A4
## --
## Created : <2017-10-17>
## Updated: Time-stamp: <2018-10-06 16:39:27>
##-------------------------------------------------------------------
set -e
eth0_ip=$(/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')
export eth0_ip
