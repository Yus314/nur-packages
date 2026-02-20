{
  pkgs,
  buildKakounePluginFrom2Nix,
  sources,
}:
{
  kakoune-themes = pkgs.callPackage ./kakoune-themes { inherit buildKakounePluginFrom2Nix; };
  kakoune-scrollback = pkgs.callPackage ./kakoune-scrollback { source = sources.kakoune-scrollback; };
}
