{
  lib,
  fetchFromGitHub,
  buildKakounePluginFrom2Nix,
}:

buildKakounePluginFrom2Nix {
  pname = "kakoune-themes";
  version = "unstable-2024-09-04";

  src = fetchFromGitHub {
    owner = "anhsirk0";
    repo = "kakoune-themes";
    rev = "263a7da47404ea94cf43eeab89167d828caea565";
    hash = "sha256-6ZJuhxMozTKtS5gTmFcVS99+stCaxXcXlqCdlvm5VE8=";
  };

  meta = {
    description = "Beautiful Color schemes for kakoune";
    homepage = "https://github.com/anhsirk0/kakoune-themes";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "kakoune-themes";
    platforms = lib.platforms.all;
  };
}
