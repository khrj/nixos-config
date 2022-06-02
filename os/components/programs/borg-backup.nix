{ userDetails, ... }:

{
	services.borgbackup.jobs.homeBackup = {
		doInit = true;
		repo = "/mnt/backup/Borg";
		startAt = "hourly";
		user = userDetails.username;
		encryption.mode = "none";
		environment.BORG_UNKNOWN_UNENCRYPTED_REPO_ACCESS_IS_OK = "yes";
		paths = "/home/${userDetails.username}";
		exclude = [ 
			"/home/${userDetails.username}/.*"
			"/home/${userDetails.username}/Google-Drive"
			"/home/${userDetails.username}/Builds"
			"/home/${userDetails.username}/go"
		];
	};
}