# neovim-flake

A highly configurable nix flake for neovim. This flake allows for simple configuration and has lsp, fomartting and treesitter support for the following languges

```
bash
clang
css
go
haskell
html
java
kotlin
markdown
nix
plantuml
python
rust
sclang
sql
tailwindcss
terraform
tidal
ts
zig
```

This is a fork of jordanisaacs's flake - [manual](https://jordanisaacs.github.io/neovim-flake/) - [matrix chat](https://matrix.to/#/#neovim-flake:matrix.org) just with support for different lanugages and plugins.

## Test it yourself

```
nix run github:vhsconnect/neovim-flake
```

## Screenshot

![screenshot](./screenshot.png)

## Philosophy - upstream

The philosophy behind this flake configuration is to allow for easily configurable and reproducible neovim environments. Enter a directory and have a ready to go neovim configuration that is the same on every machine. Whether you are a developer, writer, or live coder (see tidal cycles below!), quickly craft a config that suits every project's need. Think of it like a distribution of Neovim that takes advantage of pinning vim plugins and third party dependencies (such as tree-sitter grammars, language servers, and more).

As a result, one should never get a broken config when setting options. If setting multiple options results in a broken neovim, file an issue! Each plugin knows when another plugin which allows for smart configuration of keybindings and automatic setup of things like completion sources and languages.

## Credit

Originally based on jordanisaacs's amazing [neovim-flake](https://github.com/jordanisaacs/neovim-flake)
