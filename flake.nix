{
  description = "My first flake.";

  inputs = {
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager/release-24.11";
    };
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
  };

  nixConfig = {
    experimental-features = [ "flakes" "nix-command" ];
  };

  outputs = { home-manager, nixpkgs, ... }: let
    pkgs = import nixpkgs {
      inherit system;

      config.allowUnfree = true;

      overlays = [
        (import ./overlays/vscode.nix) 
      ]; 
    };
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          home-manager.nixosModules.home-manager
          ./hosts/desktop/configuration.nix
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.yunus = import ./home-manager/yunus.nix;
            };
          }
        ];

        specialArgs = { inherit pkgs; };
      };
    };
  };
}
