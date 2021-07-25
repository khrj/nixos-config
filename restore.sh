#!/usr/bin/env bash

SOURCE=$(readlink -f "$0")
SOURCEDIR=$(dirname $SOURCE)
echo "Script running from $SOURCE"

echo "Linking files..."
sudo ln -sr $SOURCEDIR/config /etc/nixos

echo "Switching config..."
sudo nixos-rebuild switch
