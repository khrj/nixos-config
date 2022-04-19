{ pkgs, lib, ... }:

{
	services.mysql = {
		enable = true;
		package = pkgs.mysql80;
	};

	# Don't start MySQL on boot
	systemd.services.mysql.wantedBy = lib.mkForce [];
}
