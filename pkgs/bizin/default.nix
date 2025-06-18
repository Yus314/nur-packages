{
  lib,
  stdenvNoCC,
  fetchzip,
}:

stdenvNoCC.mkDerivation rec {
  pname = "bizin-gothic-nf";
  version = "0.0.4";

  src = fetchzip {
    url = "https://github.com/yuru7/bizin-gothic/releases/download/v${version}/BizinGothicNF_v${version}.zip";
    hash = "sha256-k0pGSuH6Jq5BX/a4vp7zd9hdDrfJACAa2Jb1OqPXlWs=";
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 *.ttf -t $out/share/fonts/bizin-gothic-nf

    runHook postInstall
  '';

  meta = {
    description = "Bizin Gothic は、ユニバーサルデザインフォントの BIZ UDゴシック と英文フォント Inconsolata を合成したプログラミング向けフォントです";
    homepage = "https://github.com/yuru7/bizin-gothic";
    license = lib.licenses.ofl;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "bizin-gothic";
    platforms = lib.platforms.all;
  };
}
