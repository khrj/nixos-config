{ ... }:

{
	programs.ssh = {
		enable = true;
		extraConfig = "SetEnv TERM=xterm-256color";
	};
}