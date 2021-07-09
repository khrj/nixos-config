{ pkgs, ... }: 

{
	systemd.user.services = {
		rclone-mount = {
			Unit = {
				Description = "Backup and sync daemon [MOUNT]";
			};
			Install = {
				Wants = [ "multi-user.target" ];
				WantedBy = [ "multi-user.target" ];
				After = [ "multi-user.target" ];
			};
			Service = {
				Type = "simple";
				ExecStart = "${pkgs.rclone}/bin/rclone mount google-drive: /home/khushraj/google-drive/ --vfs-cache-mode full";
				Environment = "PATH=/run/wrappers/bin/:$PATH";
				Restart = "always";
				RestartSec = 1;
				TimeoutStopSec = 10;
			};
		};
	};
}


