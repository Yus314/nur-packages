{
  lib,
  python3Packages,
  rustPlatform,
  source,
}:

python3Packages.buildPythonPackage rec {
  pname = "pyxirr";
  inherit (source) version src;

  format = "pyproject";

  nativeBuildInputs = [
    rustPlatform.cargoSetupHook
    rustPlatform.maturinBuildHook
  ];

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit src;
    hash = "sha256-YCpCkq00q9LXiihn+73Q4QlGbPGmMdTurwuABiFkj6Q=";
  };

  pythonImportsCheck = [
    "pyxirr"
  ];

  meta = with lib; {
    description = "Financial functions for internal rate of return (XIRR)";
    homepage = "https://github.com/Anexen/pyxirr";
    license = licenses.unlicense;
    platforms = platforms.all;
  };
}
