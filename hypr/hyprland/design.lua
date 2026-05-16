-- Design-related stuff
-- note: will split this file further

-- https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 4,
        gaps_out = 8,

        border_size = 1,

        col = {
            active_border   = "rgb(efefef)",
            inactive_border = "rgb(888888)",
        },

        resize_on_border = true,

        -- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding         = 0,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            sharp        = true,
            range        = 0,
            render_power = 0,
            color        = "rgba(000000ff)",
            offset       = "4 4",
        },

        blur = {
            enabled = false,
        },
    },

    animations = {
        enabled = false,
    },

    binds = {
        scroll_event_delay     = 256,
        focus_preferred_method = 0,
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
    },
})

-- https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
hl.config({
    dwindle = {
        preserve_split = true,
    },
})

-- https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
hl.config({
    master = {
        new_status = "master",
    },
})

-- https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

