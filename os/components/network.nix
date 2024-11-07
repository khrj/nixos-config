{ config, ... }:

{
	services.openssh.enable = true;

	services.resolved = {
		enable = true;
		domains = [ "~." ];
		fallbackDns = [ "8.8.8.8" "1.1.1.1" ];
		dnsovertls = "opportunistic";
	};
	
	networking = {
		useDHCP = false;
		firewall = {
			allowedTCPPorts = [ 22 19000 8081 ];
			allowedUDPPorts = [ config.services.tailscale.port ];
			checkReversePath = "loose";
		};
	};
}