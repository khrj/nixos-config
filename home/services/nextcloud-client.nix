{ pkgs, ... }:

{
    services.nextcloud-client = {
        enable = true;
        startInBackground = true;
    };

    home.packages = with pkgs; [
        nextcloud-client
    ];
}