{
  lib,
  stdenv,
  source,
  swift,
  darwin,
}:

stdenv.mkDerivation {
  pname = "kakoune-autothemes";
  inherit (source) version src;

  nativeBuildInputs = lib.optionals stdenv.isDarwin [
    swift
  ];

  buildInputs = lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.AppKit
  ];

  buildPhase =
    if stdenv.isDarwin then ''
      swiftc -O -o dark-mode-watcher src/dark-mode-watcher.swift
    '' else ''
      :
    '';

  installPhase = ''
    plugin_dir="$out/share/kak/autoload/plugins/autothemes"
    mkdir -p "$plugin_dir/rc"
    cp rc/autothemes.kak "$plugin_dir/rc/"
  '' + lib.optionalString stdenv.isDarwin ''
    mkdir -p "$plugin_dir/bin"
    cp dark-mode-watcher "$plugin_dir/bin/"
  '';

  meta = {
    description = "Auto-switch Kakoune colorscheme based on OS dark/light mode";
    homepage = "https://github.com/Yus314/kakoune-autothemes";
    license = lib.licenses.mit;
    maintainers = [ ];
    platforms = lib.platforms.unix;
  };
}
