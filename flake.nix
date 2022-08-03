{
  # Define your default inputs. These inputs could be overriden by other users
  # when using this flake to customize it to their needs
  # (which is out of scope for this template)
  inputs = {
    # I tend to prefer unstable channels as its easier to find 
    # github issues when things break
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # flake-utils helps us remove cross-platform boilerplate
    utils.url = "github:numtide/flake-utils";

    # provides a nix 'overlay' with the nightly rust toolchain.
    # Per the project's description, it aims to replace rustup usage
    # in flake-based projects. Also ships with rust-analyzer-nightly
    fenix.url = "github:nix-community/fenix";
  };

  outputs = { self, nixpkgs, utils, fenix }:

    # Define a system environment for your machine (e.g. )
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { 
          # Inherit our current system environment configuration so nixpkgs
          # will fetch proper architectures, etc. 
          inherit system;

          # Apply the rust overlay which overrides any packages of 
          #the same name found in nixpkgs 
          overlays = [ fenix.overlay ];
        };

        # Define our desired toolchain based off a standard rust toolchain file.
        # You could define the same components inside here, but rust-toolchain.toml
        # is better documented, so it makes more sense.
        rust-toolchain = pkgs.fenix.fromToolchainFile {
          file = ./rust-toolchain.toml;

          # I cheated and used a dummy sha to cause a conflict, where I then copied 
          # the conflicting sha here to resolve the error. Unsure how to find the sha
          # "properly".  
          sha256 = "i2rzMf9nu5PXlOUk3LXBCVMRiTZDzlDW3x47/GPqAgw=";
        };
      in rec {

        # Define the shell we want to drop into when VSCodium loads or
        # 'nix develop' is run 
        # 
        # 'with pkgs' scopes the following statement with that namespace,
        # so we don't need to type 'pkgs.rust-analyzer-nightly' and instead
        # directly reference it.
        devShell = with pkgs; mkShell {
          buildInputs = [
            rust-toolchain
            rust-analyzer-nightly
          ];
        };
      }
    );
}
