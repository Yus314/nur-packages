{
  lib,
  melpaBuild,
  source,
  dash,
  s,
}:

melpaBuild {
  inherit (source) pname src;
  version = "unstable-2024-09-17";

  meta = {
    description = "Org links for emacs-slack (https://github.com/yuya373/emacs-slack";
    homepage = "https://github.com/ag91/ol-emacs-slack";
    #license = lib.licenses.unfree; # FIXME: nix-init did not find a license
    maintainers = with lib.maintainers; [ ];
    mainProgram = "ol-emacs-slack";
    platforms = lib.platforms.all;
  };
  packageRequires = [
    dash
    s
  ];
  ignoreCompilationError = false;
}
