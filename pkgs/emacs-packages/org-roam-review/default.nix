{
  lib,
  melpaBuild,
  source,
  dash,
  org-drill,
  org-roam,
  ts,
  ht,
}:

melpaBuild {
  inherit (source) src;
  pname = "org-roam-review";
  version = "0.0.1";

  meta = {
    description = "Programs and libs that I haven't gotten around to formally packaging";
    homepage = "https://github.com/chrisbarrett/nursery";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "org-roam-review";
    platforms = lib.platforms.all;
  };
  packageRequires = [
    dash
    org-drill
    org-roam
    ts
    ht
  ];
  files = ''("lisp/org-roam-review.el" "lisp/org-tags-filter.el" "lisp/plisty.el")'';
  ignoreCompilationError = false;
}
