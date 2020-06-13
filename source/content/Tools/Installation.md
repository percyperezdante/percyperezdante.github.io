---
title: "Installation"
date: 2020-03-19T16:25:40Z
---

This page presents suggestions on how to install tools of interest. It is ordered alphabetically.

## A

## G

- [GO](https://golang.org/doc/install/source)

        $ git clone https://github.com/golang/go.git
        $ cd go
        $ ./all.bash    # <-- This should generate ../bin/go file.
        $ cd ..
        $ export GOPATH=`pwd`  # <-- Add this to your profile such as ~/.bashrc 
        $ cd bin
        $ export GOBIN=`pwd`   # <-- Add this to your profile such as ~/.bashrc 
        $ go version



## P
- [Packer](https://github.com/hashicorp/packer/blob/master/.github/CONTRIBUTING.md#setting-up-go-to-work-on-packer)

        $ git clone https://github.com/hashicorp/packer.git
        $ cd packer
        $ go build -o bin/packer .     # <-- This will create ./bin/packer executable file
        $ ./bin/packer version
        $ sudo ln -s `pwd`/bin/packer /usr/local/bin/packer  # <-- Optional 
        $ packer --help

## V
- [Vi File Manager](https://github.com/vifm/vifm.git)

        $ mkdir temp
        $ cd temp
        $ git clone https://github.com/vifm/vifm.git
        $ cd vifm
        $ dpkg -l | grep libncursesw5-dev  # <-- be sure you have this package
        $ ./configure
        $ sudo make install
        $ vifm .  # <-- Enjoy vi File Manager

- [Vimium](https://vimium.github.io/)

        This extension is available in Google Chrome and Firefox. It provides keyboard shorcuts for navigation.

## Z





