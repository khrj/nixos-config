{ pkgs, ... }: 

{
	programs.chromium = {
		enable = true;
		package = pkgs.ungoogled-chromium;
		extensions = [
			{ id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
			{ id = "lckanjgmijmafbedllaakclkaicjfmnk"; } # ClearURLs
			{ id = "fkbfebkcoelajmhanocgppanfoojcdmg"; } # CodeCopy
			{ id = "ldpochfccmkkmhdbclfhpagapcfdljkj"; } # Decentraleyes
			{ id = "cekfddagaicikmgoheekchngpadahmlf"; } # Google search link fix
			{ id = "nkbihfbeogaeaoehlefnkodbefgpgknn"; } # MetaMask
			{ id = "ajhmfdgkijocedmfjonnpjfojldioehi"; } # Privacy pass
			{ id = "hipekcciheckooncpjeljhnekcoolahp"; } # Tabliss
			{ id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # uBlock Origin
		];
	};
}