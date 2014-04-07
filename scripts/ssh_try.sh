#!/bin/sh
WAIT_TIME=5
while [ true ]; do 
  ssh "$@"
  echo "Waiting $WAIT_TIME seconds..."
  sleep $WAIT_TIME
done
