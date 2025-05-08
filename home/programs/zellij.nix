{ ... }: 

{
	programs.zellij = {
		enable = true;
		enableFishIntegration = true;
		attachExistingSession = true;
		exitShellOnExit = true;
		settings = {};
	};
}
