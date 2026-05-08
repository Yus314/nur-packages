{
  lib,
  rustPlatform,
  source,
}:

rustPlatform.buildRustPackage {
  pname = "sprout";
  inherit (source) version src;

  useFetchVendor = true;
  cargoHash = "sha256-nFudrLbOfG75dEh+dP/ovGD71Su2sQ/RBQ3uyUghDhA=";

  meta = with lib; {
    description = "Evergreen note cultivation CLI with spaced repetition";
    homepage = "https://github.com/Yus314/sprout";
    license = licenses.mit;
    mainProgram = "sprout";
    maintainers = [ ];
    platforms = platforms.unix;
  };
}
