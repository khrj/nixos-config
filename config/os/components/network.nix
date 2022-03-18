{ config, ... }:

{
	services.openssh.enable = true;
	networking = {
		useDHCP = false;
		interfaces.enp4s0.useDHCP = true;
		hostName = "khushrajs-desktop";
		firewall.allowedUDPPorts = [ config.services.tailscale.port ];
		firewall.allowedTCPPorts = [ 8000 ];
	};
}