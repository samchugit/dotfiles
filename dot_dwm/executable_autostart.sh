#!/bin/bash

function run {
    if ! pgrep $1 ; then
        $@&
    fi
}

#run "xautolock -time 10 -corners --00 -detectsleep -locker slock"
run "light-locker"
#run "/usr/lib/polkit-kde-authentication-agent-1"
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
run "picom"
run "dunst"
#run "/usr/lib/xfce4/notifyd/xfce4-notifyd"
run "conky"
run "xfce4-volumed-pulse"
run "xfce4-power-manager"
run "fcitx5"
run "pamac-tray"
run "nm-applet"
run "blueman-applet"
#run "msm_kde_notifier"
run "msm_notifier"
run "uget-gtk"
run "qbittorrent"
run "flameshot"


xmodmap ~/.Xmodmap
#xset dpms 600 600 900
~/.dwm/startdwmbar.sh &
~/.dwm/wallpaper_auto.sh &
