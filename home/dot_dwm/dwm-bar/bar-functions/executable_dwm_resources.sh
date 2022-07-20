#!/bin/sh

# A dwm_bar function to display information regarding system memory, CPU temperature, and storage
# Joe Standring <git@joestandring.com>
# GNU GPLv3

df_check_location='/home'

dwm_resources () {
	# get all the infos first to avoid high resources usage
	#free_output=$(free -h | grep Mem)
	free_output=$(free -h | grep -E -w 'Mem|内存')
	#df_output=$(df -h $df_check_location | tail -n 1)
	sensors_output=$(sensors | grep Package)
	# Used and total memory
	MEMUSED=$(echo $free_output | awk '{print $3}' | tr -cd '[0-9,.,G,M]')
	#MEMTOT=$(echo $free_output | awk '{print $2}')
	# CPU temperature
	CPU=$(top -bn1 | grep Cpu | awk '{print $2}')%
	#CPU=$(sysctl -n hw.sensors.cpu0.temp0 | cut -d. -f1)
	CPUTEMP=$(echo $sensors_output | awk '{print $4}' | tr -cd '[0-9,.]')
	# Used and total storage in /home (rounded to 1024B)
	#STOUSED=$(echo $df_output | awk '{print $3}')
	#STOTOT=$(echo $df_output | awk '{print $2}')

	printf "%s" "$SEP1"
	if [ "$IDENTIFIER" = "unicode" ]; then
		#printf "💻 MEM %s/%s CPU %s STO %s/%s: %s" "$MEMUSED" "$MEMTOT" "$CPU" "$STOUSED" "$STOTOT" "$STOPER"
		#printf "💻MEM%s CPU%s SSD%s" "$MEMUSED" "$CPU" "$STOUSED"
		printf "﬙ %s  %s  %2.0f" "$MEMUSED" "$CPU" "$CPUTEMP"
	else
		#printf "STA | MEM %s/%s CPU %s STO %s/%s: %s" "$MEMUSED" "$MEMTOT" "$CPU" "$STOUSED" "$STOTOT" "$STOPER"
		#printf "MEM-%s CPU-%s SSD-%s" "$MEMUSED" "$CPU" "$STOUSED"
		printf "MEM-%s CPU-%s TMP-%s" "$MEMUSED" "$CPU" "$CPUTEMP"
	fi
	printf "%s\n" "$SEP2"
}

dwm_resources
