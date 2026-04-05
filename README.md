# Antigravity-nix Builder

This repository wraps the upstream [antigravity-nix](https://github.com/jacopone/antigravity-nix) flake and builds it with a specific pinned nixpkgs version.

## How it works

- The upstream `antigravity-nix` repository is tracked as a git submodule at `./antigravity-nix/`
- The wrapper flake (`flake.nix`) imports the upstream antigravity-nix overlay but uses a **pinned nixpkgs** version
- This ensures reproducible builds that match your local environment
- GitHub Actions builds the package automatically on push/PR/trigger

## Building locally

```bash
# Build the package
nix build .#default

# Run flake check
nix flake check

# Enter development shell
nix develop
```

## Updating

To use a newer version of the upstream antigravity-nix:

```bash
# Update submodule to latest upstream
git submodule update --remote antigravity-nix

# Update flake inputs (to get new antigravity-nix commit)
nix flake update

# Commit changes
git add antigravity-nix flake.lock
git commit -m "Update antigravity-nix to latest"
```

To change the pinned nixpkgs version, edit `flake.nix` and update the `nixpkgs.url` to the desired revision, then run `nix flake update`.

## GitHub CI

The package is built automatically by GitHub Actions. You can manually trigger a build from the Actions tab in GitHub.

The CI builds all three package variants:
- `default` / `google-antigravity` (with FHS environment)
- `google-antigravity-no-fhs` (without FHS environment)