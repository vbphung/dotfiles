#!/bin/bash

# CPU
CPU_USAGE=$(top -bn2 -d0.2 | grep '^%Cpu' | tail -n1 | awk '{print $2 + $4 + $6}')
CPU_USAGE=${CPU_USAGE%.*}

# RAM
MEM_TOTAL=$(grep -m1 '^MemTotal' /proc/meminfo | awk '{print $2}')
AVAILABLE=$(grep -m1 '^MemAvailable' /proc/meminfo | awk '{print $2}')
MEM_USAGE=$((100 - AVAILABLE * 100 / MEM_TOTAL))

# Convert KB to GB with decimals
MEM_TOTAL_GB=$(awk "BEGIN {printf \"%.2f\", $MEM_TOTAL / 1024 / 1024}")
AVAILABLE_GB=$(awk "BEGIN {printf \"%.2f\", $AVAILABLE / 1024 / 1024}")
USED_GB=$(awk "BEGIN {printf \"%.2f\", $MEM_TOTAL_GB - $AVAILABLE_GB}")

# Time
TIME=$(date "+%I:%M%p")
DATE=$(date "+%a, %d %b %Y")

# Print
printf "𒁈 %d%% ⛁ %d%% (%.2f/%.2fGB) ⏰ %s 📅 %s\n" \
    $CPU_USAGE $MEM_USAGE $USED_GB $MEM_TOTAL_GB "$TIME" "$DATE"
