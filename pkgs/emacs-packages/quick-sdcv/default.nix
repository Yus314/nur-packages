{
  lib,
  melpaBuild,
  fetchFromGitHub,
}:

melpaBuild rec {
  pname = "quick-sdcv";
  version = "1.0.4";

  src = fetchFromGitHub {
    owner = "jamescherti";
    repo = "quick-sdcv.el";
    rev = version;
    hash = "sha256-MQOgsIdNfO0m4+hTAH+UEGyUSfHpjyO/OeMAIcsKCOU=";
  };

  meta = {
    description = "Emacs offline dictionary using 'sdcv";
    homepage = "https://github.com/jamescherti/quick-sdcv.el";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "quick-sdcv-el";
    platforms = lib.platforms.all;
  };
}
