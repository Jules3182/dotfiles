                                                                                                             
--   ▄▄▄▄▄                             ▄▄     ▄▄▄                                                               
--  ██▀▀▀▀█▄                            ██   █▀██  ██  ██▀▀                                                     
--  ▀██▄  ▄▀                   ▀▀       ██     ██  ██  ██       ▄     ▄▄                                        
--    ▀██▄▄  ████▄ ▄█▀█▄ ▄███▀ ██ ▄▀▀█▄ ██     ██  ██  ██ ▄███▄ ████▄ ██ ▄█▀ ▄██▀█ ████▄ ▄▀▀█▄ ▄███▀ ▄█▀█▄ ▄██▀█
--  ▄   ▀██▄ ██ ██ ██▄█▀ ██    ██ ▄█▀██ ██     ██▄ ██▄ ██ ██ ██ ██    ████   ▀███▄ ██ ██ ▄█▀██ ██    ██▄█▀ ▀███▄
--  ▀██████▀▄████▀▄▀█▄▄▄▄▀███▄▄██▄▀█▄██▄██     ▀████▀███▀▄▀███▀▄█▀   ▄██ ▀█▄█▄▄██▀▄████▀▄▀█▄██▄▀███▄▄▀█▄▄▄█▄▄██▀
--           ██                                                                    ██                           
--           ▀                                                                     ▀                            
                                                                                                             
--      ▄▄              ▄▄▄                                                                                     
--    ▄█▀▀█▄           █▀██  ██  ██▀▀     █▄             █▄                                                     
--    ██  ██             ██  ██  ██ ▀▀    ██    ▄▄      ▄██▄                                                    
--    ██▀▀██   ▄██▀█     ██  ██  ██ ██ ▄████ ▄████ ▄█▀█▄ ██ ▄██▀█                                               
--  ▄ ██  ██   ▀███▄     ██▄ ██▄ ██ ██ ██ ██ ██ ██ ██▄█▀ ██ ▀███▄                                               
--  ▀██▀  ▀█▄██▄▄██▀     ▀████▀███▀▄██▄█▀███▄▀████▄▀█▄▄▄▄███▄▄██▀                                               
--                                              ██                                                              
--                                            ▀▀▀                                                               


-- Keybind to close widgets with escape
hl.bind("escape", function()
    if hl.get_active_special_workspace() then
        hl.dispatch(hl.dsp.workspace.toggle_special())
        hl.dispatch(hl.dsp.workspace.toggle_special()) -- for some reason it needs to be done twice, once only hides the window, but the second one hides the whole workspace
    else
        hl.dispatch(hl.dsp.send_shortcut({ mods = "nil", key = "escape"})) -- Sends normal escape if its not a special workspace
    end
end)

-- Look and feel adjustments for apps being used as widgets
hl.window_rule({
    match = { title = "pomodoro" },
    float       = true,
    animation   = "slide top",
    move        = { "(monitor_w * 0.82)", "(monitor_h * 0.025) + 18" },
    size        = {400, 300},
    workspace   = "special:pomodoro",
})

hl.window_rule({
    match = { title = "newnote" },
    float       = true,
    animation   = "fade",
    -- move        = { "(monitor_w * 0.8)", "(monitor_h * 0.06) + 18" },
    size        = {400, 100},
    workspace   = "special:newnote",
})

hl.window_rule({
    match = { title = "sysstats" },
    float       = true,
    animation   = "slide bottom",
    move        = { "12", "(monitor_h * 0.6)" },
    size        = {1200, 520},
    workspace   = "special:sysstats",
})

hl.window_rule({
    match = { title = "quake" },
    float       = true,
    animation   = "slide top",
    move        = { "4", "4" },
    size        = {2550, 520},
    workspace   = "special:quake",
    xray        = false,
})

hl.window_rule({
    match = { class = "org.pulseaudio.pavucontrol" },
    opacity = "override 0.85 override 0.85 override",
    float       = true,
    animation   = "slide top",
    move        = { "(monitor_w * 0.78)", "(monitor_h * 0.025) + 18" },
    size        = {500, 700},
    workspace   = "special:audio",
})


hl.window_rule({
    match       = { class = "org.gnome.Calendar" },
    opacity     = "override 0.85 override 0.85 override",
    float       = true,
    center      = true,
    animation   = "slide top",
    move        = { "(monitor_w * 0.5) - (window_w * 0.5)", "(monitor_h * 0.025) + 20" },
    workspace   = "special:calendar",
})
