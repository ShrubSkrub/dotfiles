#!/bin/bash

echo "Killing most of chrome os! Who needs it anyway?"
ps ax -o sess,pgrp,pid,cmd | awk '$4 ~ /\/chrome$/ { print $3 }' | xargs $nodo kill
echo "Chrome OS has been vanquished!"


