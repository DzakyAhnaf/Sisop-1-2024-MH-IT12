#!/bin/bash

##REGISTER SYSTEM##

echo "=== Welcome to Registration System ==="
echo " "

echo "Enter your email!"
read email
 if grep -q "$email" users.txt; then
        echo "Email already exist. Use another email!"
        log "REGISTER FAILED" "Failed to register user with email $email: Email already exists"
        exit 1
    fi
if [[ "$email" == *"admin"* ]]; then
    role="admin"
else
    role="user"
fi
echo " "


echo "Enter your username!"
read username
echo " "

echo "Enter a security question!"
read question
echo " "

echo "Enter the security answer"
read answer
echo " "

echo "Enter your password"
read -s password
if [[ ${#password} -lt 8 || ! "$password" =~ [A-Z] || ! "$password" =~ [a-z] || ! "$password" =~ [0-9] ]]; then
        echo "Password doesn't meet the criteria. Try again!!!"
        exit 1
    fi

encrypted_password=$(echo "$password" | base64)
echo " "

echo "$email,$username,$question,$answer,$encrypted_password,$role" >> users.txt
echo "REGISTER SUCCESS!"


