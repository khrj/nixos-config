{ ... }:

{
	boot.loader = {
		efi.canTouchEfiVariables = true;
		grub = {
			enable = true;
			copyKernels = true;
			device = "nodev";
			efiSupport = true;
		};
	};
}