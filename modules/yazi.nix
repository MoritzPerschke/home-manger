{ pkgs, ... }:

{
	programs.yazi = {
		enable = true;
		enableBashIntegration = true;
		shellWrapperName = "yz";

		flavors = {
			inherit (pkgs.yaziPlugins) kanagawa;
		};

		theme.flavor = {
			dark = "kanagawa";
		};

		settings = {
			log.enabled = false;
			mgr = {
				show_hidden = false;
				sort_dir_first = true;
			};
		};
	};
}
