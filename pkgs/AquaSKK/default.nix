{
  lib,
  stdenv,
  fetchurl,
  cpio,
  undmg,
  xar,
  ...
}:
stdenv.mkDerivation rec {
  pname = "aquaskk";
  version = "4.7.3"; # ビルドするAquaSKKのバージョン

  # ソースコードをGitHubから取得します
  src = fetchurl {
    url = "https://github.com/codefirst/aquaskk/releases/download/4.7.6/AquaSKK-4.7.6.pkg";
    sha256 = "sha256-8bDzAYOXS6zwG4uC5j+Ne2kW/SEwpEfO0dUSnJQjFmg=";
  };

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
    changelog = "https://github.com/codefirst/aquaskk/blob/${src.rev}/ChangeLog";
    license = lib.licenses.gpl2Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "aquaskk";
    platforms = lib.platforms.all;
  };

}
