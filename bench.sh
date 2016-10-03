#!/bin/sh

COMMAND=$1
FILE=$2
MAX=$3
for i in `seq 1 $MAX`; do
    $COMMAND $FILE >/dev/null
done
