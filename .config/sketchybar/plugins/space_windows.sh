#!/bin/bash

FOCUSED=$(aerospace list-workspaces --focused 2>/dev/null)

for sid in $(aerospace list-workspaces --all); do
  APPS=$(aerospace list-windows --workspace "$sid" --format '%{app-name}' 2>/dev/null)

  if [ -z "$APPS" ]; then
    ICON_STRIP=""
  else
    ICON_STRIP=""
    while IFS= read -r app; do
      ICON_STRIP+=" $("$HOME/.config/sketchybar/plugins/icon_map.sh" "$app")"
    done <<< "$APPS"
  fi

  if [ "$sid" = "$FOCUSED" ]; then
    sketchybar --animate tanh 20 --set space.$sid background.drawing=on \
                                                   icon.highlight=true  \
                                                   label="$ICON_STRIP"  \
               --animate tanh 20 --set space.$sid label.width=0
  else
    sketchybar --animate tanh 20 --set space.$sid background.drawing=off \
                                                   icon.highlight=false  \
                                                   label="$ICON_STRIP"  \
                                                   label.drawing=on     \
               --animate tanh 20 --set space.$sid label.width=dynamic
  fi
done
