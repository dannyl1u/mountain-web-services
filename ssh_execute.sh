#!/bin/bash

echo "🌄 Enter your SFU Computing ID:"
read username

server="csil-cpu2.csil.sfu.ca"
port=24

scp -P "$port" setup_ngrok.sh "$username@$server:~/"

ssh -t -p "$port" "$username@$server" 'bash ~/setup_ngrok.sh'