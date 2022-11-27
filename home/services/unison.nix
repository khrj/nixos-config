{ userDetails, ... }:

{
	services.unison = {
        enable = true;
        pairs.google-drive.roots = [
           "/home/${userDetails.username}/Google-Drive"
           "/home/${userDetails.username}/.google-drive-mount"
        ];
    };
}