{ userDetails, ... }:

{
	users.extraGroups.vboxusers.members = [ userDetails.username ];
	virtualisation.virtualbox.host.enable = true;
}