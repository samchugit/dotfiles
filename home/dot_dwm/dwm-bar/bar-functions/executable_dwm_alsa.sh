#!/bin/sh

# A dwm_bar function to show the master volume of ALSA
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: alsa-utils

dwm_alsa () {
	STATUS=$(amixer sget Master | tail -n1 | sed -r "s/.*\[(.*)\]/\1/")
    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
    	if [ "$STATUS" = "off" ]; then
				#printf "🔇"
	            printf "婢"
    	else
    		#removed this line becuase it may get confusing
	        if [ "$VOL" -ge 0 ] && [ "$VOL" -le 33 ]; then
				#printf "🔈%s%%" "$VOL"
	            printf "奄 %s%%" "$VOL"
	        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
				#printf "🔉%s%%" "$VOL"
	            printf "奔 %s%%" "$VOL"
	        else
				#printf "🔊%s%%" "$VOL"
	            printf "墳 %s%%" "$VOL"
	        fi
		fi
    else
    	if [ "$STATUS" = "off" ]; then
    		printf "MUTE"
    	else
	        # removed this line because it may get confusing
	        if [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
	            printf "Vol %s%%" "$VOL"
	        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
	            printf "Vol %s%%" "$VOL"
	        else
	            printf "Vol %s%%" "$VOL"
        	fi
        fi
    fi
    printf "%s\n" "$SEP2"
}

dwm_alsa
