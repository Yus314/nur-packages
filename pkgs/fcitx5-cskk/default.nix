{
  stdenv,
  lib,
  cmake,
  extra-cmake-modules,
  pkg-config,
  gettext,
  fcitx5,
  fcitx5-qt,
  qtbase,
  wrapQtAppsHook,
  cskk,
  skkDictionaries,
  source,
  enableQt ? false,
  useQt6 ? false,
}:
stdenv.mkDerivation rec {
  pname = "fcitx5-cskk";
  inherit (source) version src;

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    pkg-config
    gettext
  ]
  ++ lib.optional enableQt wrapQtAppsHook;

  buildInputs = [
    fcitx5
    cskk
  ]
  ++ lib.optionals enableQt [
    fcitx5-qt
    qtbase
  ];

  cmakeFlags = [
    "-DENABLE_QT=${toString enableQt}"
    "-DUSE_QT6=${toString useQt6}"
    "-DSKK_DICT_DEFAULT_PATH=${skkDictionaries.l}/share/skk/SKK-JISYO.L"
  ];

  meta = with lib; {
    description = "SKK input method engine for Fcitx5 using libcskk";
    homepage = "https://github.com/fcitx/fcitx5-cskk";
    license = licenses.gpl3Plus;
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
