{ pkgs, config, ... }:

{
	programs.firefox = {
		enable = true;
		package = pkgs.firefox-bin;
		configPath = "${config.xdg.configHome}/mozilla/firefox";
	};
}
