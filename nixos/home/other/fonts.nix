{ pkgs, lib, ... }:

{
	fonts.fontconfig.enable = lib.mkForce true;
	home.packages = with pkgs; [
		noto-fonts
		noto-fonts-cjk
		noto-fonts-extra
		noto-fonts-emoji
		font-awesome
		(nerdfonts.override { fonts = [ "FiraCode" ]; })
	];
}