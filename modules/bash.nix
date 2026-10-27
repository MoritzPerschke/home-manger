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

	if [[ ! -d "$repo/.git" ]]; then
		run ${pkgs.git}/bin/git clone \
		https://github.com/MoritzPerschke/bash-stuff.git "$repo" \
		|| echo "warning: failed to clone bash config" >&2
		run ${pkgs.git}/bin/git -C "$repo" remote set-url origin \
		git@github.com:MoritzPerschke/bash-stuff.git || true
	fi

	if [[ -f "$repo/clang-format" ]]; then
		run ln -sf "$repo/clang-format" "$HOME/.clang-format"
	fi
	'';

	home.sessionPath = [ "$HOME/.cargo/bin" ];

}
