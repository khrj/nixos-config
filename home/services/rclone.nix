{ pkgs, userDetails, ... }: 

{
	systemd.user = {
		services.rclone = {
			Install.WantedBy = [ "default.target" ];
			Service.ExecStart = "${pkgs.rclone}/bin/rclone bisync Google-Drive/ google-drive: --drive-skip-gdocs --check-access --verbose";
			Unit = {
				Description = "Backup and sync daemon";
				Wants = "rclone.timer";
			};
		};
		timers.rclone = {
			Timer.OnCalendar = "*-*-* *:*:00";
			Install.WantedBy = [ "timers.target" ];
			Unit = {
				Description = "Backup and sync timer";
				Requires = "rclone.service";
			};
		};
	};
}


