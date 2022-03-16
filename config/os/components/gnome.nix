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
		# baobab                       # Disk space analyser
		# cheese                       # Camera application
		eog
		epiphany
		evince
		geary
		# gedit                        # Text editor
		# nautilus                     # File system explorer
		simple-scan
		totem
		yelp
		# gnome-calculator             # Calculator
		gnome-calendar
		gnome-characters
		# gnome-clocks                 # Clock app (stopwatch + timer + alarm)
		gnome-contacts
		# gnome-font-viewer            # Font viewer
		# gnome-logs                   # systemd log viewer
		gnome-maps
		gnome-music
		# gnome-screenshot             # Screenshot tool
		# gnome-system-monitor         # Process monitor
		gnome-terminal
		gnome-weather
		pkgs.gnome-photos
		# pkgs.gnome-connections       # Remote desktop client
		# seahorse                     # Keychain viewer
	];
}
