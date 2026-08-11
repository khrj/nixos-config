{ userDetails, ... }:

{
    virtualisation.docker.enable = true;
    virtualisation.docker.liveRestore = false;
    users.users.${userDetails.username}.extraGroups = [ "docker" ];
}