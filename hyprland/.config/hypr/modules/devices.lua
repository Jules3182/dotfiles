--   ▄▄▄▄▄▄                                   
--  █▀██▀▀██                                  
--    ██   ██             ▀▀                  
--    ██   ██ ▄█▀█▄▀█▄ ██▀██ ▄███▀ ▄█▀█▄ ▄██▀█
--  ▄ ██   ██ ██▄█▀ ██▄██ ██ ██    ██▄█▀ ▀███▄
--  ▀██▀███▀ ▄▀█▄▄▄  ▀█▀ ▄██▄▀███▄▄▀█▄▄▄█▄▄██▀
                                           
hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
