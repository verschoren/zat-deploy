#!/bin/sh -l

echo "Deploying to Zendesk..."
FILE=.zat

PASSWORD="\"password\""
APP_ID="\"app_id\""

if  grep -q "$APP_ID" "$FILE" ; then
    echo "App ID detected, running update" ; 
    zat update
elif grep -q "$PASSWORD" "$FILE" ; then
    echo "No existing APP ID detected, creating new app." ; 
    zat create
    $ grep -o '"app_id": *"[^"]*"' .zat | grep -o '"[^"]*"$'
else
    echo "Can't deploy. Please check your .zat file" ; 
fi
