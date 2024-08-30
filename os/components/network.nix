{ config, ... }:

{
	environment.etc."resolv.conf.head".text = "nameserver 8.8.8.8";
	services.openssh.enable = true;
	networking = {
		useDHCP = false;
		firewall = {
			allowedTCPPorts = [ 22 19000 8081 ];
			allowedUDPPorts = [ config.services.tailscale.port ];
			checkReversePath = "loose";
		};
		hosts = {
			"10.1.0.10" = [ "campnet.bits-goa.ac.in" ];
		};
	};
}