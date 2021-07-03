{ config, pkgs, ... }:

{
	imports = [
		./auth.nix
		./hardware-configuration.nix
	];

	# Boot
	boot.loader = {
		efi.canTouchEfiVariables = true;
		grub = {
			enable = true;
			copyKernels = true;
			device = "nodev";
			efiSupport = true;
			useOSProber = true;
		};
	};

	# Time
	time.timeZone = "Asia/Kolkata";

	# Network
	services.openssh.enable = true;
	networking = {
		useDHCP = false;
		interfaces.enp4s0.useDHCP = true;
		hostName = "btw-khushraj-uses-nix";
	};

	# X11
	programs.dconf.enable = true;
	services.xserver = {
		enable = true;
		libinput.mouse.naturalScrolling = true; #FIXME
		windowManager.i3 = {
			enable = true;
			package = pkgs.i3-gaps;
			configFile = ./external/i3-config;
			extraPackages = with pkgs; [];
		};
	};

	# Printing
	services.printing.enable = true;

	# Sound
	sound.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		pulse.enable = true;	
	};

	# Accounts
	security.sudo.wheelNeedsPassword = false;
	users = {
		mutableUsers = false;
		users.khushraj = {
			isNormalUser = true;
			home = "/home/khushraj";
			description = "Khushraj Rathod";
			extraGroups = [ "wheel" ];
			shell = pkgs.fish;
		};	
	};

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
	users.extraGroups.vboxusers.members = [ "khushraj" ];
	virtualisation.virtualbox.host = {
		enable = true;
		enableExtensionPack = true;
	};

	## PostgreSQL
	services.postgresql = {
		enable = true;
		package = pkgs.postgresql_13;
	};

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
