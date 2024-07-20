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
		device = "/dev/disk/by-uuid/60b7a0e9-d729-43df-8a78-fac3e7f0a7db";
		fsType = "btrfs";
		options = [ "subvol=@" ];
	};

	boot.initrd.luks.devices."luks-7080694f-7c33-4572-a837-c02956b4870f".device = "/dev/disk/by-uuid/7080694f-7c33-4572-a837-c02956b4870f";

	fileSystems."/boot" = {
		device = "/dev/disk/by-uuid/2C3A-CA81";
		fsType = "vfat";
		options = [ "fmask=0022" "dmask=0022" ];
	};

	swapDevices = [ ];

	networking.interfaces = {
		wlp2s0.useDHCP = true;
		enp4s0.useDHCP = false;
	};

	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
