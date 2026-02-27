{
  lib,
  rustPlatform,
  source,
}:

rustPlatform.buildRustPackage {
  pname = "sprout";
  inherit (source) version src;

  useFetchVendor = true;
  cargoHash = "sha256-HhoZRAr70UTFC6ZT0iHdtisMs0bx4P037w3KGlL5Yqg=";

  meta = with lib; {
    description = "Evergreen note cultivation CLI with spaced repetition";
    homepage = "https://github.com/Yus314/sprout";
    license = licenses.mit;
    mainProgram = "sprout";
    maintainers = [ ];
    platforms = platforms.unix;
  };
}
