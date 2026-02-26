#!/bin/bash
ENV=$1
if [ -z "$ENV" ]; then exit 1; fi
if [ "$ENV" = "prod" ]; then
    echo "Prod: Careful deploy"
elif [ "$ENV" = "dev" ]; then
    echo "Dev: Quick deploy"
else
    echo "Unknown env"
fi
