{ ... }:

{
	services.pulseaudio.enable = false;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		pulse.enable = true;
	};
}