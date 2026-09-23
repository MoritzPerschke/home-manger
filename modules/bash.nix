{ lib, pkgs, ... }:

{
	programs.bash = {
		enable = true;

		initExtra = ''
			bash_config="$HOME/.config/bash"

			if [[ -d "$bash_config/bashrc.d" ]]; then
				for file in "$bash_config"/bashrc.d/*.bash; do
				[[ -f "$file" ]] && source "$file"
				done
			fi
		'';
	};

	home.activation.cloneBashConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
		repo="$HOME/.config/bash"
		bin="$HOME/.nix-profile/bin"

		if [[ ! -d "$repo/.git" ]]; then
			${pkgs.git}/bin/git clone \
				https://github.com/MoritzPerschke/bash-stuff.git \
				"$repo"
		fi
		
		if [[ -f $repo/clang-format ]]; then
			ln -sf "$repo/clang-format" "$HOME/.clang-format"
		fi
	'';

}
