#!/bin/sh -l

echo "Deploy to Zendesk..."

zat validate

time="validating.."
echo "::set-output name=time::$time"