{
  lib,
  rustPlatform,
  source,
}:

rustPlatform.buildRustPackage rec {
  pname = "kakoune-scrollback";
  inherit (source) version src;

  useFetchVendor = true;
  cargoHash = "sha256-G9wtUCsEytcTF/9jlmDTxCLujc6n/s/xC4TF04OKT1w=";

  postInstall = ''
    install -Dm644 rc/kakoune-scrollback.kak \
      $out/share/kak/autoload/plugins/kakoune-scrollback/kakoune-scrollback.kak
  '';

  meta = with lib; {
    description = "Kitty terminal scrollback viewer for Kakoune";
    homepage = "https://github.com/Yus314/kakoune-scrollback";
    license = licenses.unlicense;
    mainProgram = "kakoune-scrollback";
    maintainers = [ ];
    platforms = platforms.unix;
  };
}
