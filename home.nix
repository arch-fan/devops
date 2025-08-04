{ config, pkgs, ... }:

{
  # Must be
  home.username      = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";

  home.file.".config/nix/nix.conf".text = ''
    experimental-features = nix-command flakes
  '';

  home.packages = with pkgs; [
    argocd
  ];

  # Program section
  #programs.home-manager.enable = true;
  programs.lazygit.enable = true;
  programs.bat.enable = true;
  programs.lsd.enable = true;
  programs.lazydocker.enable = true;
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
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "autumn";
      editor = {
        cursor-shape.insert = "bar";
        auto-completion = true;
        true-color = true;
      };
    };
    languages = {
      language = [{
        name = "docker-compose";
        file-types = [{ glob = "compose.yml"; }];
      }];
    };
    extraPackages = with pkgs; [
      nixd
      docker-compose-language-service
      dockerfile-language-server-nodejs
      yaml-language-server
    ];
  };
  programs.fastfetch = {
    enable = true;
    #settings = {
    #  
    #};
  };

  # Shell aliases
  home.shellAliases = {
    # List aliases
    l = "ls -la";
    
    # Docker compose aliases
    dc = "docker compose";
    dcud = "dc up -d";
    dcudb = "dcud --build";

    # Git aliases
    ga = "git add";
    gcm = "git commit -m";
    gst = "git status";

    # Kubernetes
    k = "kubectl";
  };

  # Session variables
  home.sessionVariables = {
    COMPOSE_BAKE = "true";
  };

  home.stateVersion = "25.05";
}

