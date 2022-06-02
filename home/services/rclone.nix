{ pkgs, userDetails, ... }: 

{
	systemd.user = {
		services = {
			rclone-mount = {
				Unit.Description = "Backup and sync daemon [MOUNT]";
				Install.WantedBy = [ "default.target" ];
				Service = {
					Type = "simple";
					ExecStart = "${pkgs.rclone}/bin/rclone mount google-drive: /home/${userDetails.username}/Google-Drive/ --vfs-cache-mode full";
					Environment = "PATH=/run/wrappers/bin/:$PATH";
					Restart = "always";
					RestartSec = 1;
				};
			};
			rclone-sync = {
				Install.WantedBy = [ "default.target" ];
				Service.ExecStart = "${pkgs.rclone}/bin/rclone sync google-drive: .google-drive-backup/";
				Unit = {
					Description = "Backup and sync daemon [SYNC]";
					Wants = "rclone-sync.timer";
				};
			};
		};
		timers = {
			rclone-sync = {
				Timer.OnCalendar = "*-*-* *:*:00";
				Install.WantedBy = [ "timers.target" ];
				Unit = {
					Description = "Backup and sync timer [SYNC]";
					Requires = "rclone-sync.service";
				};
			};
		};
	};
}


