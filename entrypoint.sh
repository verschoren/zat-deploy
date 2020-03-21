#!/bin/sh -l

echo "Deploy to Zendesk..."

zat validate

time="hello"
echo "::set-output name=time::$time"