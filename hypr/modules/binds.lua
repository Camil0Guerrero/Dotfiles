---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal      = "kitty"
local tmux          = "kitty -e tmux -u -f ~/.config/tmux/tmux.conf new-session -A -s main"
local browser       = "brave"
local fileManager   = "nemo"
local menu          = "tofi-drun --drun-launch=true"
local capture       = "hyprshot -m region --clipboard-only"
local volume        = "~/.config/scripts/volume.sh"
local notifications = "swaync-client -t"

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod       = "SUPER" -- Sets "Windows" key as main modifier

-- Generals
hl.bind(mainMod .. " + code:36", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + t", hl.dsp.exec_cmd(tmux))
hl.bind(mainMod .. " + code:34", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + w", hl.dsp.window.close())
-- hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + d", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + n", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + t", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "down" }))

-- Utilities
hl.bind("print", hl.dsp.exec_cmd(capture))
hl.bind(mainMod .. " + l", hl.dsp.exec_cmd("hyprlock"))

-- Volume
hl.bind("CONTROL + ALT + up", hl.dsp.exec_cmd(volume .. " raise"))
hl.bind("CONTROL + ALT + down", hl.dsp.exec_cmd(volume .. " lower"))
hl.bind("CONTROL + ALT + m", hl.dsp.exec_cmd(volume .. " mute"))

-- Audio
hl.bind("CONTROL + SHIFT + code:51", hl.dsp.exec_cmd("playerctl next"))
hl.bind("CONTROL + SHIFT + code:35", hl.dsp.exec_cmd("playerctl previous"))

-- Notifications
hl.bind(mainMod .. " + m", hl.dsp.exec_cmd(notifications))

-- Switch workspaces
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + CONTROL + Tab", hl.dsp.window.move({ workspace = 1 }))

hl.bind(mainMod .. " + code:24", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + CONTROL + code:24", hl.dsp.window.move({ workspace = 2 }))

hl.bind(mainMod .. " + code:25", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + CONTROL + code:25", hl.dsp.window.move({ workspace = 3 }))


-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("space1"))
hl.bind(mainMod .. " + CONTROL + S", hl.dsp.window.move({ workspace = "special:space1" }))
hl.bind(mainMod .. " + C", hl.dsp.workspace.toggle_special("space2"))
hl.bind(mainMod .. " + CONTROL + C", hl.dsp.window.move({ workspace = "special:space2" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
