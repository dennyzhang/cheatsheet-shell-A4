#!/usr/bin/env bash
##  @copyright 2018 DennyZhang.com
## Licensed under MIT 
##   https://www.dennyzhang.com/wp-content/mit_license.txt
##
## Author : Denny <https://www.dennyzhang.com/contact>
## Description :
## --
## Created : <2018-07-17>
## Updated: Time-stamp: <2018-09-24 10:39:03>
##-------------------------------------------------------------------
set -e

function shell_exit {
    errcode=$?
    if [ $errcode -eq 0 ]; then
        echo "OK"
    else
        echo "ERROR"
    fi
}

trap shell_exit SIGHUP SIGINT SIGTERM 0
