{ config, pkgs, ... }:

{
	imports = [
		./modules/fonts.nix
		./modules/kitty.nix
		./modules/zathura.nix
	];

	home.stateVersion = "24.05";

	home.packages = with pkgs; [
		ripgrep
		fzf
		fd
	];

	programs.home-manager.enable = true;
}
