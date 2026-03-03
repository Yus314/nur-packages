{
  lib,
  rustPlatform,
  source,
}:

rustPlatform.buildRustPackage rec {
  pname = "kakoune-markdown-render";
  inherit (source) version src;

  useFetchVendor = true;
  cargoHash = "sha256-hq1qrwX+V0FqCwEIPjq2NdhiMf6x5ETdRlXriZuU8jg=";

  postInstall = ''
    install -Dm644 rc/markdown-render.kak \
      $out/share/kak/autoload/plugins/kakoune-markdown-render/markdown-render.kak
  '';

  meta = with lib; {
    description = "Markdown renderer for Kakoune";
    homepage = "https://github.com/Yus314/kakoune-markdown-render";
    mainProgram = "mkdr";
    maintainers = [ ];
    platforms = platforms.unix;
  };
}
