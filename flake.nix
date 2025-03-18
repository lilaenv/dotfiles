{
  description = "Nix configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Packages
    ghostty.url = "github:ghostty-org/ghostty";
  };

  outputs = inputs @ { nixpkgs }: let
    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system} = {
        hello = pkgs.hello;
    };
  };
}
