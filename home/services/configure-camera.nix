{ pkgs, ... }:

{
	systemd.user.services.configure-camera = {
		Unit = {
			Description = "Sets up camera (v4l) config";
		};
		Install = {
			Wants = [ "graphical-session.target" ];
			WantedBy = [ "graphical-session.target" ];
			After = [ "graphical-session.target" ];
		};
		Service = {
			Type = "simple";
			ExecStart = toString (pkgs.writeShellScript "configure-camera.sh" ''
				${pkgs.v4l-utils}/bin/v4l2-ctl --set-ctrl brightness=160
			'');
		};
	};
}