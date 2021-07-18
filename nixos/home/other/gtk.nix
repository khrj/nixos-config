{ ... }: 

{
	gtk = {
		enable = true;
		iconTheme.name = "Yaru";
		theme.name = "Yaru";
		gtk3 = {
			extraConfig.gtk-cursor-theme-name = "Yaru";
			extraCss = ''
				.background decoration {
					padding: 0px;
					border: 0px;
				}
			'';
		};
	};
}
