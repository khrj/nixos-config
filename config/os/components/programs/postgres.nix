{ pkgs, lib, ... }:

{
    services.postgresql = {
		enable = true;
		package = pkgs.postgresql_13;
	};

	# Don't start PostgreSQL on boot
	systemd.services.postgresql.wantedBy = lib.mkForce [];
}