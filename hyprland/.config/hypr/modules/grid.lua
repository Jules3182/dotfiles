                                                                                       
--   ▄▄▄                                                            ▄   ▄▄▄▄              
--  █▀██  ██  ██▀▀                                                  ▀██████▀            █▄
--    ██  ██  ██       ▄     ▄▄                                       ██   ▄ ▄    ▀▀    ██
--    ██  ██  ██ ▄███▄ ████▄ ██ ▄█▀ ▄██▀█ ████▄ ▄▀▀█▄ ▄███▀ ▄█▀█▄     ██  ██ ████▄██ ▄████
--    ██▄ ██▄ ██ ██ ██ ██    ████   ▀███▄ ██ ██ ▄█▀██ ██    ██▄█▀     ██  ██ ██   ██ ██ ██
--    ▀████▀███▀▄▀███▀▄█▀   ▄██ ▀█▄█▄▄██▀▄████▀▄▀█▄██▄▀███▄▄▀█▄▄▄     ▀█████▄█▀  ▄██▄█▀███
--                                        ██                          ▄   ██              
--                                        ▀                           ▀████▀              
-- [Still somewhat expirimental!]

-- Sets up all of the persistent workspaces (5x3 grid)

hl.workspace_rule({ workspace = "1", persistent = true, monitor = "DP-3"})
hl.workspace_rule({ workspace = "2", persistent = true, monitor = "DP-3" })
hl.workspace_rule({ workspace = "3", persistent = true, monitor = "DP-3" })
hl.workspace_rule({ workspace = "4", persistent = true, monitor = "DP-3" })
hl.workspace_rule({ workspace = "5", persistent = true, monitor = "DP-3" })
hl.workspace_rule({ workspace = "6", persistent = true, monitor = "DP-3" })
hl.workspace_rule({ workspace = "7", persistent = true, monitor = "DP-3" })
hl.workspace_rule({ workspace = "8", persistent = true, monitor = "DP-3", default = true })
hl.workspace_rule({ workspace = "9", persistent = true, monitor = "DP-3" })
hl.workspace_rule({ workspace = "10", persistent = true, monitor = "DP-3" })
hl.workspace_rule({ workspace = "11", persistent = true, monitor = "DP-3" })
hl.workspace_rule({ workspace = "12", persistent = true, monitor = "DP-3" })
hl.workspace_rule({ workspace = "13", persistent = true, monitor = "DP-3" })
hl.workspace_rule({ workspace = "14", persistent = true, monitor = "DP-3" })
hl.workspace_rule({ workspace = "15", persistent = true, monitor = "DP-3" })

-- Sets workspace to center of the grid at launch
hl.on("hyprland.start", function () 
    hl.dispatch(hl.dsp.focus({ workspace = "8" }))
end)

-- Variables for keybinds
local mainMod = "SUPER"
local CSH = "CTRL + SHIFT"

-- Slide to the right
hl.bind(CSH .. " + right", function()

    -- Gets current workspace id to determine movement logic
    local ws = hl.get_active_workspace().id

    -- Checks if it's not one of the edges
    if ws ~= 5 and ws ~= 10 and ws ~= 15 then

        -- Changes animation to the right slide
        hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 2.71, bezier = "almostLinear", style = "slidefade right" })
        hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slidefade right" })
        
        -- Moves up one workspace
        hl.dispatch(hl.dsp.focus({ workspace = "e+1" }))

        -- Resets animation to popin so clicking the waybar doesn't slide in a weird direction
        hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/scripts/hl-popin.sh"))
    else
        hl.dispatch(hl.dsp.exec_cmd("hyprctl notify 0 2000 \"rgb(5adecd)\" \"Hit Edge of grid!\""))
    end
end)

-- Repeats logic for the rest of the directions

-- Slide to the left
hl.bind(CSH .. " + left", function()

    local ws = hl.get_active_workspace().id

    if ws ~= 1 and ws ~= 6 and ws ~= 11 then

        hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 2.71, bezier = "almostLinear", style = "slidefade left" })
        hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slidefade left" })
    
        hl.dispatch(hl.dsp.focus({ workspace = "e-1" }))
        hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/scripts/hl-popin.sh"))
    else
        hl.dispatch(hl.dsp.exec_cmd("hyprctl notify 0 2000 \"rgb(5adecd)\" \"Hit Edge of grid!\""))
    end
