{ pkgs, ... }:

{
	fonts.fontconfig.enable = true;

	home.packages = [
		pkgs.nerd-fonts.blex-mono
	];
}
