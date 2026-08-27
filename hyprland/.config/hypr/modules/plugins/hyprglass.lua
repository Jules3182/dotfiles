
if hl.plugin.hyprglass then
    local hg = hl.plugin.hyprglass

    
    hg.config({
        default_theme = "dark",
        default_preset = "glass",
        tint_color = 0x8899aa22,


        brightness = 0.9,
        dark = { brightness = 0.82 },
        light = { adaptive_boost = 0.5 },

        layers = { enabled = 1 },
    })

    -- Layer surfaces: each call whitelists the namespace and configures it
    hg.layer("waybar", { preset = "glass", mask_threshold = 0.05 })
    hg.layer("swaync", { preset = "glass", mask_threshold = 0.05 })
    hg.layer("wofi", { preset = "glass", mask_threshold = 0.05 })
    hg.layer("swaync-notification-window", { preset = "glass" })
    hg.layer("debug-panel", { exclude = true })

    -- Presets
    hg.preset("LightGlass", {
        blur_strength= 4,
        blur_iterations = 2,
        lens_distortion = 0.3,
        refraction_strength = 1.0,
        chromatic_aberration = 0.2,
        fresnel_strength = 0.4,
        specular_strength = 0.8,
        glass_opacity = 1.2,
        edge_thickness = 1.18,
        tint_color = 0xFFFFFF22,

        adaptive_dim = 0.2,
    })

    hg.preset("contrasted", {
        inherits = "high_contrast",
        contrast = 1.2,
        adaptive_dim = 1.5,
        dark = { tint_color = 0x02142aa9 },
    })
end