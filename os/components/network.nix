{ config, userDetails, ... }:

{
	environment.etc."resolv.conf.head".text = "nameserver 8.8.8.8";
	services.openssh.enable = true;
	networking = {
		useDHCP = false;
		interfaces.enp4s0.useDHCP = true;
		hostName = "${userDetails.username}s-desktop";
		firewall.allowedTCPPorts = [ 22 ];
	};
}