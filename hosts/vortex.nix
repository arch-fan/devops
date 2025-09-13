{ config, pkgs, ... }:

{
  imports = [
    ../modules/base.nix
    ../modules/helix.nix
  ];

  home.username      = "vortex";
  home.homeDirectory = "/home/vortex";

  home.packages = with pkgs; [
    argocd
  ];

  # Shell aliases
  home.shellAliases = {
    # Kubernetes
    k = "kubectl";
  };

}

