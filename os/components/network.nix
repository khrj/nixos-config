{ lib, userDetails, ... }:

{
	environment.etc."resolv.conf.head".text = "nameserver 8.8.8.8";
	services.openssh.enable = true;
	networking = {
		useDHCP = false;
		interfaces.enp4s0.useDHCP = lib.mkDefault true;
		hostName = userDetails.desktopHostname;
		firewall.allowedTCPPorts = [ 22 19000 8081 ];
	};
}