#!/bin/bash
#0 * * * * aggregate_minutes_to_hourly_log.sh

timestamp=$(date '+%Y%m%d%H')
hourago=$(date '+%Y%m%d%H' -d "1 hour ago")
echo "type,mem_count,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_count,swap_used,swap_free,path,path_size" >> log/metrics_agg_$timestamp.log

#calculate max, min, and avg values
awk -F ',' 'BEGIN {
        for (i = 0; i <å 11; i++) {
            min[i] = 999999
            max[i] = 0
            avg[i] = 0
        }
        count=0
        path = ""
        typeavg=""
        typemin=""
        typemax=""
    } 
NR%2 == 0 {
        for (i = 1; i <= 11; i++) {
            path = $10
            value = $i
            if (i != 10) {
                if (i == 11) {
                    type = substr($i,length($i))
                    if (type == "K") {
                        avg[i-1] += $i * 1024
                        value = $i * 1024
                    } else if (type == "M") {
                        avg[i-1] += $i * 1024 * 1024
                        value = $i * 1024 * 1024
                    }
                } else {
                    avg[i-1] += $i
                }
                if (value < min[i-1]) {
                    min[i-1] = value
                }
                if (value > max[i-1]) {
                    max[i-1] = value
                }
            }
            count++
        }
    } END {
        for (i = 0; i < 11; i++) {
            avg[i] = avg[i]/count
            if (i == 10) {
                if (avg[i]/1024 > 1) {
                    typeavg = "K"
                    avg[i] = avg[i]/1024
                    if (avg[i]/1024 > 1) {
                        typeavg = "M"
                        avg[i] = avg[i]/1024
                    }
                }
                if (min[i]/1024 > 1) {
                    typemin="K"
                    min[i] = min[i]/1024
                    if (min[i]/1024 > 1) {
                        typemin = "M"
                        min[i] = min[i]/1024
                    }
                }
                if (max[i]/1024 > 1) {
                    typemax="K"
                    max[i] = max[i]/1024
                    if (max[i]/1024 > 1) {
                        typemax = "M"
                        max[i] = max[i]/1024
                    }
                }
            }
        }
        printf("minimum,%d,%d,%d,%d,%d,%d,%d,%d,%d,%s,%d,%s\n", 
            min[0], min[1], min[2], min[3], min[4], min[5], min[6], min[7], min[8], path, min[10],typemin);
        printf("maximum,%d,%d,%d,%d,%d,%d,%d,%d,%d,%s,%d,%s\n", 
            max[0], max[1], max[2], max[3], max[4], max[5], max[6], max[7], max[8], path, max[10],typemax);
        printf("average,%.1f,%.1f,%.1f,%.1f,%.1f,%.1f,%.1f,%.1f,%.1f,%s,%.1f,%s\n", 
            avg[0], avg[1], avg[2], avg[3], avg[4], avg[5], avg[6], avg[7], avg[8], path, avg[10],typeavg);
    }' log/metrics_$hourago*.log >> log/metrics_agg_$timestamp.log
   
chmod 600 log/metrics_agg_$timestamp.log
