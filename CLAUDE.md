# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles for Bryan Paronto, managed with **GNU Stow** for symlink management. The system runs **Arch Linux** with **Hyprland** (Wayland compositor).

## Stow Convention

Each top-level directory is a stow package. Inside each package, the directory structure mirrors the target home directory. For example:

- `hypr/.config/hypr/hyprland.conf` stows to `~/.config/hypr/hyprland.conf`
- `git/.gitconfig` stows to `~/.gitconfig`
- `tmux/.tmux.conf` stows to `~/.tmux.conf`

To deploy a single package: `stow <package-name>` (e.g., `stow zsh`, `stow hypr`)

The `.stow-local-ignore` excludes `.git`, `.gitignore`, `bin/`, `config/`, and `etc/` from stow operations since those are repo-level resources, not stow packages.

## Key Directories

- **`hypr/`** - Hyprland compositor config (primary WM, Wayland). Includes helper scripts for volume/brightness control in `.config/hypr/scripts/`.
- **`awesome/`** - AwesomeWM config (X11, modular Lua). Structured as `rc.lua` entry point with submodules: `main/` (tags, layouts, rules, signals, user-variables), `binding/` (keys/buttons), `deco/` (statusbar, wallpaper, titlebar, taglist, tasklist).
- **`zsh/`** - Zsh config with custom plugin loader (`zsh_add_plugin` in `lib/utils.zsh`). Plugins are git-cloned into `lib/plugins/`.
- **`themes/`** - Unified theme switcher for Hyprland desktop. Manages consistent theming across Alacritty, Waybar, Rofi, Swaync, Tmux, Neovim, and wallpaper (via swww). Not stowed — referenced directly via `~/.dotfiles/themes/`.
- **`bin/`** - Standalone utility scripts (screenshots, lockscreen, polybar launcher, etc.). Not stowed — referenced directly via `~/.dotfiles/bin/` in PATH or from other configs.
- **`etc/`** - Static assets (wallpapers, stream placards). Not stowed.
- **`stumpwm/`** - StumpWM (Common Lisp WM) config with init.lisp entry point.

## AwesomeWM Lua Style

The awesome config at `awesome/.config/awesome/` has its own linting/formatting:
- **Linter**: luacheck (config in `.luacheckrc`) — Lua 5.1 standard, `awesome` as a read global
- **Formatter**: StyLua (config in `.stylelua.toml`) — 2-space indent, double quotes, 120 col width
- Globals like `client`, `screen`, and `awesome` are provided by the AwesomeWM runtime; diagnostic warnings about these being undefined are expected and can be ignored.

## Theme Switcher

`themes/scripts/theme-switcher apply <ThemeName>` applies a theme across all apps in order: Alacritty (base+colors concatenation, live reload), Waybar (CSS copy, SIGUSR2), Rofi (rasi copy), Swaync (CSS copy, client reload), Wallpaper (swww), Tmux (conf copy, source-file), Neovim (colorscheme file + nvr remote commands). State tracked in `themes/.current-theme`.

Each theme in `themes/themes/<Name>/` contains: `alacritty-colors.toml`, `waybar.css`, `rofi.rasi`, `swaync.css`, `tmux.conf`, `nvim.txt`, and optional `wallpaper.*`. Themes are auto-discovered by directory scan.

`themes/alacritty-base.toml` is the shared Alacritty config (font, window, keybindings). The generated `~/.config/alacritty/alacritty.toml` should not be edited directly. TOML requires `\u001b` not `\x1b` for ESC.

## Git Config

Commits are GPG-signed by default (`commit.gpgsign = true`). Pull uses rebase. Git LFS is configured.
