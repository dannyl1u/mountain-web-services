#!/bin/bash

# Download ngrok
echo "Downloading ngrok..."
curl -L https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz -o ngrok-v3-stable-linux-amd64.tgz

# Extract ngrok
echo "Extracting ngrok..."
tar -xvzf ngrok-v3-stable-linux-amd64.tgz

# Create a bin directory in the user's home (if it doesn't already exist)
echo "Setting up ngrok..."
mkdir -p ~/bin

# Move ngrok to ~/bin
mv ngrok ~/bin/

# Add ~/bin to PATH by appending it to .bashrc (if not already added)
if ! grep -q 'export PATH="$HOME/bin:$PATH"' ~/.bashrc; then
  echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
fi

# Source .bashrc to update PATH
source ~/.bashrc

# Ask for the user's ngrok passkey
echo "Please enter your ngrok passkey:"
read -s ngrok_passkey

# Use the passkey with ngrok (configuring authtoken)
~/bin/ngrok config add-authtoken "$ngrok_passkey"

echo "ngrok has been configured with your passkey."

# Make sure any background jobs do not consume the next stdin
wait

echo "Enter git repository URL to deploy:"
read git_url

# Check if the Git repository URL is entered
if [ -z "$git_url" ]; then
    echo "No Git repository URL entered. Exiting."
    exit 1
fi

repo_dir=$(basename "$git_url" .git)

# Before cloning, check if the directory exists and remove it if it does
if [ -d "$repo_dir" ]; then
    echo "'$repo_dir' already exists. Removing..."
    rm -rf "$repo_dir"
fi

echo "Cloning the repository..."
git clone "$git_url"

# Check if cloning was successful
if [ ! -d "$repo_dir" ]; then
    echo "Failed to clone the repository. Exiting."
    exit 1
fi

# Change directory to the repository
cd "$repo_dir" || exit

# Start the Python HTTP server on port 8080
echo "Starting the Python HTTP server on port 8080..."
nohup python3 -m http.server 8080 > http.log 2>&1 &

sleep 5

# Start ngrok and retrieve the public URL
echo "Starting ngrok..."
nohup ~/bin/ngrok http 8080 --log=stdout > ngrok.log 2>&1 &

sleep 10

# Extract the ngrok URL
ngrok_url=$(grep -o 'url=https://[^ ]*' ngrok.log | cut -d '=' -f2)

if [ -z "$ngrok_url" ]; then
    echo "Failed to retrieve ngrok URL. Check ngrok.log for errors."
    exit 1
fi

echo "Your application is being served! ngrok URL: $ngrok_url"
