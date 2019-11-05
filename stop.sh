#!/bin/bash

#
# This file should be used to prepare and run your WebProxy after set up your .env file
# Source: https://github.com/evertramos/docker-compose-letsencrypt-nginx-proxy-companion
#

# 1. Check if .env file exists
if [ -e .env ]; then
    source .env
else
    echo "Please set up your .env file before starting your environment."
    exit 1
fi

# Check if you have multiple network
if [ -z ${SERVICE_NETWORK+X} ]; then
    docker-compose down --remove-orphans
else
    docker-compose -f docker-compose-multiple-networks.yml down --remove-orphans
fi

exit 0
