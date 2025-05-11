{
    description = "My first flake.";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
        nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
   

    nixConfig = {
        experimental-features = [ "flakes" "nix-command" ];
    };

    outputs = { nixpkgs, nixpkgs-unstable, ... }: let
        pkgs = import nixpkgs { inherit system; };
        pkgs-unstable = import nixpkgs-unstable { inherit system; };
        system = "x86_64-linux";
    in {
        devShells.${system} = {
            go = pkgs.mkShell {
                name = "go-development-shell";
                packages = with pkgs-unstable; [ go ];

                shellHook = ''
                  export PATH=~/go/bin:$PATH
                '';
            };
            nodejs = pkgs.mkShell {
                name = "nodejs-development-shell";
                packages = with pkgs; [ nodejs pnpm ];
            };
            rust = pkgs.mkShell {
                name = "rust-development-shell";
                packages = with pkgs; [ cargo rustc ];
            };
        };
        nixosConfigurations = {
            desktop = nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs = { inherit pkgs-unstable; };
                modules = [ ./hosts/desktop-${system}/configuration.nix ];
            };
            virtualisation-host = nixpkgs.lib.nixosSystem {
                inherit system;

                modules = [ ./hosts/virtualisation-host-${system}/configuration.nix ];
            };
        };
    };
}
