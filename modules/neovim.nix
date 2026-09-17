{ lib, pkgs, ... }:

{
  home.packages = [ pkgs.neovim ];

  home.activation.cloneNeovimConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    repo="$HOME/.config/nvim"

    if [ ! -d "$repo/.git" ]; then
      ${pkgs.git}/bin/git clone \
        https://github.com/MoritzPerschke/nvim.git \
        "$repo"
    fi
  '';
}
