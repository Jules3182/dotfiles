-- EXPIRAMENTAL GRID LAYOUT TEST!!

-- Sets up all of the workspaces

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

local mainMod = "SUPER" -- Sets "windows" key as main modifier
local CSH = "CTRL + SHIFT"

-- Slide to the right
hl.bind(CSH .. " + right", function()

    local ws = hl.get_active_workspace().id

    if ws ~= 5 and ws ~= 10 and ws ~= 15 then

        hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 2.71, bezier = "almostLinear", style = "slidefade right" })
        hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slidefade right" })
    
        hl.dispatch(hl.dsp.focus({ workspace = "e+1" }))
        hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/scripts/hl-popin.sh")) -- Hacky workaround to set the animation to popin when using waybar
    end
end)

-- Slide to the left
hl.bind(CSH .. " + left", function()

    local ws = hl.get_active_workspace().id

    if ws ~= 1 and ws ~= 6 and ws ~= 11 then

        hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 2.71, bezier = "almostLinear", style = "slidefade left" })
        hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slidefade left" })
    
        hl.dispatch(hl.dsp.focus({ workspace = "e-1" }))
        hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/scripts/hl-popin.sh"))
    end
end)

-- One hop this time
hl.bind(CSH .. " + up", function()

    local ws = hl.get_active_workspace().id

    if ws <= 10 then
        hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 2.71, bezier = "almostLinear", style = "slidefade top" })
        hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slidefade top" })
    
        for _ = 1, 5 do
            hl.dispatch(hl.dsp.focus({ workspace = "e+1" }))
        end

        hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/scripts/hl-popin.sh"))
    end
end)

-- Downwards hop this time?
hl.bind(CSH .. " + down", function()

    local ws = hl.get_active_workspace().id

    if ws >= 6 then
        hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 2.71, bezier = "almostLinear", style = "slidefade bottom" })
        hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slidefade bottom" })
    
        for _ = 1, 5 do
            hl.dispatch(hl.dsp.focus({ workspace = "e-1" }))
        end

        hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/scripts/hl-popin.sh"))
    end
end)