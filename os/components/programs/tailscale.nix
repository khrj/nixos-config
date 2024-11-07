{ pkgs, ... }:

{
	services.tailscale = {
		enable = true;
		useRoutingFeatures = "client";
		package = pkgs.tailscale;
	};
}