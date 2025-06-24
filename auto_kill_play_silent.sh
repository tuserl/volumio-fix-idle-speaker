cript to auto grep and kill the play_silent.sh process

# Get the PID of the play_silent.sh process
PID=$(pgrep -f play_silent.sh)

# Check if the process is running
if [ -n "$PID" ]; then
    echo "Process 'play_silent.sh' found with PID: $PID"
    echo "Terminating process..."
    
    # Kill the process
    kill $PID

    # Check if the kill command was successful
    if [ $? -eq 0 ]; then
        echo "Process 'play_silent.sh' terminated successfully."
    else
        echo "Failed to terminate the process."
    fi
else
    echo "No 'play_silent.sh' process found."
fi
