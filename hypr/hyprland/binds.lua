-- Binds
-- https://wiki.hypr.land/Configuring/Binds/

local theme = require("hyprland.theme")

-- programs
hl.bind("SUPER + T",         hl.dsp.exec_cmd(theme.terminal))
hl.bind("SUPER + E",         hl.dsp.exec_cmd(theme.file_mgr))
hl.bind("SUPER + R",         hl.dsp.exec_cmd(theme.menu))
hl.bind("SUPER + C",         hl.dsp.exec_cmd(theme.ide))
hl.bind("SUPER + B",         hl.dsp.exec_cmd(theme.browser))
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd(theme.browser_private))

-- actions
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))

hl.bind("SUPER + print", hl.dsp.exec_cmd("hyprshot -m window --clipboard-only"))
hl.bind("print",         hl.dsp.exec_cmd("hyprshot -m output --clipboard-only"))

hl.bind("SUPER + SHIFT + print", hl.dsp.exec_cmd("hyprshot -m window --output-folder " .. theme.screenshots_dir))
hl.bind("SHIFT + print",         hl.dsp.exec_cmd("hyprshot -m output --output-folder " .. theme.screenshots_dir))

hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))

-- windows
hl.bind("SUPER + W",           hl.dsp.window.close())
hl.bind("SUPER + F",           hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle", }))
hl.bind("SUPER + SHIFT + F",   hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle", }))
hl.bind("SUPER + ALT + space", hl.dsp.window.float({ action = "toggle" }))

hl.bind("SUPER + RETURN", hl.dsp.layout("togglesplit"))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true, })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true, })

for i = 1, 4 do
    local keys = { "left", "down", "up", "right", }
    
    local res = 32
    local xres = { -res, 0,    0,   res, }
    local yres = {  0,   res, -res, 0,  }

    -- move focus
    hl.bind("SUPER + " .. keys[i], hl.dsp.focus({ direction = keys[i], }))

    -- move windows
    hl.bind("SUPER + SHIFT + " .. keys[i], hl.dsp.window.move({ direction = keys[i], }))

    -- resize windows
    hl.bind("SUPER + ALT + " .. keys[i], hl.dsp.window.resize({ x = xres[i], y = yres[i], relative = true, }), { repeating = true, })
end

-- workspaces
hl.bind("SUPER + tab",         hl.dsp.focus({ workspace = "e+1", }))
hl.bind("SUPER + SHIFT + tab", hl.dsp.focus({ workspace = "e-1", }))

hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e+1", }))
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e-1", }))

for i = 1, 10 do
    local key = i % 10

    -- switch to workspace
    hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i, }))
    
    -- move active window to workspace
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, }))
end

-- special workspace
hl.bind("SUPER + Hyper_L        ", hl.dsp.workspace.toggle_special("special"))
hl.bind("SUPER + SHIFT + Hyper_L", hl.dsp.window.move({ workspace = "special", }))

hl.on("workspace.active", function()
    if hl.get_active_special_workspace() then
        hl.dsp.workspace.toggle_special("special")
    end
end)

-- multimedia keys
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true, })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true, })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true, })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true, })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true, })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true, })

hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, })
hl.bind("XF86AudioPause",        hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, })
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd("playerctl next"),       { locked = true, })
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd("playerctl previous"),   { locked = true, })

