{ ... }:

{
	programs.chromium = {
		enable = true;
		extraOpts = {
			"IncognitoModeAvailability" = 1;
		};
	};
}