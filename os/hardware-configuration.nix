{ config, lib, pkgs, modulesPath, ... }:

{
	imports = [
		(modulesPath + "/installer/scan/not-detected.nix")
	];

	boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "uas" "sd_mod" "sr_mod" ];
	boot.initrd.kernelModules = [ ];
	boot.kernelModules = [ "kvm-intel" ];
	boot.extraModulePackages = [ ];

	fileSystems."/" = {
		device = "/dev/disk/by-uuid/5bf75184-4297-4ee9-ab62-90fff6ad81ff";
		fsType = "btrfs";
	};

	fileSystems."/nix/store" = {
		device = "/nix/store";
		fsType = "none";
		options = [ "bind" ];
	};

	fileSystems."/boot" = { 
		device = "/dev/disk/by-uuid/3062-F123";
		fsType = "vfat";
	};

	swapDevices = [
		{ device = "/dev/disk/by-uuid/35b29226-5565-4b3f-9307-4aef991c98f8"; }
	];

	powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
