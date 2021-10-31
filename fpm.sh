#!/bin/bash

usage="Usage: $0 {install | remove}"

if [ $1 = "install" ]
then
	echo "Installation of Falco package will start in a few moments..."
	curl -s https://falco.org/repo/falcosecurity-3672BA8F.asc | sudo apt-key add -
	echo "deb https://download.falco.org/packages/deb stable main" | sudo tee -a /etc/apt/sources.list.d/falcosecurity.list
	sudo apt-get update -y
	echo "Installing Linux kernel headers..."
	sudo apt-get -y install linux-headers-$(uname -r)
	echo "Finally installing Falco package..."
	sudo apt-get install -y falco
elif [ $1 = "remove" ]
then
	echo "Our kernel-space elves already removing your Falco package..."
	sudo apt-get remove falco
else
	echo $usage
fi
