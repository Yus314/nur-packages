{
  lib,
  melpaBuild,
  source,
}:

melpaBuild {
  inherit (source) pname src;
  version = 0.0 .1;

  ignoreCompilationError = false;

  meta = {
    description = "Modern block styling with org-indent";
    homepage = "https://github.com/jdtsmith/org-modern-indent";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "org-modern-indent";
    platforms = lib.platforms.all;
  };
}
