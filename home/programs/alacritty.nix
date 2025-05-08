{ ... }:

{
	programs.alacritty = {
		enable = true;
		theme = "solarized_dark";
		settings = {
			font.normal.family = "FiraCode Nerd Font Mono";
			window = {
				decorations = "None";
				dimensions = {
					columns = 133;
					lines = 40;
				};
			};
			cursor = {
				style = "Beam";
			};
			terminal.shell = {
				program = "zellij";
				args = ["-l" "welcome"];
			};
			keyboard.bindings = [
				{ key = "N"; mods="Control"; action = "SpawnNewInstance"; }
			];
		};
	};
}
