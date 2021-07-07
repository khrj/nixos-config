{ ... }:

{
	security.sudo.wheelNeedsPassword = false;
	users = {
		mutableUsers = false;
		users.khushraj = {
			isNormalUser = true;
			home = "/home/khushraj";
			description = "Khushraj Rathod";
			extraGroups = [ "wheel" ];
		};	
	};
}