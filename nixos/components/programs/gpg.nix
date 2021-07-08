{ ... }:

{
	# Auto unlock on login
	security.pam.services.lightdm.gnupg.enable = true;
	programs.gnupg.agent = {
		enable = true;
		enableSSHSupport = true;
	};
}