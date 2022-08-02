local home = os.getenv("HOME")

local _M ={
  -- Choice of default terminal emulator
  terminal = "kitty",

  -- Default modkey
  modkey = "Mod4",

  -- Define the wallpaper
  wallpaper = home .. "/.dotfiles/etc/wallpaper/topomap.jpg",

}

return _M;
