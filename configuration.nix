{ config, pkgs, ... }:

{
	imports = [
		./auth.nix
		/etc/nixos/hardware-configuration.nix
	];

	# Boot
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.grub.useOSProber = true;

	# Time
	time.timeZone = "Asia/Kolkata";

	# Network
	networking.useDHCP = false;
	networking.interfaces.enp4s0.useDHCP = true;
	networking.hostName = "btw-khushraj-uses-nix";
	services.openssh.enable = true;

	# X11
	services.xserver.enable = true;
	services.xserver.windowManager.i3.enable = true;
	services.xserver.windowManager.i3.package = pkgs.i3-gaps;
	services.xserver.windowManager.i3.configFile = ./external/i3-config;
	services.xserver.libinput.mouse.naturalScrolling = true; #FIXME
	programs.dconf.enable = true;

	# Printing
	services.printing.enable = true;

	# Sound
	sound.enable = true;
	hardware.pulseaudio.enable = true;

	# Accounts
	users.mutableUsers = false;
	users.users.khushraj = {
		isNormalUser = true;
		home = "/home/khushraj";
		description = "Khushraj Rathod";
		extraGroups = [ "wheel" ];
		shell = pkgs.fish;
	};
	security.sudo.wheelNeedsPassword = false;

	# Programs
	nixpkgs.config.allowUnfree = true;
	
	## GPG
	programs.gnupg.agent = {
		enable = true;
		enableSSHSupport = true;
	};
	
	## Keyring
	services.gnome.gnome-keyring.enable = true;
	security.pam.services.lightdm.enableGnomeKeyring = true;
	programs.seahorse.enable = true;
	
	## Virtualbox
	virtualisation.virtualbox.host.enable = true;
	virtualisation.virtualbox.host.enableExtensionPack = true;
	users.extraGroups.vboxusers.members = [ "khushraj" ];

	# environment.systemPackages = with pkgs; [];

	# Fonts
	fonts.fonts = with pkgs; [
		noto-fonts
		noto-fonts-cjk
		noto-fonts-extra
		noto-fonts-emoji
		font-awesome
		(nerdfonts.override { fonts = [ "FiraCode" ]; })
	];

	# State version, do not change with OS upgrade
	system.stateVersion = "21.05";
}

