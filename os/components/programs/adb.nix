{ userDetails, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [ android-tools ];
	users.users.${userDetails.username}.extraGroups = ["adbusers"];
}