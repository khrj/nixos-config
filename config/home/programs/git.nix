{ ... }:

{
	programs.git = {
		enable = true;
		userEmail = "khushraj.rathod@gmail.com";
		userName = "Khushraj Rathod";
		ignores = [ ".idea" ];
		signing = {
			signByDefault = true;
			key = "19883FD8EA2EB4EC0A931E22B77B2A40E7702F19";
		};
		extraConfig = {
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
	};
}