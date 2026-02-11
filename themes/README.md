# Theme Switcher

Unified theme management for a Hyprland desktop. One command applies a consistent color scheme across Alacritty, Waybar, Rofi, SwayNC, Tmux, Neovim, and wallpaper.

## Usage

```bash
# Apply a theme
~/.dotfiles/themes/scripts/theme-switcher apply Nord

# List available themes (* = active)
~/.dotfiles/themes/scripts/theme-switcher list

# Show current theme
~/.dotfiles/themes/scripts/theme-switcher current

# Restore wallpaper (e.g. after swww crash)
~/.dotfiles/themes/scripts/theme-switcher restore-wallpaper

# Interactive picker via Rofi
~/.dotfiles/themes/scripts/rofi-themeswitcher
```

## Available Themes

| Dark              | Light             |
| ----------------- | ----------------- |
| CatppuccinMocha   | CatppuccinLatte   |
| Dracula           | EverforestLight   |
| Everforest        | GruvboxLight      |
| Gruvbox           | NordLight         |
| Nord              | SolarizedLight    |
| Original          | TokyoNightDay     |
| TokyoNight        |                   |

## How It Works

`theme-switcher apply <Name>` updates each application in order:

1. **Alacritty** — Concatenates `alacritty-base.toml` + theme's `alacritty-colors.toml` into `~/.config/alacritty/alacritty.toml`. Alacritty live-reloads on file change. Atomic write (temp file + `mv`) prevents partial reads.
2. **Waybar** — Copies `waybar.css` to `~/.config/waybar/style.css`, sends `SIGUSR2` to reload.
3. **Rofi** — Copies `rofi.rasi` to `~/.config/rofi/colors.rasi`.
4. **SwayNC** — Copies `swaync.css` to `~/.config/swaync/style.css`, reloads via `swaync-client -rs`.
5. **Wallpaper** — Sets wallpaper via `swww img` with a wipe transition. Auto-starts the swww daemon if needed.
6. **Tmux** — Copies `tmux.conf` to `~/.config/tmux/theme.conf`, sources it in running sessions.
7. **Neovim** — Writes colorscheme to `~/.config/nvim/theme-colors.lua`, pushes commands to all running instances via `nvr`.

Each step fails gracefully if the target application isn't installed or running. Current theme is tracked in `.current-theme`.

## Directory Structure

```
themes/
├── alacritty-base.toml           # Shared Alacritty config (font, window, keybindings)
├── .current-theme                # Active theme name
├── scripts/
│   ├── theme-switcher            # Main CLI script
│   └── rofi-themeswitcher        # Rofi GUI picker
└── themes/
    └── <ThemeName>/
        ├── alacritty-colors.toml # Terminal colors (TOML)
        ├── waybar.css            # Status bar styles
        ├── rofi.rasi             # Launcher color variables
        ├── swaync.css            # Notification center styles
        ├── tmux.conf             # Tmux status bar theme
        ├── nvim.txt              # Neovim colorscheme name
        └── wallpaper.*           # Desktop wallpaper (png/jpg/webp)
```

## Adding a Theme

1. Create `themes/themes/<YourThemeName>/`.
2. Add all 7 files listed above. Easiest to copy an existing theme and modify colors.
3. The new theme is auto-discovered — no registration needed.

For Neovim colorschemes that need special setup (background, Lua config, plugin options), add a case to the `apply_neovim` function in `theme-switcher`.
