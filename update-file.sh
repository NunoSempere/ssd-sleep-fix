#!/bin/bash

while true; do
    echo "Last update: $(date)" > /var/tmp/ssd-activity.txt
    /usr/bin/sync 
    sleep 2
done
