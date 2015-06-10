#!/bin/sh

iter=0
wait_time=1
cmd=$@

#cmd=$2 || "make test"
while true
do
    iter=$[iter+1]
    OUTPUT=$($cmd 2>&1) # >> /dev/null
    clear
    echo "FOREVER! Iteration: $iter"
    echo "========================"
    echo "${OUTPUT}"
    sleep $wait_time
done
