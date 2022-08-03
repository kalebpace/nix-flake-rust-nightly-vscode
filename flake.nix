{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
    fenix.url = "github:nix-community/fenix";
  };

  outputs = { self, nixpkgs, utils, fenix }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { 
          inherit system; 
          overlays = [ fenix.overlay ];
        };
        rust-toolchain = pkgs.fenix.fromToolchainFile {
          file = ./rust-toolchain.toml;
          sha256 = "i2rzMf9nu5PXlOUk3LXBCVMRiTZDzlDW3x47/GPqAgw=";
        };
      in rec {
        devShell = with pkgs; mkShell {
          buildInputs = [
            rust-toolchain
            rust-analyzer-nightly
          ];
        };
      }
    );
}
