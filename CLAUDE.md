# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal NUR (Nix User Repository) containing custom Nix packages and overlays. It provides packages for:
- AquaSKK (Japanese input method)
- Bizin Gothic Nerd Font
- Custom Emacs packages (gcal, org-modern-indent, ol-emacs-slack, org-roam-review, typst-preview)
- Browser overlays (qutebrowser, vivaldi for macOS)

## Development Commands

### Source Management
- `nvfetcher` - Update package sources and generate `_sources/generated.nix`
- `nix develop` - Enter development shell with nvfetcher and update-readme tools

### Building and Testing
- `nix build .#<package-name>` - Build a specific package (e.g., `nix build .#aquaskk`)
- `nix build .#packages.<system>.<package-name>` - Build for specific system
- `nix flake check` - Check flake validity and build all packages
- `nix eval --raw .#packages.aarch64-darwin` - List available packages for macOS ARM64

### Documentation
- `update-readme` - Regenerate README.org package tables using Org-mode babel execution

## Architecture

### Core Structure
- `default.nix` - Main package set definition, imports overlays and defines all packages
- `flake.nix` - Flake interface, supports multiple systems (x86_64/aarch64 for linux/darwin)
- `ci.nix` - CI configuration, filters buildable/cacheable packages based on licensing

### Package Organization
- `pkgs/` - Individual package definitions, each in its own subdirectory
- `pkgs/emacs-packages/` - Emacs packages using melpaBuild
- `overlays/` - Nixpkgs overlays for existing packages (qutebrowser, vivaldi)
- `_sources/` - Auto-generated source definitions from nvfetcher

### Source Management with nvfetcher
- `nvfetcher.toml` - Configuration for automatic source fetching
- Sources are fetched from GitHub releases, tags, or direct URLs
- Supports GitHub, direct URL downloads, and Arch package sources
- `_sources/generated.nix` is auto-generated, do not edit manually

### Package Patterns
- Standard packages use `pkgs.callPackage ./path { source = sources.name; }`
- Emacs packages use `melpaBuild` and pass dependencies via `inherit (epkgs)`
- macOS packages often require special unpack phases (xar, cpio for .pkg files)
- All packages include proper meta attributes (description, homepage, license, platforms)