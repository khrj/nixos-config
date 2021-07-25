{ pkgs, ... }:

{
	services.xserver = {
		enable = true;
		libinput = {
			enable = true;
			mouse.naturalScrolling = true;
		};
		displayManager.lightdm = {
			enable = true;
			background = "/home/khushraj/.background-image";
			greeters.enso = {
				enable = true;
				blur = true;
				cursorTheme = {
					name = "Yaru";
					package = pkgs.yaru-theme;
				};
			};
		};
		desktopManager.session = [
			{
				name = "home-manager";
				start = ''
					${pkgs.runtimeShell} $HOME/.xsession &
					waitPID=$!
				'';
			}
		];
	};
}
