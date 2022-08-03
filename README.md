# Nix, Rust Nightly, and VSCodium walk into a bar...

This repository intends to be a template for starting nix-based rust projects, with the nightly toolchain, and integration with VSCodium.

It's heavily inspired by trying to recreate the _Remote Development Extension Pack_ workflow exclusive to proprietary VSCode. Ideally, in the future, one can define their VS Code extensions as part of the Nix Flake as well.

I have commented each file I think is relevant for understanding the Nix setup. There were quite a few tears shed trying to get a simple-to-understand config, so hopefully this will help any newcomers to Nix the package manager, and Nix the language, have an easier time. 