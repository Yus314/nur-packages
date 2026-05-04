{
  lib,
  rustPlatform,
  source,
}:

rustPlatform.buildRustPackage {
  pname = "sprout";
  inherit (source) version src;

  useFetchVendor = true;
  cargoHash = "sha256-6bAxrqtKiaCfY6jRVDxBr1T3mKt6x0DiymXS21f2C5w=";

  meta = with lib; {
    description = "Evergreen note cultivation CLI with spaced repetition";
    homepage = "https://github.com/Yus314/sprout";
    license = licenses.mit;
    mainProgram = "sprout";
    maintainers = [ ];
    platforms = platforms.unix;
  };
}
