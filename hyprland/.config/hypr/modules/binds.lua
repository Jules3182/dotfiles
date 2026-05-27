                                                   
--   ▄▄▄▄   ▄▄▄                                       
--  █▀ ██  ██               █▄                █▄      
--     ██ ██                ██    ▀▀ ▄        ██      
--     █████    ▄█▀█▄ ██ ██ ████▄ ██ ████▄ ▄████ ▄██▀█
--     ██ ██▄   ██▄█▀ ██▄██ ██ ██ ██ ██ ██ ██ ██ ▀███▄
--   ▀██▀  ▀██▄▄▀█▄▄▄▄▄▀██▀▄████▀▄██▄██ ▀█▄█▀████▄▄██▀
--                      ██                            
--                    ▀▀▀                             

local terminal      = "ghostty"
local fileManager   = "nautilus -w"
local menu          = "wofi --show drun"
local browser       = "brave-browser"
local notifications = "swaync-client -t -sw"
local llm           = "ghostty -e ollama run gemma4"
local ide           = "brave-localhost__-default" -- Code server accessed on machine

local mainMod = "SUPER" -- Sets "windows" key as main modifier
local CSH = "CTRL + SHIFT" -- My ctrl + shift variable.. I just use it so much but also didn't want to change the main mod

hl.bind(CSH .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(CSH .. " + D", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(CSH .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(CSH .. " + Z", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

-- My Custom Additions
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("~/.config/hypr/scripts/reload.sh")) -- Reload Script
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser)) -- Browser Shortcut
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen()) -- Quick Fullscreen
hl.bind(mainMod .. " + page_down", hl.dsp.exec_cmd("hyprshot -m output -o $HOME/Pictures/Screenshots")) -- Full Page Screenshot
hl.bind(mainMod .. " + page_up", hl.dsp.exec_cmd("hyprshot -m region output -o $HOME/Pictures/Screenshots")) -- Region Screenshot
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(notifications)) -- Show/hide Notifications
hl.bind(CSH .. " + insert", hl.dsp.exec_cmd("eww active-windows | grep powermenu  && eww close powermenu  || eww open powermenu && killall -SIGUSR1 waybar")) -- Show/Hide powermenu
hl.bind(CSH .. " + O", hl.dsp.exec_cmd(llm, { float = true})) -- Quick floating Ollama bind

-- Overview with submap for esc closing
hl.bind(mainMod .. " + TAB", function()
    hl.dispatch(hl.dsp.exec_cmd("~/.config/eww/scripts/overview_icons.sh && eww active-windows | grep -q overview && eww close overview || eww open overview && killall -SIGUSR1 waybar"))
    hl.dispatch(hl.dsp.submap("overview"))
end)

hl.define_submap("overview", function()
    hl.bind("escape", function()
        hl.dispatch(hl.dsp.exec_cmd("eww close overview && killall -SIGUSR1 waybar"))
        hl.dispatch(hl.dsp.submap("reset"))
    end)
end)

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

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- COMMENTED OUT WORKSPACE NAVIGATION: GO CHECK THE grid.lua MODULE FOR ALL OF THIS!

-- Moving windows up and down workspaces with left/right click

hl.bind(CSH .. " + mouse:272", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(CSH .. " + mouse:273", hl.dsp.window.move({ workspace = "e+1" }))

-- Quick Nav Mode! (Because having it normally was messing with the way I use vs code, so making a submap made sense to snap into a new mode)

hl.bind("CTRL + TAB", function()
    hl.dispatch(hl.dsp.submap("quickNav"))
    -- Little notification pop up to show when it is active
    hl.dispatch(hl.dsp.exec_cmd("hyprctl notify 0 200000 \"rgb(ffffff)\" \"Quick Nav Enabled\""))
    -- Changes around some of the look and feel to make it more obvious what's going on
    hl.config({general = {border_size = 3}, decoration = {inactive_opacity = 0.4}})
    hl.window_rule({ match   = { class = "brave-localhost__-Default" }, opacity = "override 0.85 override 0.4 override"})
    hl.window_rule({ match   = { class = "obsidian" }, opacity = "override 0.85 override 0.4 override"})
end)

hl.define_submap("quickNav", function()

    -- Arrows to quickly navigate windows
    hl.bind("up", hl.dsp.focus({ direction = "up" }))
    hl.bind("down", hl.dsp.focus({ direction = "down" }))
    hl.bind("left", hl.dsp.focus({ direction = "left" }))
    hl.bind("right", hl.dsp.focus({ direction = "right" }))
    
    -- Arrows to quickly move around windows with ctrl
    hl.bind("CTRL + up", hl.dsp.window.move({ direction = "up" }))
    hl.bind("CTRL + down", hl.dsp.window.move({ direction = "down" }))
    hl.bind("CTRL + left", hl.dsp.window.move({ direction = "left" }))
    hl.bind("CTRL + right", hl.dsp.window.move({ direction = "right" }))
    
    -- Quick close while in this mode
    hl.bind("D", hl.dsp.window.close())
    
    -- Exit quick nav mode
    hl.bind("escape", function()
        hl.dispatch(hl.dsp.submap("reset"))
        -- Dismisses the notification
        hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
        -- Resets look and feel
        hl.config({general = {border_size = 1}, decoration = {inactive_opacity = 1}})
        hl.window_rule({ match   = { class = "brave-localhost__-Default" }, opacity = "override 0.85 override 0.85 override"})
        hl.window_rule({ match   = { class = "obsidian" }, opacity = "override 0.85 override 0.85 override"})
    end)
end)

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

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
