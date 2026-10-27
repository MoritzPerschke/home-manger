{ lib, pkgs, ... }:

{
  home.packages = [ pkgs.neovim ];

  home.activation.cloneNeovimConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    repo="$HOME/.config/nvim"

    if [ ! -d "$repo/.git" ]; then
      run ${pkgs.git}/bin/git clone \
        https://github.com/MoritzPerschke/nvim.git "$repo" \
        || echo "warning: failed to clone nvim config" >&2
      run ${pkgs.git}/bin/git -C "$repo" remote set-url origin \
        git@github.com:MoritzPerschke/nvim.git || true
    fi
  '';
}
