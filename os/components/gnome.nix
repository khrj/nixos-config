{ pkgs, ... }:

{
	services = {
		desktopManager.gnome.enable = true;
		displayManager.gdm.enable = true;
		xserver.excludePackages = with pkgs; [ xterm ];
	};

	environment.systemPackages = with pkgs.gnomeExtensions; [ blur-my-shell ];

	environment.gnome.excludePackages = with pkgs; [
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
		gnome-connections
		gnome-console
		gnome-photos
		gnome-tour
		gnome-user-docs
	];
}
