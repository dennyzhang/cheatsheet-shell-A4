#!/usr/bin/env bash
##  @copyright 2018 DennyZhang.com
## Licensed under MIT 
##   https://www.dennyzhang.com/wp-content/mit_license.txt
##
## Author : Denny <https://www.dennyzhang.com/contact>
## Description :
## https://cheatsheet.dennyzhang.com/cheatsheet-shell-A4
## --
## Created : <2018-07-17>
## Updated: Time-stamp: <2018-10-06 16:39:25>
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
