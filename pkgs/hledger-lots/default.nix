{
  lib,
  python3Packages,
  pyxirr,
  rich-click,
  source,
}:

python3Packages.buildPythonPackage rec {
  pname = "hledger-lots";
  inherit (source) version src;

  format = "pyproject";

  nativeBuildInputs = with python3Packages; [
    setuptools
    wheel
  ];

  propagatedBuildInputs = with python3Packages; [
    click
    tabulate
    yfinance
    requests
    requests-cache
    questionary
  ] ++ [
    pyxirr
    rich-click
  ];

  pythonImportsCheck = [
    "hledger_lots"
  ];

  meta = with lib; {
    description = "Automatic lots using FIFO or average cost for hledger commodity transactions";
    homepage = "https://github.com/edkedk99/hledger-lots";
    license = licenses.mit;
    mainProgram = "hledger-lots";
    platforms = platforms.all;
  };
}
