{ config, lib, pkgs, modulesPath, userDetails, ... }:

{
	imports = [
		(modulesPath + "/installer/scan/not-detected.nix")
	];

	boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "uas" "sd_mod" "sr_mod" ];
	boot.initrd.kernelModules = [ ];
	boot.kernelModules = [ "kvm-intel" ];
	boot.extraModulePackages = [ ];

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

	fileSystems."/home/${userDetails.username}" = {
		device = "/dev/disk/by-uuid/5bf75184-4297-4ee9-ab62-90fff6ad81ff";
		fsType = "btrfs";
		options = [ "subvol=@home" ];
	};

	swapDevices = [
		{ device = "/dev/disk/by-uuid/35b29226-5565-4b3f-9307-4aef991c98f8"; }
	];

	fileSystems."/var/log" = { device = "/nix/persist/var/log"; fsType = "none"; options = [ "bind" ]; };
	fileSystems."/var/lib" = { device = "/nix/persist/var/lib"; fsType = "none"; options = [ "bind" ]; };
	fileSystems."/etc/ssh" = { device = "/nix/persist/etc/ssh"; fsType = "none"; options = [ "bind" ]; };
	fileSystems."/etc/xrdp" = { device = "/nix/persist/etc/xrdp"; fsType = "none"; options = [ "bind" ]; };
	fileSystems."/etc/docker" = { device = "/nix/persist/etc/docker"; fsType = "none"; options = [ "bind" ]; };
	environment.etc."machine-id".source = "/nix/persist/etc/machine-id";
	environment.etc."passwd".source = "/nix/persist/etc/passwd";
	environment.etc."shadow".source = "/nix/persist/etc/shadow";

	powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
