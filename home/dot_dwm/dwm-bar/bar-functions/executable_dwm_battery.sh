#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$STATUS" = "Discharging" ]; then
            #printf "🔋 %s%% %s" "$CHARGE" "$STATUS"
            #printf " %s%%" "$CHARGE"
            if [ "$CHARGE" -ge 0 ] && [ "$CHARGE" -le 10 ]; then
                printf " %s%%" "$CHARGE"
            elif [ "$CHARGE" -gt 10 ] && [ "$CHARGE" -le 20 ]; then
                printf " %s%%" "$CHARGE"
            elif [ "$CHARGE" -gt 20 ] && [ "$CHARGE" -le 30 ]; then
                printf " %s%%" "$CHARGE"
            elif [ "$CHARGE" -gt 30 ] && [ "$CHARGE" -le 40 ]; then
                printf " %s%%" "$CHARGE"
            elif [ "$CHARGE" -gt 40 ] && [ "$CHARGE" -le 50 ]; then
                printf " %s%%" "$CHARGE"
            elif [ "$CHARGE" -gt 50 ] && [ "$CHARGE" -le 60 ]; then
                printf " %s%%" "$CHARGE"
            elif [ "$CHARGE" -gt 60 ] && [ "$CHARGE" -le 70 ]; then
                printf " %s%%" "$CHARGE"
            elif [ "$CHARGE" -gt 70 ] && [ "$CHARGE" -le 80 ]; then
                printf " %s%%" "$CHARGE"
            elif [ "$CHARGE" -gt 80 ] && [ "$CHARGE" -le 90 ]; then
                printf " %s%%" "$CHARGE"
            elif [ "$CHARGE" -gt 90 ] && [ "$CHARGE" -le 100 ]; then
                printf " %s%%" "$CHARGE"
            fi
        else
            #printf "🔌 %s%% %s" "$CHARGE" "$STATUS"
            printf " %s%%" "$CHARGE"
        fi
    else
        if [ "$STATUS" = "Discharging" ]; then
            #printf "🔋 %s%% %s" "$CHARGE" "$STATUS"
            printf "Bat %s%%" "$CHARGE"
        else
            #printf "🔌 %s%% %s" "$CHARGE" "$STATUS"
            printf "Chg %s%%" "$CHARGE"
        fi
    fi
    printf "%s\n" "$SEP2"
}

dwm_battery

