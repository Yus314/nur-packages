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

rec {
  # The `lib`, `modules`, and `overlays` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  bizin-gothic-nf = pkgs.callPackage ./pkgs/bizin { source = sources.bizin-gothic-nf; };
  aquaskk = pkgs.callPackage ./pkgs/AquaSKK { source = sources.aquaskk; };
  qutebrowser = pkgs.qutebrowser;
  vivaldi = pkgs.vivaldi;

  # Input method packages
  cskk = pkgs.callPackage ./pkgs/cskk { source = sources.cskk; };
  fcitx5-cskk = pkgs.callPackage ./pkgs/fcitx5-cskk {
    source = sources.fcitx5-cskk;
    inherit cskk;
    fcitx5-qt = pkgs.libsForQt5.fcitx5-qt;
    qtbase = pkgs.libsForQt5.qtbase;
    wrapQtAppsHook = pkgs.libsForQt5.wrapQtAppsHook;
  };

  # Niri packages
  niri-taskbar = pkgs.callPackage ./pkgs/niri-taskbar { source = sources.niri-taskbar; };

  # Nyxt packages
  nx-rbw = pkgs.callPackage ./pkgs/nx-rbw { source = sources.nx-rbw; };
  nx-zotero = pkgs.callPackage ./pkgs/nx-zotero { source = sources.nx-zotero; };

  # Python packages
  pyxirr = pkgs.callPackage ./pkgs/pyxirr { source = sources.pyxirr; };
  rich-click = pkgs.callPackage ./pkgs/rich-click { source = sources.rich-click; };
  hledger-lots = pkgs.callPackage ./pkgs/hledger-lots {
    source = sources.hledger-lots;
    inherit pyxirr rich-click;
  };

  nurEmacsPackages = pkgs.lib.recurseIntoAttrs (
    pkgs.callPackage ./pkgs/emacs-packages {
      inherit sources;
      epkgs = pkgs.emacs.pkgs;
    }
  );
  kakounePlugins = pkgs.recurseIntoAttrs (
    pkgs.callPackage ./pkgs/kakoune-plugins {
      inherit (pkgs.kakouneUtils) buildKakounePluginFrom2Nix;
      inherit sources;
    }
  );
}
