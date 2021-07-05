{ config, pkgs, lib, ... }:

{
	xsession = {
		enable = true;
		windowManager.i3 = {
			enable = true;
			package = pkgs.i3-gaps;
			extraConfig = ''for_window [class=".*"] border pixel 0'';
			config = {
				menu = "rofi -show drun";
				modifier = "Mod4";
				floating.modifier = "Mod4";
				focus.followMouse = false;
				gaps.inner = 15;
				terminal = "kitty";
				startup = [{ command = "hsetroot -cover ~/.background-image"; notification = false; }];
				bars = [
					{
						command = "i3bar --transparency";
						position = "top";
						statusCommand = "i3status-rs ~/.config/i3status-rust/config-default.toml";
						fonts = {
							names = ["pango:DejaVu Sans" "FontAwesome"];
							size = 10.0;
						};
						colors = {
							background  = "#FFFFFF80";
							statusline = "#000000FF";
							inactiveWorkspace = {
								background = "#FFFFFF80";
								border = "#FFFFFF80";
								text = "#000000FF";
							};
							focusedWorkspace = {
								background = "#006EF5FF";
								border = "#FFFFFF80";
								text = "#FFFFFFFF";
							};
						};
					}
				];
				keybindings = 
				  let
					mod = config.xsession.windowManager.i3.config.modifier;
					menu = config.xsession.windowManager.i3.config.menu;
				  in lib.mkOptionDefault {
					"${mod}+space" = ''exec "${menu}"'';
				  	"${mod}+shift+s" = "focus mode_toggle";
					"${mod}+d" = "focus child";
				  };
			};
		};
	};
}
