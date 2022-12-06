{ userDetails, ... }:

{
    virtualisation.docker = {
        enable = true;
        liveRestore = false;
    };
    users.users.${userDetails.username}.extraGroups = [ "docker" ];
}