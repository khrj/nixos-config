{ android-nixpkgs, ... }:

# Stored in "~/.local/share/android".
{
	imports = [
        android-nixpkgs.hmModule    
    ];

	nixpkgs.overlays = [ android-nixpkgs.overlays.default ];

    android-sdk.enable = true;
	android-sdk.packages = sdk: with sdk; [
		build-tools-34-0-0-rc3
		cmdline-tools-latest
		platform-tools
		platforms-android-33
	];
}
