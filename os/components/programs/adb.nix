{ userDetails, lagging, ... }:

{
	# programs.adb.enable = true;

    services.udev.packages = [ lagging.android-udev-rules ];
    environment.systemPackages = [ lagging.android-tools ];
    users.groups.adbusers = {};

	users.users.${userDetails.username}.extraGroups = ["adbusers"];
}