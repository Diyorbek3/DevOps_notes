#!/bin/bash

env="prod"

if [ "$env" = "dev" ]
then
   echo "Deploy dev environment"
elif [ "$env" = "stage" ]
then
   echo "Deploy staging"
elif [ "$env" = "prod" ]
then
   echo "Deploy production"
else
   echo "Unknown env"
fi
