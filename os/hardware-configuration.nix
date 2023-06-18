{ config, lib, pkgs, modulesPath, ... }:

{
	imports = [
		(modulesPath + "/installer/scan/not-detected.nix")
	];

	boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "uas" "sd_mod" "sr_mod" ];
	boot.initrd.kernelModules = [ ];
	boot.kernelModules = [ "kvm-intel" ];
	boot.extraModulePackages = [ ];

	# Core mounts

	fileSystems."/" = {
		device = "none";
		fsType = "tmpfs";
		options = [ "defaults" "size=2G" "mode=755" ];
	};

	fileSystems."/boot" = { 
		device = "/dev/disk/by-uuid/3062-F123";
		fsType = "vfat";
	};

	fileSystems."/nix" = {
		device = "/dev/disk/by-uuid/5bf75184-4297-4ee9-ab62-90fff6ad81ff";
		fsType = "btrfs";
		options = [ "subvol=@nix" ];
	};

	fileSystems."/nix/store" = {
		device = "/nix/store";
		fsType = "none";
		options = [ "bind" ];
	};

	fileSystems."/home/khushraj" = {
		device = "/dev/disk/by-uuid/5bf75184-4297-4ee9-ab62-90fff6ad81ff";
		fsType = "btrfs";
		options = [ "subvol=@home" ];
	};

	swapDevices = [
		{ device = "/dev/disk/by-uuid/35b29226-5565-4b3f-9307-4aef991c98f8"; }
	];

	# Config mounts
	fileSystems."/etc/machine-id" = { device = "/nix/persist/etc/machine-id"; fsType = "none"; options = [ "bind" ]; };
	fileSystems."/etc/passwd" = { device = "/nix/persist/etc/passwd"; fsType = "none"; options = [ "bind" ]; };
	fileSystems."/etc/shadow" = { device = "/nix/persist/etc/shadow"; fsType = "none"; options = [ "bind" ]; };
	fileSystems."/etc/sudoers" = { device = "/nix/persist/etc/sudoers"; fsType = "none"; options = [ "bind" ]; };
	fileSystems."/var/log" = { device = "/nix/persist/var/log"; fsType = "none"; options = [ "bind" ]; };

	powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
