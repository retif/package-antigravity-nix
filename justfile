default:
	@just --list

# Run antigravity from oleks.cachix.org
run:
	nix run \
		--extra-substituters "https://oleks.cachix.org" \
		--extra-trusted-public-keys "oleks.cachix.org-1:3+0qscV0/EFo5wE5dK24zKWeQk2zgwk12GtbYLD+JHI=" \
		github:retif/antigravity-nix

# Build antigravity from cache
build:
	nix build \
		--extra-substituters "https://oleks.cachix.org" \
		--extra-trusted-public-keys "oleks.cachix.org-1:3+0qscV0/EFo5wE5dK24zKWeQk2zgwk12GtbYLD+JHI=" \
		github:retif/antigravity-nix

# Build without FHS environment
build-no-fhs:
	nix build \
		--extra-substituters "https://oleks.cachix.org" \
		--extra-trusted-public-keys "oleks.cachix.org-1:3+0qscV0/EFo5wE5dK24zKWeQk2zgwk12GtbYLD+JHI=" \
		github:retif/antigravity-nix#google-antigravity-no-fhs

# Update flake inputs
update:
	nix flake update github:retif/antigravity-nix

# Check flake
check:
	nix flake checkgithub:retif/antigravity-nix

# Show flake metadata
info:
	nix flake metadata github:retif/antigravity-nix