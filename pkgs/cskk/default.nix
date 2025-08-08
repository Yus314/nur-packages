{
  fetchFromGitHub,
  rustPlatform,
  cargo-c,
  rust-bindgen,
  libxkbcommon,
  lib,
  source ? _sources.cskk or null,
  _sources ? import ../../_sources/generated.nix { inherit fetchFromGitHub; },
}:
rustPlatform.buildRustPackage rec {
  pname = "cskk";
  version = if source != null then source.version else "3.2.0";
  
  src = if source != null then source.src else fetchFromGitHub {
    owner = "naokiri";
    repo = "cskk";
    rev = "v3.2.0";
    hash = "sha256-lhLNtSmD5XiG0U6TLWgN+YA/f7UJ/RyHoe5vq5OopuI=";
  };

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