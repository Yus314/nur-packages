{
  rustPlatform,
  cargo-c,
  rust-bindgen,
  libxkbcommon,
  lib,
  source,
}:
rustPlatform.buildRustPackage rec {
  pname = "cskk";
  inherit (source) version src;

  useFetchVendor = true;
  cargoHash = "sha256-XWPeqQ3dC73Hp+TTPdLJtvF0hQ+uI82xfY7DxAXO1gA=";

  buildInputs = [
    libxkbcommon.dev
  ];
  nativeBuildInputs = [
    cargo-c
    rust-bindgen
  ];

  postInstall = ''
    cargo cinstall --prefix=$out
  '';

  meta = with lib; {
    description = "C library version of libskk (SKK Japanese input method)";
    homepage = "https://github.com/naokiri/cskk";
    license = licenses.gpl3Plus;
    maintainers = [ ];
    platforms = platforms.unix;
  };
}