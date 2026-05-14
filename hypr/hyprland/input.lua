-- Keyboard and mouse

hl.config({
    input = {
        kb_layout = "us, ru",
        kb_options = "grp:win_space_toggle, grp:alt_shift_toggle, caps:hyper",

        kb_variant = "",
        kb_model = "",
        kb_rules = "",

        follow_mouse = 1,

        sensitivity = 0, -- [-1.0..1.0]

        touchpad = {
            natural_scroll = true,
        },
    },

    cursor = {
        no_hardware_cursors = true,
    },
})

