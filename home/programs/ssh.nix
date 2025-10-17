{ ... }:

{
	programs.ssh = {
		enable = true;
		extraConfig = "SetEnv TERM=xterm-256color";
		enableDefaultConfig = false;
		
		# Old defaults 
		matchBlocks."*" = {
			forwardAgent = false;
			addKeysToAgent = "no";
			compression = false;
			serverAliveInterval = 0;
			serverAliveCountMax = 3;
			hashKnownHosts = false;
			userKnownHostsFile = "~/.ssh/known_hosts";
			controlMaster = "no";
			controlPath = "~/.ssh/master-%r@%n:%p";
			controlPersist = "no";
		};
	};
}