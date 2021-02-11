pids=$(ls /proc | grep [0-9])

for PID in $pids; do
    if [ -z $(readlink -f /proc/${PID}/exe) ]
    then
        echo -e "\n${PID}\t\t no exec"
    else
        echo -e "\n${PID}\t\t $(readlink -f /proc/${PID}/exe)"
    fi
    echo "opened files:"
    ls -l /proc/${PID}/fd
done