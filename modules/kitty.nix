{pkgs, ... }:

## Workaround for outdated Ubuntu station
let
  kitty = pkgs.symlinkJoin {
	name = "kitty-wrapped";
	paths = [ pkgs.kitty ];

	nativeBuildInputs = [ pkgs.makeWrapper ];
	postBuild = ''
		wrapProgram $out/bin/kitty \
			--set LD_LIBRARY_PATH "${pkgs.mesa}/lib:${pkgs.libglvnd}/lib"
		'';
	};
in 
##
{
	programs.kitty = {
		enable = true;
		package = kitty; ## Workaround for outdated Ubuntu station

		font = {
			name = "BlexMono Nerd Font";
			size = 12;
		};
		
		settings = {
			confirm_os_window_close = 0;
			enable_audio_bell = false;
			shell = "bash";
		};

	};
}
