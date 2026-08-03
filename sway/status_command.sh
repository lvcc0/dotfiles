# date & time
DATE=$(date "+%a %d.%m.%y %H:%M:%S")
TIME=$(date "+%H:%M")

# battery
BAT_PERCENTAGE=$(upower -i $(upower -e | grep "BAT") | grep "percentage" | awk '{print $2}')
BAT_STATE=$(upower -i $(upower -e | grep "BAT") | grep "state" | awk '{print $2}')

# audio
AUDIO_VOLUME=$(pamixer --get-volume)
AUDIO_MUTE=$(pamixer --get-mute)

# network
NETWORK=$(ip route get 1.1.1.1 | grep -Po '(?<=dev\s)\w+' | cut -f1 -d ' ')

# language
LANG=$(swaymsg -r -t get_inputs | awk '/1:1:AT_Translated_Set_2_keyboard/;/xkb_active_layout_name/' | grep -A1 '\b1:1:AT_Translated_Set_2_keyboard\b' | grep "xkb_active_layout_name" | awk -F '"' '{print $4}')

# formatting

if [ $AUDIO_MUTE = "true" ]; then
    AUDIO_STR="mute"
else
    AUDIO_STR="$AUDIO_VOLUME%"
fi

echo "| $LANG | $NETWORK | $AUDIO_STR | $BAT_PERCENTAGE ($BAT_STATE) | $DATE | $TIME | "
