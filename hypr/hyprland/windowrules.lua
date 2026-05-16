-- Window & layer rules
-- https://wiki.hypr.land/Configuring/Window_Rules/

-- ignore maximize requests
hl.window_rule({
    name = "ignore-maximize",
    suppress_event = "maximize",
    
    match = { class = ".*", },
})

-- fix some dragging issues with XWayland
hl.window_rule({
    name = "xwayland-drag-fix",
    no_focus = true,
    
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
})

-- wofi blur
hl.layer_rule({
    name = "wofi-blur",

    blur = true,
    ignore_alpha = 0.01,
    blur_popups = true,
    dim_around = true,
    
    match = { namespace = "wofi", },
})

-- quickshell blur
hl.layer_rule({
    name = "quickshell-blur",

    blur = true,
    ignore_alpha = 0.01,
    blur_popups = true,
    
    match = { namespace = "quickshell", },
})

-- dunst blur
hl.layer_rule({
    name = "quickshell-blur",

    blur = true,
    ignore_alpha = 0.01,
    blur_popups = true,
    
    match = { namespace = "dunst", },
})

