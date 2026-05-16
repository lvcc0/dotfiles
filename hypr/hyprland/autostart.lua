-- Autostart commands
-- https://wiki.hypr.land/Configuring/Basics/Autostart/

local theme = require("hyprland.theme")

hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("qs")
    hl.exec_cmd("sh -c \"if [ -z $(pidof hyprpaper) ]; then hyprpaper & sleep 1s; fi; " .. theme.scripts_dir .. "/random-wallpaper.sh\"")
    hl.exec_cmd("hyprshade auto")
end)

