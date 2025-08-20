{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  source ? _sources.nx-zotero or null,
  _sources ? import ../../_sources/generated.nix { inherit fetchFromGitHub; },
}:

stdenvNoCC.mkDerivation rec {
  pname = "nx-zotero";
  version = if source != null then source.version else "0.1";
  
  src = if source != null then source.src else fetchFromGitHub {
    owner = "rolling-robot";
    repo = "nx-zotero";
    rev = "4a6b0ff72ae829b1789c1e21ce6c072b8af22da2";
    sha256 = "sha256-YvCJcvy7rmXOJ5eLgHE9DtvugwYrYKpjIoXl57TMXk4=";
  };

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