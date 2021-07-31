{ ... }:

let
	disable = "/home/khushraj"; # Setting directories to the home directory disables them
in
{
	xdg = {
		configFile."mimeapps.list".force = true; # Overwrite mimeapps.list without prompting
		userDirs = {
			enable = true;
			createDirectories = true;
			desktop     = disable;
			documents   = disable;
			download    = "/home/khushraj/Downloads";
			music       = disable;
			pictures    = disable;
			publicShare = disable;
			templates   = disable;
			videos      = disable;
		};
		mimeApps = {
			enable = true;
			defaultApplications = {
				# Links
				"x-scheme-handler/http" = "google-chrome.desktop";
				"x-scheme-handler/https" = "google-chrome.desktop";
				"x-scheme-handler/mailspring" = "Mailspring.desktop";

				# Application
				"application/pdf" = "google-chrome.desktop";

				# Text
				"text/html" = "idea-ultimate.desktop";
				"text/markdown" = "idea-ultimate.desktop";
				"text/plain" = "idea-ultimate.desktop";
			};
		};
	};
}