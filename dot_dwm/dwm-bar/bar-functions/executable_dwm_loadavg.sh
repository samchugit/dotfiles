#!/bin/sh

# A dwm_bar function to read the average system load
# Alvar Penning <post@0x21.biz>
# GNU GPLv3

dwm_loadavg () {
    # LOAD_FIELDS specifies the load average values to be displayed. Values
    # within 1-3 are allowed, passed as a range (-) or comma-separated.
    # - 1: load average within the last minute
    # - 2: load average within the last five minutes
    # - 3: load average within the last fifteen minutes

    LOAD_AVG_1=$(cut -d " " -f 1 /proc/loadavg)
    LOAD_AVG_5=$(cut -d " " -f 2 /proc/loadavg)
    LOAD_AVG_15=$(cut -d " " -f 3 /proc/loadavg)

    LOAD_INT=$(echo $LOAD_AVG_1 | awk '{print int($1)}')
    PROCESSOR=$(cat /proc/cpuinfo | grep "processor" | wc -l)
    THRESH=$(echo "$PROCESSOR*3/4" | bc)

    if [ "$LOAD_INT" -eq "0" ]; then
        ICON=""
    elif [ "$LOAD_INT" -ge "1" ] && [ "$LOAD_INT" -lt "$THRESH" ]; then
        ICON=""
    elif [ "$LOAD_INT" -ge "$THRESH" ]; then
        ICON=""
    fi

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "%s %1.1f %1.1f %1.1f" "$ICON" "$LOAD_AVG_1" "$LOAD_AVG_5" "$LOAD_AVG_15"
    else
        printf "Load %1.1f %1.1f %1.1f" "$LOAD_AVG_1" "$LOAD_AVG_5" "$LOAD_AVG_15"
    fi
    printf "%s\n" "$SEP2"
}

dwm_loadavg
