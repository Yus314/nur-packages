{
  lib,
  source,
  buildKakounePluginFrom2Nix,
}:

buildKakounePluginFrom2Nix {
  pname = "kakoune-themes";
  inherit (source) version src;

  meta = {
    description = "Beautiful Color schemes for kakoune";
    homepage = "https://github.com/anhsirk0/kakoune-themes";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
    platforms = lib.platforms.all;
  };
}
