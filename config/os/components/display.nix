{ pkgs, ... }:

{
	# Tracks open applications
	services.bamf.enable = true;
	services.xserver = {
		enable = true;
		libinput = {
			enable = true;
			mouse.naturalScrolling = true;
		};
		desktopManager.session = [
			{
				name = "i3";
				start = ''
					${pkgs.runtimeShell} $HOME/.hm-xsession &
					waitPID=$!
				'';
			}
		];
	};
}
