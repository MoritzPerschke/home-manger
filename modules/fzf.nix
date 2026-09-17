{ pkgs, ... }:

{
  programs.fzf = {
    enable = true;

    defaultCommand = "${pkgs.fd}/bin/fd --type f --exclude .git";

    defaultOptions = [
      "--preview='${pkgs.bat}/bin/bat --color=always --style=numbers --line-range=:500 {}'"
      "--bind='alt-h:reload(${pkgs.fd}/bin/fd --type f --exclude .git --hidden)'"
    ];
  };
}
