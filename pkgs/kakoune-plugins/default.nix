{
  pkgs,
  buildKakounePluginFrom2Nix,
  sources,
  sprout,
}:
{
  kakoune-themes = pkgs.callPackage ./kakoune-themes { inherit buildKakounePluginFrom2Nix; source = sources.kakoune-themes; };
  kakoune-scrollback = pkgs.callPackage ./kakoune-scrollback { source = sources.kakoune-scrollback; };
  kakoune-autothemes = pkgs.callPackage ./kakoune-autothemes { source = sources.kakoune-autothemes; };
  kakoune-sprout = pkgs.callPackage ./kakoune-sprout { source = sources.sprout; inherit sprout; };
}
