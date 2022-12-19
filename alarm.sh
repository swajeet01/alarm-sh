#!/usr/bin/env bash

VERSION="1.0.2"
AUTHOR="Swajeet Swarnkar"

# Modify message shown when alarm goes off.
DONE_MSG="It's $1!"

usage() {
    echo "Basic terminal alarm utility, version $VERSION, author $AUTHOR."
    echo "Usage:    $0 <time>"
    echo "Arguments-"
    echo "<time>    time in hh:mm format (24 hr)"
}

[[ $# -ne 1 ]] && usage && exit 64

[[ ! $1 =~ ^([01][0-9]|2[0-3]):[0-5][0-9]$ ]] && echo "Bad time parameter \"$1\"" && exit 64

echo "Alarm set for $1."

while [[ $(date "+%H:%M") != $1 ]]; do
    sleep 5
done

# Rings terminal bell
tput bel

# Uncomment if you want `wall` message
# wall $DONE_MSG

echo $DONE_MSG

