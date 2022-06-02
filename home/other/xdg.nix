{ userDetails, ... }:

let
	disable = "/home/${userDetails.username}"; # Setting directories to the home directory disables them
in
{
	xdg = {
		configFile."mimeapps.list".force = true; # Overwrite mimeapps.list without prompting
		userDirs = {
			enable = true;
			createDirectories = true;
			desktop     = disable;
			documents   = disable;
			download    = "/home/${userDetails.username}/Downloads";
			music       = disable;
			pictures    = disable;
			publicShare = disable;
			templates   = disable;
			videos      = disable;
		};
		mimeApps = {
			enable = true;
			defaultApplications = {
				"x-scheme-handler/http" = "google-chrome.desktop";
				"x-scheme-handler/https" = "google-chrome.desktop";

				"application/pdf" = "okularApplication_pdf.desktop";
				"application/x-cd-image" = "gnome-disk-image-mounter.desktop";

				"text/html" = "code.desktop";
				"text/markdown" = "code.desktop";
				"text/plain" = "org.gnome.gedit.desktop";

				"image/png" = "shotwell-viewer.desktop";
				"image/jpeg" = "shotwell-viewer.desktop";
				"image/tiff" = "shotwell-viewer.desktop";
				"image/bmp" = "shotwell-viewer.desktop";

				"video/mp4" = "vlc.desktop";
			};
		};
	};
}