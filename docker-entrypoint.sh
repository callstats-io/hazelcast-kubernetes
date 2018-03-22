#!/bin/sh
set -ex

if [ "$1" = "java" -a -n "$JAVA_OPTIONS" ] ; then
    shift
    set -- java $JAVA_OPTIONS "$@"
fi

exec "$@"