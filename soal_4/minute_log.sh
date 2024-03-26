#!/bin/sh

#* * * * * minute_log.sh
target_path=$(

timestamp=$(date '+%Y%m%d%H%M%S')
echo mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size >> log/metrics_$timestamp.log

mem=$(free -m | grep Mem | awk '{print $2,",",$3,",",$4,",",$5,",",$6,",",$7}')
swap=$(free -m | grep Swap | awk '{print $2,",",$3,",",$4}')
path=$(du -sh ~ | awk '{print $2,",",$1}')

echo $mem,$swap,$dat3 >> log/metrics_$timestamp.log

chmod 600 /home/tarisa/log/metrics_$timestamp.log
