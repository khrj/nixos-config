{ ... }:

{
	boot = {
		loader.systemd-boot.enable = true;
		supportedFilesystems = ["ntfs"];
		tmp = {
			useTmpfs = true;
			tmpfsSize = "75%";
		};
	};
}