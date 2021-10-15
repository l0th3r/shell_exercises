#!/usr/bin/bash

while [ `ls Godot 2> /dev/null | wc -l` -eq 0 ]
do
    echo "Waiting for Godot..."
    sleep 1
done