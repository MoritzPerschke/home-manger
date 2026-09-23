{ pkgs, ... }:

{
  programs.fzf = {
    enable = true;

    defaultCommand = "${pkgs.fd}/bin/fd --type f --exclude .git";

    fileWidget.options = [
      "--preview='${pkgs.bat}/bin/bat --color=always --style=numbers --line-range=:500 {}'"
      "--bind='alt-h:reload(${pkgs.fd}/bin/fd --type f --exclude .git --hidden)'"
    ];

    historyWidget.options = [
      "--no-preview"
    ];
  };
}
