{ pkgs, ... }: 

{
	systemd.user.services.polkit-gnome-authentication-agent-1 = {
		Unit = {
			Description = "Policy-kit gnome authentication agent";
		};
		Install = {
			Wants = [ "graphical-session.target" ];
			WantedBy = [ "graphical-session.target" ];
			After = [ "graphical-session.target" ];
		};
		Service = {
			Type = "simple";
			ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
			Restart = "always";
			RestartSec = 1;
			TimeoutStopSec = 10;
		};
	};
}


