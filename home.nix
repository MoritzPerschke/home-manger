{ config, pkgs, ... }:

{
	imports = [
		./modules/bat.nix
		./modules/fonts.nix
		./modules/kitty.nix
		./modules/zathura.nix
		./modules/yazi.nix
		./modules/fzf.nix
	];

	home.stateVersion = "24.05";

	home.packages = with pkgs; [
		ripgrep
		fd
		tealdeer
	];

	programs.home-manager.enable = true;
}
