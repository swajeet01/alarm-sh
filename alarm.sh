#!/usr/bin/env bash

VERSION="1.0.0"
AUTHOR="Swajeet Swarnkar"

DONE_MSG="It's $1!"

usage() {
    echo "Basic terminal alarm utility, version $VERSION, author $AUTHOR."
    echo "Usage:    $0 <time>"
    echo "Arguments-"
    echo "<time>    time in hh:mm format (24 hr)"
}

if [[ $# -ne 1 ]] then
    usage
    exit 64
fi

echo "Alarm set for $1."

while [[ $(date "+%H:%M") != $1 ]] do
    sleep 5
done

# Rings terminal bell
tput bel

# Uncomment if you want `wall` message
# wall $DONE_MSG

echo $DONE_MSG

