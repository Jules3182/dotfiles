                                                   
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
local llm           = "brave-browser --app=\"http://localhost:9000/\" --class=WebApp-OpenWebUI --name=WebApp-OpenWebUI"
local ide           = "brave-localhost__-default" -- Code server accessed on machine
local timer         = "ghostty -e ~/.cargo/bin/timr-tui -m pomodoro"

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
hl.bind(CSH .. " + insert", hl.dsp.exec_cmd("eww active-windows | grep powermenu  && eww close powermenu  || eww open powermenu")) -- Show/Hide powermenu
hl.bind(CSH .. " + O", hl.dsp.exec_cmd(llm, { float = true})) -- Quick floating Ollama bind
hl.bind(CSH .. " + 0", hl.dsp.exec_cmd(timer, { float = true, pin = true, move = {22, 62}, size = {480, 280}})) -- Quick floating pomodoro timer
hl.bind("SUPER + C", function() -- Quick pin keybind
    local win = hl.get_active_window()
    if not win then return end
    hl.dispatch(hl.dsp.window.pin())
    if win.pinned then
        hl.dispatch(hl.dsp.exec_cmd("hyprctl notify 1 2000 \"rgb(ffffff)\" \"Window Pinned!\""))
    else
        hl.dispatch(hl.dsp.exec_cmd("hyprctl notify 1 2000 \"rgb(ffffff)\" \"Window Unpinned!\""))
    end
end)

-- Gaming mode to disable all keybinds while gaming so it doesn't mess with stuff (Can also be used as a coding/focus mode if the program you use has overlapping keybinds)
hl.bind("SUPER + G", function()
    hl.dispatch(hl.dsp.exec_cmd("hyprctl notify 1 2000 \"rgb(22ff22)\" \"Gaming Mode Activated!\""))
    hl.dispatch(hl.dsp.submap("gaming"))
end)

hl.define_submap("gaming", function()
    hl.bind("SUPER + G", function()
        hl.dispatch(hl.dsp.exec_cmd("hyprctl notify 1 2000 \"rgb(22ff22)\" \"Gaming Mode Deactivated!\""))
        hl.dispatch(hl.dsp.submap("reset"))
    end)
end)

-- Overview with submap for esc closing
hl.bind(mainMod .. " + TAB", function()
    hl.dispatch(hl.dsp.exec_cmd("~/.config/eww/scripts/overview_icons.sh && eww open overview"))
    hl.dispatch(hl.dsp.submap("overview"))
end)

hl.define_submap("overview", function()
    hl.bind("escape", function()
        hl.dispatch(hl.dsp.exec_cmd("eww close overview"))
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

-- Quick Nav Mode! (Because having these bindings active normally was messing with the way I use vs code, so making a submap made sense to snap into a new mode)

hl.bind("CTRL + TAB", function()
    hl.dispatch(hl.dsp.submap("quickNav"))
    -- Little notification pop up to show when it is active
    hl.dispatch(hl.dsp.exec_cmd("hyprctl notify 0 200000 \"rgb(5adecd)\" \"Quick Nav Enabled!\""))
    hl.dispatch(hl.dsp.exec_cmd("hyprctl notify 1 2000 \"rgb(ffffff)\" \"Press h for help\""))
    -- Changes around some of the look and feel to make it more obvious what's going on
    hl.config({general = {border_size = 3}, decoration = {active_opacity = 0.9, inactive_opacity = 0.4}})
    hl.window_rule({ match   = { class = "brave-localhost__-Default" }, opacity = "override 0.9 override 0.4 override"})
    hl.window_rule({ match   = { class = "obsidian" }, opacity = "override 0.8 override 0.9 override"})
    -- os.execute("killall -SIGUSR1 waybar")
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
    
    -- Window Resizing with alt + arrow keys
    hl.bind("ALT + right", hl.dsp.window.resize({ x = 30, y = 0, relative = true}), { repeating = true })
    hl.bind("ALT + left", hl.dsp.window.resize({ x = -30, y = 0, relative = true}), { repeating = true })
    hl.bind("ALT + up", hl.dsp.window.resize({ x = 0, y = -30, relative = true}), { repeating = true })
    hl.bind("ALT + down", hl.dsp.window.resize({ x = 0, y = 30, relative = true}), { repeating = true })
    
    -- Quick actions while in this mode
    hl.bind("D", hl.dsp.window.close())
    hl.bind("Q", hl.dsp.exec_cmd(terminal))
    hl.bind("E", hl.dsp.exec_cmd(fileManager))

    -- Quick little help menu with notify
    local helpMenu = true
    hl.bind("H", function()
        if helpMenu then
            hl.dispatch(hl.dsp.exec_cmd("hyprctl notify 1 200000 \"rgb(ffffff)\" \"Use the arrow keys to navigate your windows\""))
            hl.dispatch(hl.dsp.exec_cmd("hyprctl notify 1 200000 \"rgb(ffffff)\" \"Hold CTRL to move them\""))
            hl.dispatch(hl.dsp.exec_cmd("hyprctl notify 1 200000 \"rgb(ffffff)\" \"Hold ALT to resize them\""))
            hl.dispatch(hl.dsp.exec_cmd("hyprctl notify 1 200000 \"rgb(ffffff)\" \"D closes windows\""))
            hl.dispatch(hl.dsp.exec_cmd("hyprctl notify 1 200000 \"rgb(ffffff)\" \"Q opens the terminal\""))
            hl.dispatch(hl.dsp.exec_cmd("hyprctl notify 1 200000 \"rgb(ffffff)\" \"E opens the file explorer\""))
            hl.dispatch(hl.dsp.exec_cmd("hyprctl notify 1 200000 \"rgb(ffffff)\" \"To exit left click, press escape, or enter\""))
            helpMenu = false
        else
            -- Gets rid of all notifications and shows the original messages again
            hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
            hl.dispatch(hl.dsp.exec_cmd("hyprctl notify 0 200000 \"rgb(5adecd)\" \"Quick Nav Enabled!\""))
            helpMenu = true
        end
    end)
    
    -- Function to handle exiting the submap and resetting changes
    function exitQN()
        hl.dispatch(hl.dsp.submap("reset"))
        -- Dismisses the notifications
        hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
        -- Resets look and feel
        hl.config({general = {border_size = 1}, decoration = {active_opacity = 1, inactive_opacity = 1}})
        hl.window_rule({ match   = { class = "brave-localhost__-Default" }, opacity = "override 0.85 override 0.85 override"})
        hl.window_rule({ match   = { class = "obsidian" }, opacity = "override 0.85 override 0.85 override"})
        helpMenu = true -- Resets this variable incase the user exits while the help menu is open
    end

    -- Binds for various ways to exit Quick Nav
    hl.bind("escape", exitQN)
    hl.bind("return", exitQN)
    hl.bind("mouse:272", exitQN)

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
