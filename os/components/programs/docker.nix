{ userDetails, ... }:

{
    virtualisation.docker.enable = true;
    users.users.${userDetails.username}.extraGroups = [ "docker" ];
}