{
  lib,
  stdenv,
  rustPlatform,
  pkg-config,
  gtk3,
  glib,
  dbus,
  libdbusmenu-gtk3,
  wayland,
  source,
}:

rustPlatform.buildRustPackage rec {
  pname = "niri-taskbar";
  inherit (source) version src;

  useFetchVendor = true;
  cargoHash = "sha256-AqlYhJjcxHle4APGKzjU60oJFdzZnSjX4KQ9t/xX9xA=";

  nativeBuildInputs = [
    pkg-config
    rustPlatform.bindgenHook
  ];

  buildInputs = [
    gtk3
    glib
    dbus
    libdbusmenu-gtk3
    wayland
  ];

  # Waybar CFFI module build - install shared library
  postInstall = ''
    # Install the .so file to $out/lib for Waybar to load
    # The cdylib creates lib<name>.so in the target directory
    install -Dm644 "target/${stdenv.hostPlatform.rust.rustcTargetSpec}/release/libniri_taskbar.so" -t "$out/lib"
  '';

  meta = with lib; {
    description = "Niri taskbar module for Waybar";
    homepage = "https://github.com/LawnGnome/niri-taskbar";
    license = licenses.mit;
    maintainers = [ ];
    platforms = platforms.linux;
  };
}