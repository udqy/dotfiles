#!/bin/bash
set -e
xset s off dpms 0 10 0
i3lock --image=/home/udayjdv/pictures/ab2.png --ignore-empty-password --show-failed-attempts --nofork
xset s off -dpms
mpv --volume=80 ~/Music/singles/nothing.mp3 &
