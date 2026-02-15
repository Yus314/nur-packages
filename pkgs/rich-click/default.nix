{
  lib,
  python3Packages,
  source,
}:

python3Packages.buildPythonPackage rec {
  pname = "rich-click";
  inherit (source) version src;

  format = "pyproject";

  nativeBuildInputs = with python3Packages; [
    setuptools
  ];

  propagatedBuildInputs = with python3Packages; [
    click
    rich
    typing-extensions
  ];

  pythonImportsCheck = [
    "rich_click"
  ];

  meta = with lib; {
    description = "Format click help output nicely with rich";
    homepage = "https://github.com/ewels/rich-click";
    license = licenses.mit;
    mainProgram = "rich-click";
    platforms = platforms.all;
  };
}
