#!/bin/sh -l

echo "Deploying to Zendesk..."
FILE=.zat

STRING="\app_id\""

if [ -f "$FILE" ]; then
    echo "$FILE exists."
    if  grep -q "$STRING" "$FILE" ; then
         echo 'the string exists' ; 
         zat update
    else
         echo 'the string does not exist' ; 
    fi
else 
    echo "$FILE does not exist."
fi
