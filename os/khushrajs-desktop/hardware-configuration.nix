{ config, lib, userDetails, modulesPath, ... }:

{
	imports = [
		(modulesPath + "/installer/scan/not-detected.nix")
	];

	boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" "sr_mod" ];
	boot.initrd.kernelModules = [ ];
	boot.kernelModules = [ "kvm-intel" ];
	boot.extraModulePackages = [ ];

	fileSystems."/" = {
		device = "/dev/disk/by-uuid/9b7f881e-ac90-46e9-b980-fd944060cd10";
		fsType = "btrfs";
		options = [ "subvol=@root" ];
	};

	fileSystems."/boot" = { 
		device = "/dev/disk/by-uuid/4118-CC3F";
		fsType = "vfat";
	};

	fileSystems."/nix" = {
		device = "/dev/disk/by-uuid/9b7f881e-ac90-46e9-b980-fd944060cd10";
		fsType = "btrfs";
		options = [ "subvol=@nix" ];
	};

	fileSystems."/home" = {
		device = "/dev/disk/by-uuid/9b7f881e-ac90-46e9-b980-fd944060cd10";
		fsType = "btrfs";
		options = [ "subvol=@home" ];
	};

	networking = {
		hostName = userDetails.desktopHostname;
		interfaces.enp4s0.useDHCP = true;
	};

	powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
	hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
