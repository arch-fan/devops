{ config, pkgs, ... }:

{
  home.username      = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";

  programs.home-manager.enable = true;

  home.shellAliases = {
    ll  = "ls -la";
    gst = "git status";
  };
}

