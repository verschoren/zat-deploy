#!/bin/sh -l

echo "Deploying to Zendesk..."
FILE=.zat
STRING="app_id"

if [ -f "$FILE" ]; then
    echo "$FILE exists."
    if [ ! -z $(grep "$STRING" "$FILE") ]; then 
        echo "FOUND"
        zat update
    else 
        echo "NOT FOUND" 
    fi
else 
    echo "$FILE does not exist."
fi
