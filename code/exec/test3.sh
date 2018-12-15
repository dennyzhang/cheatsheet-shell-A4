#!/usr/bin/env bash
set -e

function shell_exit {
    errcode=$?
    if [ $errcode -eq 0 ]; then
        echo "Action has been done successfully."
    else
        echo "Action has failed."
        exit 0
    fi
}

trap shell_exit SIGHUP SIGINT SIGTERM 0

sh -c "exec ./sub.sh"

sleep 100
echo "here"
