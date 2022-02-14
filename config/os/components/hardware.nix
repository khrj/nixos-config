{ ... }:

{
	systemd = {
		mounts = [
			{
				what = "/dev/disk/by-uuid/96fb8ee2-7412-4307-9542-5733a0e7c93a";
				where = "/mnt/backup";
				type = "btrfs";	
			}
		];
		automounts = [
			{
				where = "/mnt/backup";
				wantedBy = [ "multi-user.target" ];
			}
		];
	};
}