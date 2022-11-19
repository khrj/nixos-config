{ userDetails, ... }:

{
	programs.adb.enable = true;
	users.users.${userDetails.username}.extraGroups = ["adbusers"];
}