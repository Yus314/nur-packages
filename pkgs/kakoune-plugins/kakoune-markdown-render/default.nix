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
    for f in rc/*.kak; do
      install -Dm644 "$f" \
        "$out/share/kak/autoload/plugins/kakoune-markdown-render/$(basename "$f")"
    done
  '';

  meta = with lib; {
    description = "Markdown renderer for Kakoune";
    homepage = "https://github.com/Yus314/kakoune-markdown-render";
    mainProgram = "mkdr";
    maintainers = [ ];
    platforms = platforms.unix;
  };
}
