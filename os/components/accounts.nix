{ userDetails, ... }:

{
	security.sudo.wheelNeedsPassword = false;
	users = {
		users.${userDetails.username} = {
			isNormalUser = true;
			home = "/home/${userDetails.username}";
			description = userDetails.name;
			extraGroups = [ "wheel" ];
		};	
	};
}
