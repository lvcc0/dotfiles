-- Environment variables
-- https://wiki.hypr.land/Configuring/Environment-variables/

-- cursor
hl.env("HYPRCURSOR_THEME", "theme_Kasane Teto Theme")
hl.env("XCURSOR_SIZE",     "24")
hl.env("HYPRCURSOR_SIZE",  "24")

-- XDG specifications
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE",    "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Qt
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR",         "1")
hl.env("QT_QPA_PLATFORM",                     "wayland;xcb")
hl.env("QT_QPA_PLATFORM_THEME",               "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- Mozilla
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- Ozone
hl.env("OZONE_PLATFORM", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

-- toolkit backend
hl.env("GDK_BACKEND", "wayland, x11, *")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

