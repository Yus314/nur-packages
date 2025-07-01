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

  # Emacs packages
  gcal = pkgs.callPackage ./pkgs/emacs-packages/gcal {
    inherit (pkgs.emacs.pkgs) melpaBuild;
    source = sources.gcal;
  };
  org-modern-indent = pkgs.callPackage ./pkgs/emacs-packages/org-modern-indent {
    inherit (pkgs.emacs.pkgs) melpaBuild;
    source = sources.org-modern-indent;
  };
  ol-emacs-slack = pkgs.callPackage ./pkgs/emacs-packages/ol-emacs-slack {
    inherit (pkgs.emacs.pkgs) melpaBuild dash s;
    source = sources.ol-emacs-slack;
  };
  org-roam-review = pkgs.callPackage ./pkgs/emacs-packages/org-roam-review {
    inherit (pkgs.emacs.pkgs) melpaBuild dash org-drill org-roam ts ht;
    source = sources.org-roam-review;
  };
  typst-preview = pkgs.callPackage ./pkgs/emacs-packages/typst-preview {
    inherit (pkgs.emacs.pkgs) melpaBuild websocket;
    source = sources.typst-preview;
  };
  claude-code-ide = pkgs.callPackage ./pkgs/emacs-packages/claude-code-ide {
    inherit (pkgs.emacs.pkgs) melpaBuild vterm;
    source = sources.claude-code-ide;
  };
}
