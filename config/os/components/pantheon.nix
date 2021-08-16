{ pkgs, ... }:

{
	services.xserver.desktopManager.pantheon.enable = true;
	environment.pantheon.excludePackages = with pkgs.pantheon; [
		elementary-calculator
        elementary-calendar
        elementary-camera
        # elementary-code
        # elementary-files
        elementary-music
        elementary-photos
        # elementary-screenshot-tool
        elementary-terminal
        elementary-videos
	] ++ (with pkgs.gnome; [
		geary
		epiphany
		gnome-font-viewer
	]);
}