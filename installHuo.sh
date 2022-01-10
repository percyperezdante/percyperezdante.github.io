#!/bin/bash

# This it to be executed only once.

# Install GO https://go.dev/doc/install
mkdir ~/go
cd ~/go
# The foloowing tar file  was copied from  https://go.dev/dl/
wget https://go.dev/dl/go1.17.6.linux-amd64.tar.gz   
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.17.6.linux-amd64.tar.gz

# Add the following to ~/.bashrc
export PATH=$PATH:/usr/local/go/bin  
go version


# Installi$ng hugo https://github.com/gohugoio/hugo
mkdir $HOME/src
cd $HOME/src
git clone https://github.com/gohugoio/hugo.git
cd hugo
# The instructions say run: go install, but I prefer build it locally.
go build -o hugo
export PATH=$PATH:$HOME/src/hugo
hugo -h
hugo server -D

# If above doesnot work properly: sudo apt install hugo

# Git config
# https://git-scm.com/docs/git-credential-store
# git config username
# git config email
# Generate a token from github
#  git config credential.helper store

# Updating website.
cd source
sh publushSite.sh





