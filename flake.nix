{
  description = "Antigravity-nix wrapper with pinned nixpkgs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/2fc6539b481e1d2569f25f8799236694180c0993";
    flake-utils.url = "github:numtide/flake-utils";
    antigravity-nix.url = "github:jacopone/antigravity-nix";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      antigravity-nix,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [
            antigravity-nix.overlays.default
          ];
        };
      in
      {
        packages = {
          default = pkgs.google-antigravity;
          google-antigravity = pkgs.google-antigravity;
          google-antigravity-no-fhs = pkgs.google-antigravity-no-fhs;
        };

        # Development shell for working on this flake
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            nix
            git
            curl
            jq
            gh
            nodejs_20
          ];

          shellHook = ''
            echo "Antigravity development environment with pinned nixpkgs"
            echo "Available commands:"
            echo "  nix build .#default - Build antigravity package"
            echo "  nix flake check - Check flake"
            echo ""
            echo "Note: This flake wraps upstream antigravity-nix with a pinned nixpkgs version"
          '';
        };
      }
    );
}
