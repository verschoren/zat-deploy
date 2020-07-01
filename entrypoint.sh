#!/bin/sh -l

echo "Deploying to Zendesk..."
FILE=/.zat

if [ -f "$FILE" ]; then
    echo "$FILE exists."
    zat update
else 
    echo "$FILE does not exist."
fi
