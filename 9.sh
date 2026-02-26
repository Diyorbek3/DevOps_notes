#!/bin/bash
read -p "Enter email: " email
if [ -z "$email" ]; then
    echo "Email required"
    exit 1
fi
echo "Sending to $email"
