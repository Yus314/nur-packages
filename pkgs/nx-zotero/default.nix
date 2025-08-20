{
  lib,
  stdenvNoCC,
  source,
}:

stdenvNoCC.mkDerivation rec {
  pname = "nx-zotero";
  inherit (source) version src;

  dontBuild = true;

  postPatch = ''
    substituteInPlace nx-zotero.lisp \
      --replace '(flexi-streams:octets-to-string body)' \
                '(flexi-streams:octets-to-string (if (stringp body) (flexi-streams:string-to-octets body :external-format :utf-8) body) :external-format :utf-8)' \
      --replace "'translator-+id+" "'translatorID"
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -r * $out/

    runHook postInstall
  '';

  meta = with lib; {
    description = "Zotero integration for Nyxt browser";
    homepage = "https://github.com/rolling-robot/nx-zotero";
    license = licenses.asl20;
    platforms = platforms.all;
    maintainers = [ ];
  };
}