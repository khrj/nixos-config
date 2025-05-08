{ ... }: 

{
	programs.zellij = {
		enable = true;
		# Enabled manually in fish.nix interactiveShellInit
		# enableFishIntegration = true;
		# attachExistingSession = true;
		# exitShellOnExit = true;
		settings = {
			"pane_frames" = false;
			"show_startup_tips" = false;
		};
	};
}
