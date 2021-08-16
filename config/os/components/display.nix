{ pkgs, ... }:

{
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
