{ ... }:

let
	disable = "/home/khushraj"; # Setting directories to the home directory disables them
in
{
	xdg = {
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
				"x-scheme-handler/http" = "chromium-browser.desktop";
				"x-scheme-handler/https" = "chromium-browser.desktop";
				"x-scheme-handler/mailspring" = "Mailspring.desktop";

				# Application
				"application/pdf" = "chromium-browser.desktop";

				# Text
				"text/html" = "code.desktop";
				"text/markdown" = "code.desktop";
				"text/plain" = "code.desktop";
			};
		};
	};
}