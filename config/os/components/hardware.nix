{ ... }:

{
	fileSystems."/mnt/backup" = {
		device = "/dev/disk/by-uuid/96fb8ee2-7412-4307-9542-5733a0e7c93a";
		fsType = "btrfs";
	};
}