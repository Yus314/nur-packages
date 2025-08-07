{
  lib,
  melpaBuild,
  source,
  vterm,
  eat,
  websocket,
  flycheck,
}:
melpaBuild {
  inherit (source) pname src;
  version = "0.1.0";

  packageRequires = [
    vterm
    websocket
    flycheck
  ];

  meta = {
    description = "IDE-like interface for Claude Code AI assistant in Emacs";
    homepage = "https://github.com/manzaltu/claude-code-ide.el";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ ];
    platforms = lib.platforms.all;
  };
}
