#!/bin/bash

# sudo apt-get update
# sudo apt-get install apt-transport-https ca-certificates gnupg curl sudo
# sudo apt-get install apt-transport-https ca-certificates gnupg -y
# echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
# sudo curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
# sudo apt-get update && sudo apt-get install google-cloud-sdk
# gcloud init

# ____________________________
# mkdir /root/googleCli
sudo curl https://sdk.cloud.google.com > install.sh
# sudo bash install.sh --disable-prompts --install-dir=/home/hayavgi/projects/human-cancer-project/googleCli
sudo bash install.sh --disable-prompts --install-dir=/root/googleCli
