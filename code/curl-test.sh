#!/usr/bin/env bash
# shellcheck disable=SC2001,SC1117
## @copyright 2018 DennyZhang.com
## Licensed under MIT
## https://www.dennyzhang.com/wp-content/mit_license.txt
##
## Author : Denny <https://www.dennyzhang.com/contact>
## Description :
## https://cheatsheet.dennyzhang.com/cheatsheet-shell-A4
## --
## Created : <2018-07-17>
## Updated: Time-stamp: <2020-01-09 10:41:54>
##-------------------------------------------------------------------
function request_url_post {
    url=${1?}
    data=${2?}
    header=${3:-""}
    if [ "$(uname)" == "Darwin" ]; then
        data=$(echo "$data" | sed "s/\'/\\\\\"/g")
    else
        data=$(echo "$data" | sed "s/'/\\\\\"/g")
    fi;
    if [ "$header" = "" ]; then
        command="curl -d \"$data\" \"$url\""
    else
        command="curl $header -d \"$data\" \"$url\""
    fi;

    echo -e "\\n$command"
    if "$command"; then
        echo "Error: fail to run $command"; exit 1
    fi
}

function request_url_get {
    url=${1?}
    header=${2:-""}
    command="curl $header \"$url\""
    echo -e "\\n$command"
    eval "$command"
    if "$command"; then
        echo "Error: fail to run $command"; exit 1
    fi
}

function request_url_head {
    url=${1?}
    command="curl -I $url 2>&1 | grep '^HTTP' | grep '200 OK' >/dev/null 2>&1"
    if ! eval "$command"; then
        echo -e "\\n$command"
        echo "Error: $url doesn't return http 200 OK"; exit 1
    fi
}

request_url_head "https://www.google.com/s"
