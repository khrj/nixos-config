{ pkgs, lib, ... }:

{
	fonts = {
		fontconfig.enable = lib.mkForce true;
		packages = with pkgs; [
			noto-fonts
			noto-fonts-cjk-sans
			noto-fonts-extra
			noto-fonts-emoji
			font-awesome
			(nerdfonts.override { fonts = [ "FiraCode" ]; })
		];
	};
}
