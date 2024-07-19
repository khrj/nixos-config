{ config, lib, modulesPath, ... }:

{
	imports = [
		(modulesPath + "/installer/scan/not-detected.nix")
	];

	boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "sd_mod" ];
	boot.initrd.kernelModules = [ ];
	boot.kernelModules = [ "kvm-amd" ];
	boot.extraModulePackages = [ ];

	fileSystems."/" = {
		device = "/dev/disk/by-uuid/d027652c-4d84-46ff-ae58-4f554c94dd69";
		fsType = "btrfs";
		options = [ "subvol=@" ];
	};

	fileSystems."/boot" = { 
		device = "/dev/disk/by-uuid/2C3A-CA81";
		fsType = "vfat";
		options = [ "fmask=0022" "dmask=0022" ];
	};

	networking.useDHCP = lib.mkDefault true;

	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
