#!/bin/bash

echo "Enter your SFU Computing ID:"
read username

server="csil-cpu2.csil.sfu.ca"
port=24

# securely copy the script to the remote server
scp -P "$port" setup_ngrok.sh "$username@$server:~/"

# SSH into the server and execute the script interactively
ssh -t -p "$port" "$username@$server" 'bash ~/setup_ngrok.sh'