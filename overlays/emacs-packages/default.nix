self: super:
let
  sources = super.callPackage ../../_sources/generated.nix { };
  nurEmacsPackages = super.callPackage ../../pkgs/emacs-packages {
    inherit sources;
    epkgs = super.emacs.pkgs;
  };
in
{
  emacsPackages = super.emacsPackages // nurEmacsPackages;
}