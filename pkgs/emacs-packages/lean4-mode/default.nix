{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation rec {
  pname = "lean4-mode";
  version = "1.1.2";

  src = fetchFromGitHub {
    owner = "leanprover-community";
    repo = "lean4-mode";
    rev = version;
    hash = "sha256-DLgdxd0m3SmJ9heJ/pe5k8bZCfvWdaKAF0BDYEkwlMQ=";
  };

  meta = {
    description = "Emacs major mode for Lean 4";
    homepage = "https://github.com/leanprover-community/lean4-mode";
    changelog = "https://github.com/leanprover-community/lean4-mode/blob/${src.rev}/CHANGELOG.org";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "lean4-mode";
    platforms = lib.platforms.all;
  };
}
