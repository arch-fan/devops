{ config, pkgs, ... }:

{
  imports = [
    ../modules/base.nix
    ../modules/helix.nix
  ];
  home.username      = "juan";
  home.homeDirectory = "/home/juan";

  services.podman = {
    enable = true;
  };

  home.packages = with pkgs; [
    docker-compose
  ];
}