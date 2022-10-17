{ pkgs, ... }:

{
	services.xserver = {
		desktopManager.gnome.enable = true;
		displayManager.gdm.enable = true;
	};

	environment.systemPackages = with pkgs.gnomeExtensions; [ blur-my-shell ];

	environment.gnome.excludePackages = with pkgs.gnome; [
		# baobab                       # Disk space analyser
		# cheese                       # Camera application
		eog
		epiphany
		evince
		geary
		# nautilus                     # File system explorer
		# seahorse                     # Keychain viewer
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
		# gnome-system-monitor         # Process monitor
		# gnome-text-editor            # Text editor
		gnome-weather
		pkgs.gnome-photos
		pkgs.gnome-console
		# pkgs.gnome-connections       # Remote desktop client
	];
}
