{ ... }:

{
	services.borgbackup.jobs.homeBackup = {
		doInit = true;
		repo = "/mnt/backup/Borg";
		startAt = "hourly";
		user = "khushraj";
		encryption.mode = "none";
		environment.BORG_UNKNOWN_UNENCRYPTED_REPO_ACCESS_IS_OK = "yes";
		paths = "/home/khushraj";
		exclude = [ 
			"/home/khushraj/.*"
			"/home/khushraj/Google-Drive"
			"/home/khushraj/Builds"
			"/home/khushraj/go"
		];
	};
}