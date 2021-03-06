#!/bin/sh

# A modular status bar for dwm
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: xorg-xsetroot

# Store the directory the script is running from
LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

# Change the appearance of the module identifier. if this is set to "unicode", then symbols will be used as identifiers instead of text. E.g. [📪 0] instead of [MAIL 0].
# Requires a font with adequate unicode character support
export IDENTIFIER="unicode"
#export IDENTIFIER=""

# Change the charachter(s) used to seperate modules. If two are used, they will be placed at the start and end.
export SEP1=" "
export SEP2=" "

# Import the modules
. "$DIR/bar-functions/dwm_playerctl.sh"
. "$DIR/bar-functions/dwm_resources.sh"
. "$DIR/bar-functions/dwm_battery.sh"
. "$DIR/bar-functions/dwm_alsa.sh"
. "$DIR/bar-functions/dwm_loadavg.sh"
. "$DIR/bar-functions/dwm_date.sh"

# Update dwm status bar every second
while true
do
    # Append results of each func one by one to a string
    dispstr=""
    dispstr="$dispstr$(dwm_playerctl)"
    dispstr="$dispstr$(dwm_resources)"
    dispstr="$dispstr$(dwm_loadavg)"
    dispstr="$dispstr$(dwm_alsa)"
    dispstr="$dispstr$(dwm_battery)"
    dispstr="$dispstr$(dwm_date)"

    xsetroot -name "$dispstr"
    sleep 1
done
