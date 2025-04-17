#!/bin/bash

PLATFORM=$(jetpack config platform)
if [ "$PLATFORM" != "ubuntu" ]; then
    exit 0
fi

TOKEN=$(jetpack config ubuntupro.token)

apt -y update && apt install ubuntu-advantage-tools -y

pro attach --token $TOKEN 

