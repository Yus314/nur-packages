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
    inherit (epkgs)
      melpaBuild
      vterm
      eat
      websocket
      web-server
      flycheck
      ;
    source = sources.claude-code-ide;
  };
  lean4-mode = pkgs.callPackage ./lean4-mode {
    inherit (epkgs)
      melpaBuild
      dash
      lsp-mode
      magit
      ;
    source = sources.lean4-mode;
  };
  chrome-emacs = pkgs.callPackage ./chrome-emacs {
    inherit (epkgs)
      melpaBuild
      websocket
      ;
  };
}
