{ pkgs, ... }:

{
	services.picom = {
		enable = true;
		# Use ibhagwan/picom for background blur and rounded corners
		package = pkgs.picom.overrideAttrs(o: {
			src = pkgs.fetchFromGitHub {
				repo = "picom";
				owner = "ibhagwan";
				rev = "44b4970f70d6b23759a61a2b94d9bfb4351b41b1";
				sha256 = "0iff4bwpc00xbjad0m000midslgx12aihs33mdvfckr75r114ylh";
			};
		});
		experimentalBackends = true;
		blur = true;
		fade = true;
		fadeSteps = ["0.1" "0.1"];
		inactiveOpacity = "0.9";
		opacityRule = [
			"75:class_g = 'kitty'"
		];
		vSync = true;
		menuOpacity = "0.8";
		extraOptions = ''
frame-opacity = 0.7
inactive-opacity-override = false
corner-radius = 7.0

blur = {
	background-frame = true
	method = "dual_kawase"
	strength = 10
	kern = "3x3box"
}

daemon = true
mark-wmwin-focused = true
mark-ovredir-focused = true
detect-rounded-corners = true
detect-client-opacity = true
detect-transient = true
detect-client-leader = true
use-damage = true
log-level = "warn"

# wintypes = {
# 	tooltip = { 
# 		fade = true
# 		shadow = true
# 		opacity = 0.75 
# 		focus = true 
# 		full-shadow = false
# 		corner-radius = 0.0 
# 	}
# 	dock = { corner-radius = 0.0 }
# }
		'';
	};
}