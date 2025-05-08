{ pkgs, ... }: 

{
	programs.fish = {
		enable = true;
		shellAliases = {
			## Rust rewrites
			cat      = "echo FATAL: Use bat";   # https://github.com/sharkdp/bat
#			ls       = "echo FATAL: Use eza";   # https://github.com/eza-community/eza
			find     = "echo FATAL: Use fd";    # https://github.com/sharkdp/fd
			sed      = "echo FATAL: Use sd";    # https://github.com/chmln/sd
			grep     = "echo FATAL: Use rg";    # https://github.com/BurntSushi/ripgrep
			ps       = "echo FATAL: Use procs"; # https://github.com/dalance/procs
			top      = "echo FATAL: Use btm";   # https://github.com/ClementTsang/bottom
			regexgen = "echo FATAL: Use grex";  # https://github.com/pemistahl/grex

			# tldr       -> tealdeer, but bin is still tldr      @ https://github.com/dbrgn/tealdeer
			# Worth mentioning:
			# - cd       -> zoxide                               @ https://github.com/ajeetdsouza/zoxide
			# - hyperfine                                        @ https://github.com/sharkdp/hyperfine
			# - tokei                                            @ https://github.com/XAMPPRocky/tokei
			# - bandwhich                                        @ https://github.com/imsnif/bandwhich
			# - nushell                                          @ https://github.com/nushell/nushell
			# - starship                                         @ https://github.com/starship/starship
			# - dust                                             @ https://github.com/bootandy/dust

			## Other
			ls       = "eza --icons";
			sl       = "eza --icons";
			nano     = "micro";
			open     = "xdg-open";
		};

		interactiveShellInit = ''
			set --export DIRENV_LOG_FORMAT ""
			set --export ATUIN_NOBIND "true"
			bind \cr _atuin_search
			set --export MICRO_TRUECOLOR 1

			if test "$TERM_PROGRAM" != "vscode"
				eval (${pkgs.zellij}/bin/zellij setup --generate-auto-start fish | string collect)
			end
		'';
	};
}
