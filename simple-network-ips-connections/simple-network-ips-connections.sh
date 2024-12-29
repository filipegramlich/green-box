#!/usr/bin/env bash

echo "Simple Network Connections Scanner"


# -z string -> leght == 0 (zero) ?

if [ -z "$1" ]; then
    echo "In this script is required the argument"
    exit 1
fi


ipNetwork=$1

nmap -sn -n $ipNetwork.0/24 -oG - | awk '/Status: Up/{print $2}'

# with -sn we're doing a simple ping verification s-> scan / n -> no port scan
# -n disable the DNS names resolution / n - no DNS resolution
# -oG -  -> output grepable
# awk it's  just the tool name used to text manipulation
