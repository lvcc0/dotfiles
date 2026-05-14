-- Monitor setup
-- https://wiki.hypr.land/Configuring/Monitors/

-- main display
hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@60",
    position = "0x0",
    scale    = 1,
})

-- mirrored display
--[[
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
    mirror   = "eDP-1",
})
]]
 