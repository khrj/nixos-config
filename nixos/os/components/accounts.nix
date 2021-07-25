{ ... }:

{
	security.sudo.wheelNeedsPassword = false;
	users = {
		users.khushraj = {
			isNormalUser = true;
			home = "/home/khushraj";
			description = "Khushraj Rathod";
			extraGroups = [ "wheel" ];
		};	
	};
}
