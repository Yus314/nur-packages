{
  lib,
  melpaBuild,
  source,
}:

melpaBuild {
  inherit (source) pname src;
  version = "0.0.1";

  meta = {
    description = "Google Calendar Utilities for Emacs";
    homepage = "https://github.com/misohena/gcal";
    license = lib.licenses.gpl3Only; # FIXME: nix-init did not find a license
    maintainers = with lib.maintainers; [ ];
    mainProgram = "gcal";
    platforms = lib.platforms.all;
  };
}
