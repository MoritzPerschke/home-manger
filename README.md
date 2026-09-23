# Home Manager config for use across any machine i might use
## Setup
`home-manager switch --flake .#default --extra-experimental-features 'nix-command flakes' --impure -b backup`

- `--impure` is needed to get user and hostname
  `--extra-experimental-feature ...` in case they aren't already enabled

## Modules

### bash.nix
Clones my 'old' bash config from [git](https://github.com/MoritzPerschke/bash-stuff) and sources the config files that define aliases, functions, etc.
It then also symlinks the `.clang-format` file (if present) to home as a fallback for projects that don't provide one.

### bat.nix
Enables [bat](https://github.com/sharkdp/bat) and aliases `cat` to invoke `bat` instead.

### fonts.nix
Installs the [IBM Plex Mono Nerdfont](https://www.programmingfonts.org/#plex-mono).

### fzf
The bash integration provides three keyboard shortcuts:
- `Ctrl+t`: find files and insert selected into command line
- `Ctrl+r`: search through command history
- `Alt+c`: find directories and `cd` to selected

### git.nix
Configures name, email, difftool and layout as well as pull strategy.
Includes gitignore values that should be applicable everywhere (virtualenvs, build dirs, ...)

### kitty.nix
Enables kitty and applies basic config such as modifier keys, opacity, disabling 'are you sure you want to close...' prompt.
Also includes a LLM generated wrapper since nix and kitty's hardware acceleration were acting up.
### lazygit.nix
Enables lazygit and aliases 'lg' to run it.
### neovim.nix
Enables neovim and clones [my config](https://github.com/MoritzPerschke/nvim) into `~/.config/nvim`.
### yazi.nix
Enables yazi and applies a theme.
Also provides a `yz` function that configures `q` to exit an return to where it was opened while `Q` exits in the currently selected dir.


> [!NOTE]
> I omitted uninteresting modules

