{
  lib,
  rustPlatform,
  source,
}:

rustPlatform.buildRustPackage {
  pname = "sprout";
  inherit (source) version src;

  useFetchVendor = true;
  cargoHash = "sha256-4YcG4PDcjw2AZz0drNQzci6h6PI6Uk0xd4D1RS2PaUw=";

  meta = with lib; {
    description = "Evergreen note cultivation CLI with spaced repetition";
    homepage = "https://github.com/Yus314/sprout";
    license = licenses.mit;
    mainProgram = "sprout";
    maintainers = [ ];
    platforms = platforms.unix;
  };
}
