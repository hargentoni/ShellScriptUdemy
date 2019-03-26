#!/bin/bash

x=1
until  ps -aux |grep firefox |grep -v grep > /dev/null
do
	echo "Inicie o Firefox"
	sleep 3
	echo
done
echo "Firefox Iniciado."
echo "PID: $(pgrep firefox)"
