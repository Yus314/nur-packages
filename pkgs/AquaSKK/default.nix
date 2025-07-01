{
  lib,
  stdenv,
  source,
  fetchurl,
  cpio,
  undmg,
  xar,
  ...
}:
stdenv.mkDerivation rec {
  inherit (source) pname version src;

  unpackPhase = ''
    runHook preUnpack

    xar -xf $src
    pushd aquaskk-pkg.pkg
    gunzip -c Payload | cpio -i
    popd

    runHook postUnpack
  '';

  nativeBuildInputs = [
    cpio
    undmg
    xar
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -r aquaskk-pkg.pkg/Library $out

    runHook postInstall
  '';

  meta = {
    description = "An input method without morphological analysis";
    homepage = "https://github.com/codefirst/aquaskk";
    changelog = "https://github.com/codefirst/aquaskk/blob/main/ChangeLog";
    license = lib.licenses.gpl2Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "aquaskk";
    platforms = lib.platforms.all;
  };

}
