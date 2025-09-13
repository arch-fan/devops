{
  description = "Home Manager multi-sistema con flake-utils";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      # <-- Esto asegura que home-manager use el mismo nixpkgs
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, ... }:
       {
        homeConfigurations = {
          vortex = home-manager.lib.homeManagerConfiguration {
            pkgs = import nixpkgs { system = "x86_64-linux"; };
            modules = [ ./vortex.nix ];
          };

          raspberrypi = home-manager.lib.homeManagerConfiguration {
            pkgs = import nixpkgs { system = "aarch64"; };
            modules = [ ./raspberrypi.nix ];
          };
        }; 
      };
}

