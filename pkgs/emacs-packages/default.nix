{
  pkgs,
  melpaBuild,
  sources,
}:
{
  org-modern-indent = pkgs.callPackage ./org-modern-indent {
    inherit melpaBuild;
    source = sources.org-modern-indent;
  };
}
