# script for displaying temp in sway bar cfg
# add path to script under status command
# requires bc for calculation to work!

#!/bin/bash
while true; do
    # Replace 'thermal_zone0' with your specific thermal zone if needed
    temp=$(cat /sys/class/thermal/thermal_zone0/temp)
    # Convert to Celsius
    temp_c=$(echo "scale=1; $temp / 1000" | bc)
    echo "Temperature: $temp_c °C"
    sleep 5  # Update every 5 seconds
done
