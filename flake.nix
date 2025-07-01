{
  description = "My personal NUR repository";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs =
    {
      self,
      nixpkgs,
    }:
    let
      systems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
        "aarch64-linux"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = builtins.attrValues (import ./overlays);
            config.allowUnfree = true;
          };
          allPkgs = import ./default.nix { inherit pkgs; };
          isReserved = n: n == "lib" || n == "overlays" || n == "modules";
        in
        builtins.removeAttrs allPkgs (builtins.filter isReserved (builtins.attrNames allPkgs))
      );
      overlays.default = final: prev: import ./overlay.nix final prev;

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
    };
}
