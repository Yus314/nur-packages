{
  lib,
  melpaBuild,
  source,
  websocket,
}:

melpaBuild {
  inherit (source) pname src;
  version = "0.0.1";

  meta = {
    description = "Typst live preview minor mode for emacs";
    homepage = "https://github.com/havarddj/typst-preview.el";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "typst-preview";
    platforms = lib.platforms.all;
  };

  packageRequires = [
    websocket
  ];

  ignoreCompilationError = false;
}
