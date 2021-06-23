#!/usr/bin/env bash

SOURCE=$(readlink -f "$0")

mkdir -p ~/.config/nixpkgs

ln -s $SOURCE/home.nix ~/.config/nixpkgs/home.nix
ln -s $SOURCE/config.nix ~/.config/nixpkgs/config.nix

home-manager switch
