{
  pkgs,
  epkgs,
  sources,
}:
{
  gcal = pkgs.callPackage ./gcal {
    inherit (epkgs) melpaBuild;
    source = sources.gcal;
  };
  org-modern-indent = pkgs.callPackage ./org-modern-indent {
    inherit (epkgs) melpaBuild;
    source = sources.org-modern-indent;
  };
  ol-emacs-slack = pkgs.callPackage ./ol-emacs-slack {
    inherit (epkgs)
      melpaBuild
      dash
      s
      ;
    source = sources.ol-emacs-slack;
  };
  org-roam-review = pkgs.callPackage ./org-roam-review {
    inherit (epkgs)
      melpaBuild
      dash
      org-drill
      org-roam
      ts
      ht
      ;
    source = sources.org-roam-review;
  };
  typst-preview = pkgs.callPackage ./typst-preview {
    inherit (epkgs) melpaBuild websocket;
    source = sources.typst-preview;
  };
  claude-code-ide = pkgs.callPackage ./claude-code-ide {
    inherit (epkgs) melpaBuild vterm websocket;
    source = sources.claude-code-ide;
  };
}
