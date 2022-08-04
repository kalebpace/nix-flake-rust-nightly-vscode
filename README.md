# Nix, Rust Nightly, and VSCodium walk into a bar...

This repository intends to be a template for starting nix-based rust projects, with the nightly toolchain, and integration with VSCodium.

It's heavily inspired by trying to recreate the _Remote Development Extension Pack_ workflow exclusive to proprietary VSCode. Ideally, in the future, one can define their VS Code extensions as part of the Nix Flake as well.

I have commented each file I think is relevant for understanding the Nix setup. There were quite a few tears shed trying to get a simple-to-understand config, so hopefully this will help any newcomers to Nix the package manager, and Nix the language, have an easier time. 

## Credits

I really couldn't have learned this bit of Nix without the help of the following blogs and people who add much needed context to Nix documentation:
- https://xeiaso.net/blog/how-i-start-nix-2020-03-08
- https://xeiaso.net/blog/nix-flakes-1-2022-02-21
- https://www.tomhoule.com/2021/building-rust-wasm-with-nix-flakes/
- https://blog.mplanchard.com/posts/nixifying-the-blog.html