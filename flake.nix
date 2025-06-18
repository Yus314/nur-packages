{
  description = "My personal NUR repository";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs =
    { self, nixpkgs }:
    let
      forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
    in
    {
      legacyPackages = forAllSystems (
        system:
        import ./default.nix {
          pkgs = import nixpkgs { inherit system; };
        }
      );
      overlays.default = import ./overlay.nix;

      devShells = forAllSystems (system: {
        default =
          let
            pkgs = import nixpkgs { inherit system; };
            update-readme = pkgs.writeShellApplication {
              name = "update-readme";
              runtimeInputs = [ pkgs.emacs ];
              text = ''
                emacs -l ob -l ob-shell --batch --eval "
                  (progn
                    (let ((org-confirm-babel-evaluate nil))
                    (dolist (file command-line-args-left)
                      (with-current-buffer (find-file-noselect file)
                        (org-babel-execute-buffer)
                        (save-buffer)))))
                  " README.org
              '';
            };
          in
          pkgs.mkShellNoCC {
            packages = [
              pkgs.nvfetcher
              update-readme
            ];
          };
      });
      packages = forAllSystems (
        system: nixpkgs.lib.filterAttrs (_: v: nixpkgs.lib.isDerivation v) self.legacyPackages.${system}
      );
    };
}
