{ pkgs, ... }:

{
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
		noto-fonts
		noto-fonts-cjk
		noto-fonts-extra
		noto-fonts-emoji
		font-awesome
		(nerdfonts.override { fonts = [ "FiraCode" ]; })
	];
}