# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{
  pkgs ? import <nixpkgs> { overlays = builtins.attrValues (import ./overlays); },
}:
let
  sources = pkgs.callPackage ./_sources/generated.nix { };
in

{
  # The `lib`, `modules`, and `overlays` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  bizin-gothic-nf = pkgs.callPackage ./pkgs/bizin { };
  aquaskk = pkgs.callPackage ./pkgs/AquaSKK { source = sources.aquaskk; };
  qutebrowser = pkgs.qutebrowser;
  vivaldi = pkgs.vivaldi;

  nurEmacsPackages = pkgs.recurseIntoAttrs (
    pkgs.callPackage ./pkgs/emacs-packages {
      inherit sources;
      epkgs = pkgs.emacs.pkgs;
    }
  );
}
