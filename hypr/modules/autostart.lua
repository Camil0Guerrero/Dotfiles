-------------------
---- AUTOSTART ----
-------------------

-- local $randomWallpaper = ~/.config/scripts/random-wallpaper.sh

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function ()
  hl.exec_cmd("awww-daemon --format xrgb")
  hl.exec_cmd("swaync")
  hl.exec_cmd("hypridle")
  -- hl.exec_cmd($randomWallpaper)
end)
