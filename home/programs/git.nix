{ userDetails, ... }:

{
	programs.git = {
		enable = true;
		lfs.enable = true;
		settings = {
			user = {
				email = userDetails.email;
				name = userDetails.name;
			};
			core = {
				editor = "code --wait --new-window";
			};
			init = {
				defaultBranch = "main";
			};
			tag = {
				forceSignAnnotated = true;
			};
		};
		ignores = [ ".idea" ".direnv" ];
		signing = {
			signByDefault = true;
			key = "19883FD8EA2EB4EC0A931E22B77B2A40E7702F19";
		};
	};
}