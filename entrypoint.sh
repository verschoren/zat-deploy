#!/bin/sh -l

echo "Deploying to Zendesk..."
FILE=.zat
PASSWORD="\"password\""
APP_ID="\"app_id\""

if  grep -q "$APP_ID" "$FILE" ; then
    echo 'App ID detected, running update' ; 
    zat update
elif grep -q "$PASSWORD" "$FILE" ; then
    echo 'No ID detected, creating new app.' ; 
    zat create
else
    echo 'can\'t run the script' ; 
fi
