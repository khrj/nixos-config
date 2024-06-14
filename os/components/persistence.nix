{ userDetails, ... }:

{
	# Important for boot, "files" won't work
	environment.etc."passwd".source = "/nix/persist/etc/passwd";
	environment.etc."shadow".source = "/nix/persist/etc/shadow";
	environment.persistence."/nix/persist" = {
		hideMounts = true;
		directories = [
			"/var/log"
			"/etc/ssh"
			"/etc/docker"
			"/var/lib/docker"
		];
		users."${userDetails.username}" = {
			directories = [
				"Data"
				"nixos-config"
				"Downloads"
				
				".vscode"
				".cache"
				
				# Home manager
				".local/state/nix"  
				".local/state/home-manager"
				
				# Chrome PWAs
				".local/share/applications"
				".local/share/icons"
				
				# App Data
				".local/share/atuin"
				".local/share/fish"
				".config/Code"
				".config/dconf"
				".config/GitKraken"
				".config/Google-Chrome"
				
				".local/share/direnv"
				{ directory = ".gnupg"; mode = "0700"; }
				{ directory = ".ssh"; mode = "0700"; }
				{ directory = ".local/share/keyrings"; mode = "0700"; }
			];
		};
	};
}