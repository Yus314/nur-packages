{
  lib,
  melpaBuild,
  fetchFromSourcehut,
}:

melpaBuild {
  pname = "darkman";
  version = "0.0.1";

  src = fetchFromSourcehut {
    owner = "~grtcdr";
    repo = "darkman.el";
    rev = "0.0.1";
    hash = "sha256-b+sr1Z5LPZQp7UpK0x70jqXMh5i1PJ4OFOtWC7bLgVc=";
  };

  meta = {
    description = "";
    homepage = "https://git.sr.ht/~grtcdr/darkman.el";
    license = lib.licenses.isc;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "darkman-el";
    platforms = lib.platforms.all;
  };
}
