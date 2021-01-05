{ lib, pkgs, ... }:

with builtins;

{
  imports = [ ./yubikey.nix ];
  # Let Home Manager install and manage itself.
  programs = { home-manager.enable = true; };

  xdg = {
    enable = true;
    mimeApps.enable = true;
  };

  manual.html.enable = true;

  #nixpkgs.config.allowUnfree = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.03";

  fonts.fontconfig.enable = pkgs.lib.mkForce true;

  home.file."bin/ez-flash".source = ./scripts/ez-flash;
  home.file."bin/gotty-tmux".source = ./scripts/gotty-tmux;
  home.file."bin/tunnel".source = ./scripts/tunnel;
  home.file."bin/lockscreen".source = ./scripts/lockscreen;
}
