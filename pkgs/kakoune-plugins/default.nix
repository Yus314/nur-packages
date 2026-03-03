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
  kakoune-markdown-render = pkgs.callPackage ./kakoune-markdown-render { source = sources.kakoune-markdown-render; };
  kakoune-sprout = pkgs.callPackage ./kakoune-sprout { source = sources.sprout; inherit sprout; };
}
