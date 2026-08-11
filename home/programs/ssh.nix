{ ... }:

{
	programs.ssh = {
		enable = true;
		enableDefaultConfig = false;
			
		settings."*" = {
			addKeysToAgent = "yes";
			serverAliveInterval = 60;
			controlMaster = "auto";
			controlPath = "~/.ssh/cm-%C";
			controlPersist = "10m";
			SetEnv = {
				TERM = "xterm-256color";
			};
		};
	};
}