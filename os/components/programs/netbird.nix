{ ... }: 

{
	services.netbird.clients.default = {
		port = 51820;
		name = "netbird";
		# systemd.name = "netbird";
		# interface = "wt0";
		hardened = false;
	};
}