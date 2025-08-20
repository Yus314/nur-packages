{
  lib,
  stdenvNoCC,
  source,
}:

stdenvNoCC.mkDerivation rec {
  pname = "nx-rbw";
  inherit (source) version src;

  patches = [ ./fix-folder-handling.patch ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -r * $out/

    runHook postInstall
  '';

  meta = with lib; {
    description = "RBW (Rust BitWarden) integration for Nyxt browser";
    homepage = "https://codeberg.org/ablatedsprocket/nx-rbw";
    license = licenses.gpl3Plus;
    platforms = platforms.all;
    maintainers = [ ];
  };
}