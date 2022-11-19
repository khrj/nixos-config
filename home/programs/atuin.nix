{ ... }:

{
	programs.atuin = {
		enable = true;
		enableFishIntegration = true;
		settings = {
			auto_sync = true;
			update_check = false;
			sync_frequency = "10s";
		};
	};
}