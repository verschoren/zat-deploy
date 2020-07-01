#!/bin/sh -l

echo "Deploying to Zendesk..."
FILE=.zat

STRING="\app_id\""

if  grep -q "$STRING" "$FILE" ; then
    echo 'the string exists' ; 
    zat update
else
    echo 'the string does not exist' ; 
fi
