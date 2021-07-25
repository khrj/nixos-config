{ unstable, ... }:

{
	services.mysql = {
		enable = true;
		package = unstable.mysql80;
	};
}
