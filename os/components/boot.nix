{ ... }:

{
	boot = {
		loader.systemd-boot.enable = true;
		supportedFilesystems = ["ntfs"];
		tmpOnTmpfs = true;
		tmpOnTmpfsSize = "75%";
	};
}