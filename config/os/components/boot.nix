{ ... }:

{
	boot = {
		loader.systemd-boot.enable = true;
		tmpOnTmpfs = true;
		tmpOnTmpfsSize = "75%";
	};
}