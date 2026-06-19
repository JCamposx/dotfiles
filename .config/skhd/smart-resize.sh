#!/usr/bin/env bash
# smart-resize.sh <direction> [step]
# Resizes the focused window by moving its shared (inner) edge.
# Direction is context-aware: the edge that moves depends on which
# half of the display the window occupies.

DIR=$1
STEP=${2:-20}

WIN=$(yabai -m query --windows --window)
DISP=$(yabai -m query --displays --display)

WIN_X=$(echo "$WIN"  | jq '.frame.x')
WIN_Y=$(echo "$WIN"  | jq '.frame.y')
WIN_W=$(echo "$WIN"  | jq '.frame.w')
WIN_H=$(echo "$WIN"  | jq '.frame.h')

DISP_X=$(echo "$DISP" | jq '.frame.x')
DISP_Y=$(echo "$DISP" | jq '.frame.y')
DISP_W=$(echo "$DISP" | jq '.frame.w')
DISP_H=$(echo "$DISP" | jq '.frame.h')

WIN_CX=$(echo "$WIN_X $WIN_W"   | awk '{printf "%d", $1 + $2/2}')
WIN_CY=$(echo "$WIN_Y $WIN_H"   | awk '{printf "%d", $1 + $2/2}')
DISP_MX=$(echo "$DISP_X $DISP_W" | awk '{printf "%d", $1 + $2/2}')
DISP_MY=$(echo "$DISP_Y $DISP_H" | awk '{printf "%d", $1 + $2/2}')

IS_LEFT=0
IS_TOP=0
[ "$WIN_CX" -lt "$DISP_MX" ] && IS_LEFT=1
[ "$WIN_CY" -lt "$DISP_MY" ] && IS_TOP=1

case $DIR in
  h)
    if [ "$IS_LEFT" -eq 1 ]; then
      yabai -m window --resize right:-${STEP}:0   # left-side: shrink from right
    else
      yabai -m window --resize left:-${STEP}:0    # right-side: grow from left
    fi
    ;;
  l)
    if [ "$IS_LEFT" -eq 1 ]; then
      yabai -m window --resize right:+${STEP}:0   # left-side: grow to right
    else
      yabai -m window --resize left:+${STEP}:0    # right-side: shrink from left
    fi
    ;;
  j)
    if [ "$IS_TOP" -eq 1 ]; then
      yabai -m window --resize bottom:0:+${STEP}  # top: grow downward
    else
      yabai -m window --resize top:0:+${STEP}     # bottom: top edge goes lower
    fi
    ;;
  k)
    if [ "$IS_TOP" -eq 1 ]; then
      yabai -m window --resize bottom:0:-${STEP}  # top: shrink from bottom
    else
      yabai -m window --resize top:0:-${STEP}     # bottom: grow upward
    fi
    ;;
esac
