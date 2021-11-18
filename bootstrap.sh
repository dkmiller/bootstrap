# Run this using:
# curl https://raw.githubusercontent.com/dkmiller/bootstrap/ubuntu/bootstrap.sh | sudo bash

if ! az account show; then
  az login
fi

cd ~
