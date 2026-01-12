{
  pkgs,
  buildKakounePluginFrom2Nix,
  sources,
}:
{
  kakoune-themes = pkgs.callPackage ./kakoune-themes { inherit buildKakounePluginFrom2Nix; };
}
