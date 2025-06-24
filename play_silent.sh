
#!/bin/bash

# Path to your audio file
AUDIO_FILE="/home/volumio/mysh/low_tone_quiet_converted.wav"
NOHUP_FILE="/home/volumio/mysh/nohup.out"

# Function to check the status of Volumio
get_volumio_status() {
    # Get the Volumio status using the 'volumio status' command
    # status=$(volumio status | grep '"status"' | awk -F'"' '{print $4}')
    status="pause"
    echo "$status"
}

# Function to handle playing audio
play_audio() {
    truncate -s 0 "$NOHUP_FILE"
    uptime
    aplay -D plughw:5,0 "$AUDIO_FILE"
}

# Infinite loop
while true; do
    # Get the current Volumio status
    status=$(get_volumio_status)

    if [ "$status" = "play" ]; then
        # If Volumio is playing, truncate the out file, echo uptime and status
        truncate -s 0 "$NOHUP_FILE"
        echo "Uptime: $(uptime)"
        echo "Volumio is currently playing."
    elif [ "$status" = "pause" ]; then
        # If Volumio is paused, play the audio file
        play_audio
    elif [ "$status" = "stop" ]; then
        # If Volumio is stopped, play the audio file
        play_audio
    fi
    # Wait for 5 seconds
    sleep 5
done
