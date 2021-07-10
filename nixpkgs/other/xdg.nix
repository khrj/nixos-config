{ ... }:

let
	disable = "/home/khushraj"; # Setting directories to the home directory disables them
in
{
	xdg.userDirs = {
		enable = true;
		createDirectories = true;
		desktop     = disable;
		documents   = disable;
		download    = "/home/khushraj/Downloads";
		music       = disable;
		pictures    = disable;
		publicShare = disable;
		templates   = disable;
		videos      = disable;
	};
}
