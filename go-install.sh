#!/bin/bash
# file: go-install.sh

sudo apt-get update
sudo apt-get -y upgrade

mkdir /home/marko/Downloads
cd ~/Downloads

sudo curl -O https://dl.google.com/go/go1.11.linux-amd64.tar.gz

sudo tar -xvf go1.11.linux-amd64.tar.gz

sudo mv go /usr/local