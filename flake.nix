{
  description = "My first flake.";

  inputs = {
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager/release-24.11";
    };
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };
   

  nixConfig = {
    experimental-features = [ "flakes" "nix-command" ];
  };

  outputs = { home-manager, nixpkgs, nixpkgs-unstable, ... }: let
    pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
    pkgs-unstable = import nixpkgs-unstable { inherit system; };
    system = "x86_64-linux";
  in {
    devShells.${system} = {
      go = pkgs.mkShell {
        name = "Go Development Shell Environment";
        packages = with pkgs-unstable; [ go ];

        shellHook = ''
          export PATH=~/go/bin:$PATH
        '';
      };

      nodejs = pkgs.mkShell {
        name = "Node.js Development Shell Environment";
        packages = with pkgs; [ nodejs pnpm ];
      };

      rust = pkgs.mkShell {
        name = "Rust Development Shell Environment";
        packages = with pkgs-unstable; [ cargo clippy rustc rustfmt rustup ];

        shellHook = ''
          export PATH=~/.cargo/bin:$PATH
        '';

        RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
      };
    };

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

        specialArgs = { inherit pkgs pkgs-unstable; };
      };
    };
  };
}
