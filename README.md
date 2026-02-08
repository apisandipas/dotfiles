# .dotfiles

Personal dotfiles for Arch Linux, managed with [GNU Stow](https://www.gnu.org/software/stow/) for symlink management.

## Primary Stack

**Hyprland** (Wayland compositor) + **Waybar** + **Rofi** + **Alacritty** + **Tmux** + **Zsh**

The centerpiece is a **unified theme switcher** that applies a consistent colorscheme across the entire desktop in one command.

## Theme Switcher

```
themes/scripts/theme-switcher apply <ThemeName>
```

Applies a theme across all integrated apps simultaneously:

| App | Method |
|---|---|
| Alacritty | Base + colors TOML concatenation, live reload |
| Waybar | CSS swap, `SIGUSR2` reload |
| Rofi | `.rasi` swap |
| Swaync | CSS swap, client reload |
| Wallpaper | `swww` transition |
| Tmux | Conf swap, `source-file` reload |
| Neovim | Colorscheme file + `nvr` remote command |

A Rofi-based picker (`themes/scripts/rofi-themeswitcher`) provides a graphical menu. Current theme state is tracked in `themes/.current-theme`.

### Available Themes

Catppuccin Latte/Mocha, Dracula, Everforest/Everforest Light, Gruvbox/Gruvbox Light, Nord/Nord Light, Solarized Light, Tokyo Night/Tokyo Night Day

Each theme lives in `themes/themes/<Name>/` and contains: `alacritty-colors.toml`, `waybar.css`, `rofi.rasi`, `swaync.css`, `tmux.conf`, `nvim.txt`, and an optional `wallpaper.*`.

## Stow Packages

Each top-level directory is a stow package. The internal structure mirrors `$HOME`, so `hypr/.config/hypr/hyprland.conf` symlinks to `~/.config/hypr/hyprland.conf`.

Deploy a package: `stow <package>`

### Active (Hyprland Desktop)

| Package | Description |
|---|---|
| `hypr` | Hyprland config + helper scripts (volume, brightness, sleep, xdg-portal) |
| `waybar` | Status bar config and custom scripts (includes music player segment) |
| `rofi` | App launcher and theme picker |
| `zsh` | Shell config with custom plugin loader (`lib/utils.zsh`) and plugins (autosuggestions, syntax-highlighting) |
| `tmux` | Tmux config |
| `starship` | Starship prompt |
| `fastfetch` | System info display |
| `foot` | Foot terminal (Wayland-native) |

### Legacy / Other WMs

These configs are from previous setups and are not part of the current Hyprland desktop:

| Package | Description |
|---|---|
| `awesome` | AwesomeWM (X11) - modular Lua config |
| `bspwm` | bspwm (X11) |
| `sway` | Sway (Wayland) |
| `stumpwm` | StumpWM (X11, Common Lisp) |
| `sxhkd` | Hotkey daemon (used with bspwm) |
| `polybar` | Status bar (X11) |
| `picom` | Compositor (X11) |
| `feh` | Image viewer / wallpaper setter (X11) |
| `kitty` | Kitty terminal |
| `mbsync` | Email sync (isync/mbsync) |

### Non-Stow Directories

| Directory | Description |
|---|---|
| `themes/` | Theme switcher system (scripts + theme definitions) |
| `bin/` | Utility scripts (screenshots, lockscreen, etc.) |
| `etc/` | Static assets (wallpapers) |
