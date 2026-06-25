--   ▄▄▄                                               ▄▄▄▄▄▄▄         ▄▄ 
--  ▀██▀                                         █▄   █▀██▀▀▀           ██
--   ██                  ▄▄             ▄        ██     ██              ██
--   ██      ▄███▄ ▄███▄ ██ ▄█▀   ▄▀▀█▄ ████▄ ▄████     ███▀▄█▀█▄ ▄█▀█▄ ██
--   ██      ██ ██ ██ ██ ████     ▄█▀██ ██ ██ ██ ██   ▄ ██  ██▄█▀ ██▄█▀ ██
--  ████████▄▀███▀▄▀███▀▄██ ▀█▄  ▄▀█▄██▄██ ▀█▄█▀███   ▀██▀ ▄▀█▄▄▄▄▀█▄▄▄▄██


hl.config({
    general = {
        gaps_in  = 10,
        gaps_out =  { top = 5, right = 20, bottom = 0, left = 20 },

        border_size = 1,

        col = {
            active_border   = { colors = {"rgba(ffffff55)", "rgba(5adecd99)"}, angle = 45 },
            inactive_border = "rgba(59595911)",
        },

        resize_on_border = true,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = false,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 6,
            passes    = 2,
            vibrancy  = 0.1696,
            xray      = true,
        },
    },

    animations = {
        enabled = true,
    },
})

-----------------------
---- ANIMATIONS!!! ----
-----------------------

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},       {0.32, 1}        } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05},    {0.36, 1}        } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},          {1, 1}           } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},      {0.75, 1}        } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},       {0.1, 1}         } })
hl.curve("bounce",         { type = "bezier", points = { {0.91, 0.12},    {0.86, 1.36}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 3.1,  bezier = "easeOutQuint", style = "gnomed" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 3,    bezier = "easeOutQuint", style = "popin" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "popin" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slide" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 2.71, bezier = "almostLinear", style = "slidefade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slidefade" })
hl.animation({ leaf = "specialWorkspaceIn",  enabled = true,  speed = 2.71, bezier = "almostLinear", style = "slidefadevert -50%" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slidefadevert -50%" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-----------------------------------------
-- Wndow Rules to get my look and feel --
-----------------------------------------

-- Window Transaprency for apps

hl.window_rule({
  match   = { class = "brave-localhost__-Default" },
  opacity = "override 0.85 override 0.85 override",
})

hl.window_rule({
  match   = { class = "WebApp-OpenWebUI" },
  opacity = "override 0.85 override 0.85 override",
  -- float   = true,
  -- center  = true,
})

hl.window_rule({
  match   = { class = "obsidian" },
  opacity = "override 0.85 override 0.85 override",
})

hl.window_rule({
    match       = { class = "org.gnome.Calendar" },
    opacity     = "override 0.85 override 0.85 override",
    float       = true,
    center      = true,
    animation   = "slide top",
    move        = { "(monitor_w * 0.5) - (window_w * 0.5)", "(monitor_h * 0.025) + 12" },
    workspace   = "special:calendar",
})

hl.window_rule({
    match = { pin = true },
    border_color = "rgb(ffffff) rgb(5adecd)",
    border_size = 2
})

hl.window_rule({
    match = { title = "pomodoro" },
    float       = true,
    animation   = "slide top",
    move        = { "(monitor_w * 0.82)", "(monitor_h * 0.025) + 18" },
    size        = {400, 300},
    workspace   = "special:pomodoro",
})

hl.window_rule({
    match = { title = "sysstats" },
    float       = true,
    animation   = "slide bottom",
    move        = { "12", "(monitor_h * 0.6)" },
    size        = {1200, 520},
    workspace   = "special:sysstats",
})

-- Blurrr and animations

hl.layer_rule({
  match        = { namespace = "waybar" },
  blur         = true,
  ignore_alpha = 0.5,
})

hl.layer_rule({
  match        = { namespace = "wofi" },
  blur         = true,
  ignore_alpha = 0.5,
})

hl.layer_rule({
  match        = { namespace = "swaync-notification-window" },
  blur         = true,
  ignore_alpha = 0.5,
})

hl.layer_rule({
  match        = { namespace = "swaync-control-center" },
  blur         = true,
  ignore_alpha = 0.5,
  animation = "slide right",
  xray         = true,
})

hl.layer_rule({
  match        = { namespace = "gtk-layer-shell" },
  blur         = true,
  ignore_alpha = 0.1,
  animation    = "slide top",
  xray         = true,
})

-- Fix wacky popin background changes
hl.layer_rule({
  match        = { namespace = "hyprpaper" },
  animation = "fade",
})
-- Fixes wacky fly in from the side when reloading
hl.layer_rule({
  match        = { namespace = "waybar" },
  no_anim = true,
})

-- Clean slide in animation for the side bars
hl.layer_rule({
  match        = { namespace = "sidebar-left" },
  animation    = "slide left",
})

hl.layer_rule({
  match        = { namespace = "sidebar-right" },
  animation    = "slide right",
})

-- Fixes animation overlay animating itself into screenshots
hl.layer_rule({
  match        = { namespace = "selection" },
  no_anim = true,
})

----------------------
---- DEFAULT DUMP ----
----------------------

hl.config({
    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})