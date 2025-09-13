{ pkgs, ... }:
{
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
  programs.bat.enable = true;
  programs.lsd.enable = true;
  programs.ripgrep.enable = true;
  programs.bash = {
    enable = true;
    initExtra = ''
      fastfetch
    '';
  };
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };
  programs.fastfetch = {
    enable = true;
  };
  # Shell aliases
  home.shellAliases = {
    # List aliases
    l = "ls -la";

    # Git aliases
    ga = "git add";
    gcm = "git commit -m";
    gst = "git status";
  };

  # Session variables
  home.sessionVariables = {
    COMPOSE_BAKE = "true";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "25.05";
}