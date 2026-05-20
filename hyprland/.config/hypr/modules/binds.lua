                                                   
--   ▄▄▄▄   ▄▄▄                                       
--  █▀ ██  ██               █▄                █▄      
--     ██ ██                ██    ▀▀ ▄        ██      
--     █████    ▄█▀█▄ ██ ██ ████▄ ██ ████▄ ▄████ ▄██▀█
--     ██ ██▄   ██▄█▀ ██▄██ ██ ██ ██ ██ ██ ██ ██ ▀███▄
--   ▀██▀  ▀██▄▄▀█▄▄▄▄▄▀██▀▄████▀▄██▄██ ▀█▄█▀████▄▄██▀
--                      ██                            
--                    ▀▀▀                             

local terminal    = "ghostty"
local fileManager = "nautilus -w"
local menu        = "wofi --show drun"

local mainMod = "SUPER" -- Sets "windows" key as main modifier
local CSH = "CTRL + SHIFT" -- My ctrl + shift variable.. I just use it so much but also didn't want to change the main mod

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(CSH .. " + Q", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(CSH .. " + D", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(CSH .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(CSH .. " + Z", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

-- My Custom Additions
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("~/.config/hypr/scripts/reload.sh")) -- Reload Script
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("brave-browser")) -- Browser Shortcut
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + page_down", hl.dsp.exec_cmd("hyprshot -m output -o $HOME/Pictures/Screenshots")) -- Full Page Screenshot
hl.bind(mainMod .. " + page_up", hl.dsp.exec_cmd("hyprshot -m region output -o $HOME/Pictures/Screenshots")) -- Region Screenshot
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw")) -- Show/hide Notifications
hl.bind(CSH .. " + insert", hl.dsp.exec_cmd("eww active-windows | grep powermenu  && eww close powermenu  || eww open powermenu && killall -SIGUSR1 waybar")) -- Show/Hide powermenu

-- Built out hide waybar keybind with on the fly gap adjustments to maximize screenspace when in this psudofullscreen mode
local bar_hidden = false
hl.bind(mainMod .. " + H", function()
    
    os.execute("killall -SIGUSR1 waybar")

    if not bar_hidden then
        hl.workspace_rule({ -- Sets new thinner gaps and hides bars
            workspace = "m[DP-3]",
            gaps_out = 4,
            gaps_in = 2,
        })
        bar_hidden = true
    else
        hl.workspace_rule({ -- Returns gaps to normal and shows bars
            workspace = "m[DP-3]",
            gaps_out = { top = 5, right = 20, bottom = 0, left = 20 },
            gaps_in = 10,
        })
        bar_hidden = false
    end
end)

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces, expanded to be kindof fun allowing vertical and horizontal

-- -- Slide to the right
-- hl.bind(CSH .. " + right", function()
--     hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 2.71, bezier = "almostLinear", style = "slidefade right" })
--     hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slidefade right" })
    
--     hl.dispatch(hl.dsp.focus({ workspace = "e+1" }))
--     hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/scripts/hl-popin.sh")) -- Hacky workaround to set the animation to popin when using waybar
-- end)

-- -- Slide to the left
-- hl.bind(CSH .. " + left", function()
--     hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 2.71, bezier = "almostLinear", style = "slidefade left" })
--     hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slidefade left" })
    
--     hl.dispatch(hl.dsp.focus({ workspace = "e-1" }))
--     hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/scripts/hl-popin.sh"))
-- end)

-- -- One hop this time
-- hl.bind(CSH .. " + up", function()
--     hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 2.71, bezier = "almostLinear", style = "slidefade top" })
--     hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slidefade top" })
    
--     hl.dispatch(hl.dsp.focus({ workspace = "e+1" }))
--     hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/scripts/hl-popin.sh"))
-- end)

-- -- Downwards hop this time?
-- hl.bind(CSH .. " + down", function()
--     hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 2.71, bezier = "almostLinear", style = "slidefade bottom" })
--     hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slidefade bottom" })
    
--     hl.dispatch(hl.dsp.focus({ workspace = "e-1" }))
--     hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/scripts/hl-popin.sh"))
-- end)

-- Scroll workspaces (Sometimes zooms in brave.. looking for a solution as it seems to just be a brave issue)

hl.bind(CSH .. " + mouse_up", function()
    hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 2.71, bezier = "almostLinear", style = "slidefade bottom" })
    hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slidefade bottom" })
    
    hl.dispatch(hl.dsp.focus({ workspace = "e-1" }))
    hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/scripts/hl-popin.sh"))
end)

hl.bind(CSH .. " + mouse_down", function()
    hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 2.71, bezier = "almostLinear", style = "slidefade top" })
    hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slidefade top" })
    
    hl.dispatch(hl.dsp.focus({ workspace = "e+1" }))
    hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/scripts/hl-popin.sh"))
end)

-- Moving windows up and down workspaces with left/right click

hl.bind(CSH .. " + mouse:272", hl.dsp.window.move({ workspace = "e-1" }))

hl.bind(CSH .. " + mouse:273", hl.dsp.window.move({ workspace = "e+1" }))

-- Scroll to move around windows (need to figure out how to make this mouse:275 + scroll)

hl.bind("ALT + mouse_up", hl.dsp.window.move({ direction = "left" }))

hl.bind("ALT + mouse_down", hl.dsp.window.move({ direction = "right" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
