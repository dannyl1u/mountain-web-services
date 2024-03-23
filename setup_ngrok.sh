#!/bin/bash

echo "Downloading ngrok..."
curl -L https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz -o ngrok-v3-stable-linux-amd64.tgz

echo "Extracting ngrok..."
tar -xvzf ngrok-v3-stable-linux-amd64.tgz

echo "Setting up ngrok..."
mkdir -p ~/bin

mv ngrok ~/bin/

# Add ~/bin to PATH
if ! grep -q 'export PATH="$HOME/bin:$PATH"' ~/.bashrc; then
  echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
fi

# Source .bashrc to update PATH
source ~/.bashrc

echo "Please enter your ngrok passkey:"
read -s ngrok_passkey

~/bin/ngrok config add-authtoken "$ngrok_passkey"

echo "ngrok has been configured with your passkey."

wait

echo "Enter git repository URL to deploy:"
read git_url

if [ -z "$git_url" ]; then
    echo "No Git repository URL entered. Exiting."
    exit 1
fi

repo_dir=$(basename "$git_url" .git)

if [ -d "$repo_dir" ]; then
    echo "'$repo_dir' already exists. Removing..."
    rm -rf "$repo_dir"
fi

echo "Cloning the repository..."
git clone "$git_url"

if [ ! -d "$repo_dir" ]; then
    echo "Failed to clone the repository. Exiting."
    exit 1
fi

cd "$repo_dir" || exit

echo "Starting the Python HTTP server on port 8080..."
nohup python3 -m http.server 8080 > http.log 2>&1 &

sleep 5

echo "Starting ngrok..."
nohup ~/bin/ngrok http 8080 --log=stdout > ngrok.log 2>&1 &

sleep 10

ngrok_url=$(grep -o 'url=https://[^ ]*' ngrok.log | cut -d '=' -f2)

if [ -z "$ngrok_url" ]; then
    echo "Failed to retrieve ngrok URL. Check ngrok.log for errors."
    exit 1
fi

echo "🎉 Your application is being served at URL: $ngrok_url"
