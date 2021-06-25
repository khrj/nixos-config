# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
	imports = [
		./auth.nix
		/etc/nixos/hardware-configuration.nix
	];

	# Use the systemd-boot EFI boot loader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.grub.useOSProber = true;

	networking.hostName = "btw-khushraj-uses-nix"; # Define your hostname.

	# Set your time zone.
	time.timeZone = "Asia/Kolkata";

	# The global useDHCP flag is deprecated, therefore explicitly set to false here.
	# Per-interface useDHCP will be mandatory in the future, so this generated config
	# replicates the default behaviour.
	networking.useDHCP = false;
	networking.interfaces.enp4s0.useDHCP = true;

	# Select internationalisation properties.
	# i18n.defaultLocale = "en_US.UTF-8";
	# console = {
	#   font = "Lat2-Terminus16";
	#   keyMap = "us";
	# };

	# Enable the X11 windowing system.
	services.xserver.enable = true;
	services.xserver.windowManager.i3.enable = true;
	services.xserver.windowManager.i3.package = pkgs.i3-gaps;
	services.xserver.windowManager.i3.configFile = ./external/i3-config;
	services.xserver.libinput.mouse.naturalScrolling = true; #FIXME
	services.gnome.gnome-keyring.enable = true;

	# Configure keymap in X11
	# services.xserver.layout = "us";
	# services.xserver.xkbOptions = "eurosign:e";

	# Enable CUPS to print documents.
	# services.printing.enable = true;

	# Enable sound.
	sound.enable = true;
	hardware.pulseaudio.enable = true;

	# User account
	users.mutableUsers = false;
	users.users.khushraj = {
		isNormalUser = true;
		home = "/home/khushraj";
		description = "Khushraj Rathod";
		extraGroups = [ "wheel" ];
		shell = pkgs.fish;
	};

	security.sudo.wheelNeedsPassword = false;

	# List packages installed in system profile. To search, run:
	# $ nix search wget
	# environment.systemPackages = with pkgs; [
	#   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	#   wget
	#   firefox
	# ];

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	programs.gnupg.agent = {
		enable = true;
		enableSSHSupport = true;
	};

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	# services.openssh.enable = true;

	fonts.fonts = with pkgs; [
		noto-fonts
		noto-fonts-cjk
		noto-fonts-extra
		noto-fonts-emoji
		font-awesome
		(nerdfonts.override { fonts = [ "FiraCode" ]; })
	];

	nixpkgs.config.allowUnfree = true;
	virtualisation.virtualbox.host.enable = true;
	virtualisation.virtualbox.host.enableExtensionPack = true;
	users.extraGroups.vboxusers.members = [ "khushraj" ];

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "21.05"; # Did you read the comment?
}

