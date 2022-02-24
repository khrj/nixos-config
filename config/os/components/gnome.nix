{ pkgs, ... }:

{
	services.xserver = {
		desktopManager.gnome.enable = true;
		displayManager.gdm = {
			enable = true;
			wayland = false;
		};
	};

	environment.systemPackages = with pkgs.gnomeExtensions; [
		blur-my-shell
		transparent-top-bar-adjustable-transparency
	];

	environment.gnome.excludePackages = with pkgs.gnome; [
		baobab
		cheese
		eog
		epiphany
		evince
		geary
		gedit
		nautilus
		simple-scan
		totem
		yelp
		gnome-calculator
		gnome-calendar
		gnome-characters
		gnome-clocks
		gnome-contacts
		gnome-font-viewer
		gnome-logs
		gnome-maps
		gnome-music
		# gnome-screenshot
		gnome-system-monitor
		gnome-terminal
		gnome-weather
		pkgs.gnome-photos
		# pkgs.gnome-connections
	];
}
