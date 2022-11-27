{ userDetails, ... }:

{
	services.unison = {
        enable = true;
        pairs.google-drive.roots = [
           "/home/${userDetails.username}/Google-Drive"
           "/home/${userDetails.username}/.google-drive-mount"
        ];
    };

	systemd.user.services.unison-pair-google-drive.Unit.Requires = "rclone.service";
}