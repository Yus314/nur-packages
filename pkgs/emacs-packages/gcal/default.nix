{
  lib,
  melpaBuild,
  source,
}:

melpaBuild {
  inherit (source) pname src;
  version = "unstable-2024-06-19";

  meta = {
    description = "Google Calendar Utilities for Emacs";
    homepage = "https://github.com/misohena/gcal";
    license = lib.licenses.gpl3Only; # FIXME: nix-init did not find a license
    maintainers = with lib.maintainers; [ ];
    mainProgram = "gcal";
    platforms = lib.platforms.all;
  };
}
