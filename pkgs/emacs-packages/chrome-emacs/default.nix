{
  lib,
  stdenv,
  fetchFromGitHub,
  melpaBuild,
  websocket,
}:

melpaBuild rec {
  pname = "atomic-chrome";
  version = "2.0.0";

  src = fetchFromGitHub {
    owner = "KarimAziev";
    repo = "atomic-chrome";
    rev = "v${version}";
    hash = "sha256-3/YLUa73r9BFa8HavNyzXULlwdPYyvg0HD6OgGu7/Ac=";
  };
  packageRequires = [
    websocket
  ];

  meta = {
    description = "Edit text area on Chrome with Emacs using Atomic Chrome";
    homepage = "https://github.com/KarimAziev/atomic-chrome";
    license = lib.licenses.unfree; # FIXME: nix-init did not find a license
    maintainers = with lib.maintainers; [ ];
    mainProgram = "atomic-chrome";
    platforms = lib.platforms.all;
  };
}
