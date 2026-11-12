{ config, pkgs, ... }:

{
  programs.kitty = {
          enable = true;
          package = null;

          font = {
                  name = "BlexMono Nerd Font";
                  size = 14;
          };
          
          settings = {
                  confirm_os_window_close = 0;
                  enable_audio_bell = false;
                  background_opacity = 0.8;
                  shell = "bash";
                  kitty_mod = "alt+shift";
          };

          extraConfig = ''
          # DMS theme, only present on machines where DMS is installed
          globinclude dank-*.conf
          '';
  };

  programs.bash.shellAliases = {
          ssh = "kitten ssh";
  };
}
