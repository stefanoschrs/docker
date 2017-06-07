#!/bin/bash

if [[ "$1" == "" ]]; then
  printf "%s\n" "App name missing"
  exit 1
fi

appName=$1

baseTag="stefanoschrs/${appName}"

tags="-t ${baseTag}:latest"

if [[ "$2" != "" ]]; then
  tags="${tags} -t ${baseTag}:$2"
fi

eval docker build ${tags} ${appName}/

