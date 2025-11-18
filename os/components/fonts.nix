{ pkgs, lib, ... }:

{
	fonts = {
		fontconfig.enable = lib.mkForce true;
		packages = with pkgs; [
			noto-fonts
			noto-fonts-cjk-sans
			noto-fonts-color-emoji
			font-awesome
			nerd-fonts.fira-code
		];
	};
}
