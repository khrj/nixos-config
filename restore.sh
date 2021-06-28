#!/usr/bin/env bash

SOURCE=$(readlink -f "$0")
SOURCEDIR=$(dirname $SOURCE)
echo "Script running from $SOURCE"

echo "Linking files..."
mkdir -p ~/.config/nixpkgs
sudo ln -s $SOURCE/configuration.nix /etc/nixos/configuration.nix
ln -s $SOURCE/home.nix ~/.config/nixpkgs/home.nix
ln -s $SOURCE/config.nix ~/.config/nixpkgs/config.nix
ln -s $SOURCE/programs/sway-config ~/.config/sway/config

read -sp "Create a user password: " PASSWORD
echo

cat << EOF > $SOURCEDIR/auth.nix
{ ... }:

{
	users.users.khushraj.hashedPassword = "$(mkpasswd -m sha-512 $PASSWORD)";
}
EOF

echo "Switching config..."
sudo nixos-rebuild switch
home-manager switch
