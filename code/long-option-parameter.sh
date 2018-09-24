#!/usr/bin/env bash
##  @copyright 2018 DennyZhang.com
## Licensed under MIT 
##   https://www.dennyzhang.com/wp-content/mit_license.txt
##
## Author : Denny <https://www.dennyzhang.com/contact>
## Description :
## --
## Created : <2018-07-17>
## Updated: Time-stamp: <2018-09-24 10:39:04>
##-------------------------------------------------------------------
set -e

skip_something="no"

for arg in "$@"
do
    case "$arg" in
        -s|--skip-something)
            shift
            skip_something="yes"
            ;;
        -h|--help)
            help
            shift
            exit 0
            ;;
        --)
            echo "break"
            shift
            break
            ;;
    esac
done
