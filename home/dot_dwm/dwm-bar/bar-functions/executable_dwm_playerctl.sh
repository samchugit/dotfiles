#!/bin/sh

# A dwm_bar function that shows the current artist, track, duration, and status from Spotify using playerctl
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: spotify/spotifyd, playerctl

# NOTE: The official spotify client does not provide the track position or shuffle status through playerctl. This does work through spotifyd however.

dwm_playerctl () {
    PLAYER=$(playerctl metadata -f '{{ playerName }}')

    if [ "$PLAYER" = "osdlyrics" ]; then
        PLAYER="spotify"
    fi

    if [ "$PLAYER" = "spotify" ] || [ "$PLAYER" = "spotifyd" ]; then
        ICON=""
        ARTIST=$(playerctl metadata artist)
        TRACK=$(playerctl metadata title)
        POSITION=$(playerctl position | sed 's/..\{6\}$//')
        DURATION=$(playerctl metadata mpris:length | sed 's/.\{6\}$//')
        STATUS=$(playerctl metadata -f '{{ status }}')
        SHUFFLE=$(playerctl shuffle)
    elif [ "$PLAYER" = "firefox" ]; then
        ICON=""
        TRACK=$(playerctl metadata title)
        STATUS=$(playerctl metadata -f '{{ status }}')
    elif [ "$PLAYER" = "edge" ]; then
        ICON=""
        TRACK=$(playerctl metadata title)
        STATUS=$(playerctl metadata -f '{{ status }}')
    fi

    if [ "$PLAYER" != "No players found" ]; then
        if [ "$IDENTIFIER" = "unicode" ]; then
            if [ ${#TRACK} -gt 18 ]; then
                CUTSYM=" "
            else
                CUTSYM=""
            fi

            if [ "$STATUS" = "Playing" ]; then
                STATUS=""
            else
                STATUS=""
            fi

            if [ "$SHUFFLE" = "On" ]; then
                SHUFFLE=" "
            else
                SHUFFLE=""
            fi
        else
            ICON=""
            if [ "${#TRACK}" -gt 18 ]; then
                CUTSYM=".."
            else
                CUTSYM=""
            fi

            if [ "$STATUS" = "Playing" ]; then
                STATUS="PLA"
            else
                STATUS="PAU"
            fi

            if [ "$SHUFFLE" = "On" ]; then
                SHUFFLE=" S"
            else
                SHUFFLE=""
            fi
        fi

        if [ "$PLAYER" = "spotify" ]; then
            printf "%s%s %s %s : %s%s" "$SEP1" "$ICON" "$STATUS" "$ARTIST" "${TRACK:0:18}" "$CUTSYM"
            printf "%s\n" "$SEP2"
        elif [ "$PLAYER" = "spotifyd" ]; then
            printf "%s%s %s %s : %s%s" "$SEP1" "$ICON" "$STATUS" "$ARTIST" "${TRACK:0:18}" "$CUTSYM"
            printf " %0d:%02d/" $((POSITION%3600/60)) $((POSITION%60))
            printf "%0d:%02d" $((DURATION%3600/60)) $((DURATION%60))
            printf "%s%s\n" "$SHUFFLE" "$SEP2"
        elif [ "$PLAYER" = "firefox" ]; then
            printf "%s%s %s %s%s" "$SEP1" "$ICON" "$STATUS" "${TRACK:0:18}" "$CUTSYM"
            printf "%s\n" "$SEP2"
        elif [ "$PLAYER" = "edge" ]; then
            printf "%s%s %s %s%s" "$SEP1" "$ICON" "$STATUS" "${TRACK:0:18}" "$CUTSYM"
            printf "%s\n" "$SEP2"
        fi
    fi
}

dwm_playerctl
