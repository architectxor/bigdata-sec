#!/bin/bash

path_to_rules="/etc/falco/"
sudo cp $path_to_rules/falco_rules.yaml $path_to_rules/"falco_rules.yaml-$(date +%y%m%d).bckup"
echo "Rules backup done..."

