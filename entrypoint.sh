#!/bin/sh -l

echo "Deploying to Zendesk..."
FILE=.zat

if [ -f "$FILE" ]; then
    echo "$FILE exists."
    if ! grep -q password "$File"; then
        Some Actions # SomeString was not found
    fi
    zat update
else 
    echo "$FILE does not exist."
fi