end)

-- One hop this time
hl.bind(CSH .. " + up", function()

    local ws = hl.get_active_workspace().id

    if ws >= 6 then
        hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 2.71, bezier = "almostLinear", style = "slidefade top" })
        hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slidefade top" })
    
        local moved = true

        if moved then
            hl.dispatch(hl.dsp.focus({ workspace = "e-5" }))
            moved = false
        end

        hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/scripts/hl-popin.sh"))
    else
        hl.dispatch(hl.dsp.exec_cmd("hyprctl notify 0 2000 \"rgb(5adecd)\" \"Hit Edge of grid!\""))
    end
end)

-- Downwards hop this time?
hl.bind(CSH .. " + down", function()

    local ws = hl.get_active_workspace().id

    if ws <= 10 then
        hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 2.71, bezier = "almostLinear", style = "slidefade bottom" })
        hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slidefade bottom" })
    
        local moved = true

        if moved then
            hl.dispatch(hl.dsp.focus({ workspace = "e+5" }))
            moved = false
        end

        hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/scripts/hl-popin.sh"))
    else
        hl.dispatch(hl.dsp.exec_cmd("hyprctl notify 0 2000 \"rgb(5adecd)\" \"Hit Edge of grid!\""))
    end
end)

-- Scrolling Functionality to traverse rows

hl.bind(CSH .. " + mouse_down", function()

    local ws = hl.get_active_workspace().id

    if ws >= 6 then
        hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 2.71, bezier = "almostLinear", style = "slidefade top" })
        hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slidefade top" })
    
        local moved = true

        if moved then
            hl.dispatch(hl.dsp.focus({ workspace = "e-5" }))
            moved = false
        end

        hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/scripts/hl-popin.sh"))
    else
        hl.dispatch(hl.dsp.exec_cmd("hyprctl notify 0 2000 \"rgb(5adecd)\" \"Hit Edge of grid!\""))
    end
end)

hl.bind(CSH .. " + mouse_up", function()

    local ws = hl.get_active_workspace().id

    if ws <= 10 then
        hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 2.71, bezier = "almostLinear", style = "slidefade bottom" })
        hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slidefade bottom" })
    
        local moved = true

        if moved then
            hl.dispatch(hl.dsp.focus({ workspace = "e+5" }))
            moved = false
        end

        hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/scripts/hl-popin.sh"))
    else
        hl.dispatch(hl.dsp.exec_cmd("hyprctl notify 0 2000 \"rgb(5adecd)\" \"Hit Edge of grid!\""))
    end
end)

-- Slide to the right
hl.bind(CSH .. " + mouse:276", function()

    -- Gets current workspace id to determine movement logic
    local ws = hl.get_active_workspace().id

    -- Checks if it's not one of the edges
    if ws ~= 5 and ws ~= 10 and ws ~= 15 then

        -- Changes animation to the right slide
        hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 2.71, bezier = "almostLinear", style = "slidefade right" })
        hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slidefade right" })
        
        -- Moves up one workspace
        hl.dispatch(hl.dsp.focus({ workspace = "e+1" }))

        -- Resets animation to popin so clicking the waybar doesn't slide in a weird direction
        hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/scripts/hl-popin.sh"))
    else
        hl.dispatch(hl.dsp.exec_cmd("hyprctl notify 0 2000 \"rgb(5adecd)\" \"Hit Edge of grid!\""))
    end
end)

-- Repeats logic for the rest of the directions

-- Slide to the left
hl.bind(CSH .. " + mouse:275", function()

    local ws = hl.get_active_workspace().id

    if ws ~= 1 and ws ~= 6 and ws ~= 11 then

        hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 2.71, bezier = "almostLinear", style = "slidefade left" })
        hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slidefade left" })
    
        hl.dispatch(hl.dsp.focus({ workspace = "e-1" }))
        hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/scripts/hl-popin.sh"))
    else
        hl.dispatch(hl.dsp.exec_cmd("hyprctl notify 0 2000 \"rgb(5adecd)\" \"Hit Edge of grid!\""))
    end
end)

-- Displays the grid mini map when navigating workspaces
hl.on("workspace.active", function()
    hl.dispatch(hl.dsp.exec_cmd("~/.config/eww/scripts/minimap.sh"))
end)