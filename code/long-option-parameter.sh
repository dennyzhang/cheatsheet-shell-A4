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
## Updated: Time-stamp: <2018-12-16 22:30:13>
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

echo "skip_something: $skip_something"
