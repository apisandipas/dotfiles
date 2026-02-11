# StumpWM Configuration

X11 tiling window manager written in Common Lisp. This config prioritizes Emacs integration, keyboard-driven workflow, and live hackability via a Slynk REPL.

## File Structure

| File | Purpose |
|---|---|
| `init.lisp` | Main entry point: theme, keybindings, workspaces, startup apps, Slynk server, Emacs integration |
| `mode-line.lisp` | Extended mode-line with memory/battery indicators, system tray |
| `slynk.lisp` | Standalone Slynk server module (also inlined in init.lisp) |
| `utilities.lisp` | Helper macros and functions: `unix-cat`, memory usage, `run-raise-pull-list`, DuckDuckGo search |
| `misc/picom.conf` | Picom compositor config (rounded corners, fading, transparency, Kawase blur) |
| `misc/polybar.ini` | Polybar config (unused, replaced by built-in mode-line) |

## Workspaces

10 named groups, selectable by `Super+<number>`:

| Key | Group |
|---|---|
| `Super+1` | dev |
| `Super+2` | term |
| `Super+3` | chat |
| `Super+4` | mail |
| `Super+5` | data |
| `Super+6` | web |
| `Super+7` | vcs |
| `Super+8` | music |
| `Super+9` | files |
| `Super+0` | video |

Move the current window to a group with `Ctrl+Super+<number>`.

## Keybindings

Prefix key: **`Ctrl+z`**

### Global (no prefix)

| Key | Action |
|---|---|
| `Super+h/j/k/l` | Move focus (Emacs windmove-aware) |
| `Super+Ctrl+h/j/k/l` | Move window in direction |
| `Super+Up/Down` | Cycle groups next/prev |
| `Super+Right/Left` | Pull hidden next/prev window |
| `Super+SPC` | Emacs app launcher (`emacs-run-launcher`) |
| `Super+1-0` | Select workspace |
| `Ctrl+Super+1-0` | Send window to workspace |
| `Super+u` | Toggle window gaps |
| `Super+r` | Hard restart StumpWM |
| `Super+s` | Toggle Slynk server |
| `Print` | Screenshot (scrot) |

### Prefix Map (`Ctrl+z` then...)

| Key | Action |
|---|---|
| `Return` / `c` / `Ctrl+c` | Open kitty terminal |
| `b` | Firefox (run-or-raise) |
| `\` | Horizontal split + focus new frame |
| `-` | Vertical split + focus new frame |
| `.` / `,` | Next/prev group |
| `Super+Right/Left` | Move to next/prev group, taking window |
| `B` | Toggle mode-line |
| `Ctrl+z` | Abort (cancel prefix) |
| `?` | Help |

## Features

### Emacs Integration
- Starts `emacs --daemon` on launch.
- `better-move-focus` treats Emacs splits as tiling frames -- `Super+h/j/k/l` navigates seamlessly between Emacs windows and X windows using `windmove`.
- Helper functions `exec-el`, `eval-el`, `eval-string-as-el` for calling Emacs Lisp from StumpWM.

### Slynk REPL
- Slynk server on port **4007**, auto-started at init.
- Toggle with `Super+s`. Connect from Emacs with `M-x sly-connect`.
- Status shown in the mode-line.

### Theme
Tokyo Night-inspired palette applied to borders, mode-line, and messages:

| Color | Hex | Role |
|---|---|---|
| Black | `#272A39` | Background |
| Red | `#F7768E` | |
| Green | `#9ECE6A` | |
| Yellow | `#E0AF68` | Message foreground |
| Blue | `#7AA2F7` | |
| Magenta | `#9A7ECC` | |
| Cyan | `#4ABAAF` | |
| White | `#FFFFFF` | Mode-line foreground, borders |

### Window Gaps
`swm-gaps` module with 32px inner and outer gaps. Toggle with `Super+u`.

### Compositor (Picom)
Runs picom in the background with GLX backend:
- 4px rounded corners
- Kawase blur (strength 3)
- Fading on open/close
- Active window opacity 85%, inactive 90% with 40% dim
- Per-app opacity rules (kitty 80%, Firefox 100%, etc.)

### Mode-line
Displays: group name, window list, Slynk status, date/time. Extended mode-line (`mode-line.lisp`) adds color-coded memory and battery indicators plus a system tray via `stumptray`.

### Utilities (`utilities.lisp`)
- `run-raise-pull-list` -- menu-driven window switcher/launcher with property matching.
- `duckduckgo` command -- search from StumpWM prompt.
- `get-memory-usage-percent` -- reads `/proc/meminfo` for mode-line display.

### Display
- Font: Iosevka Nerd Font Bold 18pt (TrueType via `clx-truetype` + `ttf-fonts`)
- Resolution forced to 1920x1080 on `eDP-1`
- Wallpaper set via `feh` (`~/.dotfiles/etc/wallpaper/topomap.jpg`)
- Click-to-focus mouse policy
- Key sequence display hook (shows in-progress key chords)
