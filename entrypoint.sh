#!/bin/sh -l

echo "Deploying to Zendesk..."
FILE=.zat

if [ -f "$FILE" ]; then
    echo "$FILE exists."
    if [ ! -z $(grep "password" "$FILE") ]; then 
        zat update
    else 
        echo "NOT FOUND" 
    fi
else 
    echo "$FILE does not exist."
fi
