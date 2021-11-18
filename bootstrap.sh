# Run this using:
# curl https://raw.githubusercontent.com/dkmiller/bootstrap/ubuntu/bootstrap.sh | sudo bash

# https://stackoverflow.com/a/26675771
if ! az account list; then
  az login
fi

cd ~

az keyvault secret show --id https://danmill-kv.vault.azure.net/secrets/id-rsa-pub --query value -o tsv > ~/.ssh/id_rsa.pub
az keyvault secret show --id https://danmill-kv.vault.azure.net/secrets/id-rsa --query value -o tsv > ~/.ssh/id_rsa
