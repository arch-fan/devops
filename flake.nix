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
      let
	system = builtins.currentSystem;
        pkgs = import nixpkgs { inherit system; };
      in {
        homeConfigurations.default =
          home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [ ./home.nix ];
          };
      };
}

