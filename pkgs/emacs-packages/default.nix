{
  pkgs,
  epkgs,
  sources,
}:
{
  gcal = epkgs.callPackage ./gcal {
    source = sources.gcal;
  };
  org-modern-indent = epkgs.callPackage ./org-modern-indent {
    source = sources.org-modern-indent;
  };
  ol-emacs-slack = epkgs.callPackage ./ol-emacs-slack {
    source = sources.ol-emacs-slack;
  };
  org-roam-review = epkgs.callPackage ./org-roam-review {
    source = sources.org-roam-review;
  };
  typst-preview = epkgs.callPackage ./typst-preview {
    source = sources.typst-preview;
  };
  claude-code-ide = epkgs.callPackage ./claude-code-ide {
    source = sources.claude-code-ide;
  };
}
