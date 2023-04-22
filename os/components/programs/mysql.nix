{ pkgs, lib, ... }:

{
	services.mysql = {
		enable = true;
		package = pkgs.mariadb;
	};

	# Don't start MySQL on boot
	systemd.services.mysql.wantedBy = lib.mkForce [];
}
