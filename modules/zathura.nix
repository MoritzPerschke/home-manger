{ pkgs, ... }:

{
	programs.zathura = {
		enable = true;

		options = {
			selection-clipboard = "clipboard";
			window-title-basename = true;
			adjust-open = "best-fit";
		};
	};
}
