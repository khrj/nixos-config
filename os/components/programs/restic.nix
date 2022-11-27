{ pkgs, userDetails, ... }:

let
	h = "/home/${userDetails.username}";
	exclude = pkgs.writeText "restic-exclude" ''
		**/node_modules/
		${h}/Android/Sdk
		${h}/Builds
		${h}/go
		${h}/.cache
		${h}/.rustup
		${h}/.cargo
		${h}/.gradle
		${h}/.npm
		${h}/.local/share/pnpm/store
		${h}/.config/Code/Cache
		${h}/.config/Code/CachedData
		${h}/.config/google-chrome/Default/Service Worker/CacheStorage/
	'';
in
{
	services.restic.backups.home = {
		user = userDetails.username;
		repository = "/mnt/backup/Restic";
		paths = ["/home/${userDetails.username}"];
		timerConfig = { OnCalendar = "hourly"; };
		passwordFile = "/home/${userDetails.username}/.restic-password";
		extraBackupArgs = [ "--exclude-file=${exclude}" ];
		pruneOpts = [
			"--keep-hourly 24"  # Keeps one snapshot for each of the last 24 hours
			"--keep-daily 7"    # Keeps one snapshot for each of the last 7 days
			"--keep-weekly 5"   # Keeps one snapshot for each of the last 5 weeks
			"--keep-monthly 12" # Keeps one snapshot for each of the last 12 months
			"--keep-yearly 75"  # Keeps one snapshot for each of the last 75 years
		];
	};
}