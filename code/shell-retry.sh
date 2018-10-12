#!/usr/bin/env bash
## @copyright 2018 DennyZhang.com
## Licensed under MIT
## https://www.dennyzhang.com/wp-content/mit_license.txt
##
## Author : Denny <https://www.dennyzhang.com/contact>
## Description :
## https://cheatsheet.dennyzhang.com/cheatsheet-shell-A4
## --
## Created : <2018-07-17>
## Updated: Time-stamp: <2018-10-06 16:39:27>
##-------------------------------------------------------------------
function retry_command {
    local command=${1?}
    local timeout_seconds=${2?}
    local check_interval=${3:-"3"}
    n=0
    until [ "$n" -ge "$timeout_seconds" ]
    do
        if eval "$command" >/dev/null 2>&1; then
            return
        fi
        n=$((n+check_interval))
        echo "Sleep $check_interval seconds: $command"
        sleep "$check_interval"
    done
    echo "After waiting for $timeout_seconds seconds, it still fails"
    exit 1
}
