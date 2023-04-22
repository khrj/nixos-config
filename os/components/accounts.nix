{ pkgs, userDetails, ... }:

{
	security.sudo.wheelNeedsPassword = false;
	environment.shells = with pkgs; [ fish ];
	users = {
		users.${userDetails.username} = {
			isNormalUser = true;
			home = "/home/${userDetails.username}";
			description = userDetails.name;
			extraGroups = [ "wheel" "dialout" ];
			shell = pkgs.fish;
		};
	};
	
	programs.fish.enable = true;
}
