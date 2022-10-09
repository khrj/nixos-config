{ config, userDetails, ... }:

{
	services.openssh.enable = true;
	networking = {
		useDHCP = false;
		interfaces.enp4s0.useDHCP = true;
		hostName = "${userDetails.username}s-desktop";
		firewall = {
			allowedTCPPorts = [ 22 ];
			allowedUDPPorts = [ config.services.tailscale.port ];
			checkReversePath = "loose";
		};
	};
}