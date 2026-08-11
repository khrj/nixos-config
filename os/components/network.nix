{ config, ... }:

{
	services.openssh.enable = true;

	services.resolved = {
		enable = true;
		settings.Resolve = {
			DNSOverTLS = "opportunistic";
			Domains = [ "~." ];
			FallbackDNS = [ "8.8.8.8" "1.1.1.1" ];
		};
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