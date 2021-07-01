#!/usr/bin/env bash

SOURCE=$(readlink -f "$0")
SOURCEDIR=$(dirname $SOURCE)
echo "Script running from $SOURCE"

echo "Linking files..."
mkdir -p ~/.config/nixpkgs

sudo ln -s $SOURCEDIR/nixos   /etc/nixos
     ln -s $SOURCEDIR/nixpkgs ~/.config/nixpkgs

read -sp "Create a user password: " PASSWORD
echo

cat << EOF > $SOURCEDIR/nixos/auth.nix
{ ... }:

{
	users.users.khushraj.hashedPassword = "$(mkpasswd -m sha-512 $PASSWORD)";
}
EOF

echo "Switching config..."
sudo nixos-rebuild switch
home-manager switch
