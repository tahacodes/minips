pids=$(ls /proc | grep [0-9])

for PID in $pids; do
    if [ -z $(readlink -f /proc/${PID}/exe) ]
    then
        # echo -e "${PID}\t exec: no exec path"
        continue
    else
        echo -e "${PID}\t exec: $(readlink -f /proc/${PID}/exe)"
    fi
    echo -e "\topened files:"
    fd_FILES=/proc/${PID}/fd/*
    for fd_file in $fd_FILES
    do
        if [[ "$fd_file" = "/proc/${PID}/fd/0" || 
              "$fd_file" = "/proc/${PID}/fd/1" ||
              "$fd_file" = "/proc/${PID}/fd/2" ]]
        then
            continue
        fi
        echo -e "\t\t $(readlink -f $fd_file)"
    done
    echo -e "\n"
done
