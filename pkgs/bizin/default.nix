{
  lib,
  stdenvNoCC,
  source,
}:

stdenvNoCC.mkDerivation rec {
  pname = "bizin-gothic-nf";
  inherit (source) version src;

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
