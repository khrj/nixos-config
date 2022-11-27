{ pkgs, userDetails, ... }: 

{
	systemd.user = {
		services.rclone = {
			Unit.Description = "Backup and sync daemon";
			Install.WantedBy = [ "default.target" ];
			Service = {
				Type = "simple";
				ExecStart = "${pkgs.rclone}/bin/rclone mount google-drive: /home/${userDetails.username}/.google-drive-mount/ --drive-skip-gdocs --vfs-cache-mode full";
				Environment = "PATH=/run/wrappers/bin/:$PATH";
				Restart = "always";
				RestartSec = 1;
			};
		};
	};
}


