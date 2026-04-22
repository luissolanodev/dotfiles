#!/bin/bash

SID=$1

# Only handle highlight state — label animations handled by space_windows.sh
if [ "$SID" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --animate tanh 20 --set $NAME background.drawing=on \
                                            icon.highlight=true
else
  sketchybar --animate tanh 20 --set $NAME background.drawing=off \
                                            icon.highlight=false
fi
