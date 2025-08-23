#!/system/bin/sh

FLAG="/sdcard/.ss"
LOGDIR="/data/adb/Three-Finger-Screenshot"
SSDIR="/sdcard/Pictures/Screenshots"
LOGFILE="$LOGDIR/log.txt"
DEBOUNCE_FILE="$LOGDIR/.cooldown"
COOLDOWN=3  # seconds between screenshots

mkdir -p "$LOGDIR" "$SSDIR"

# Pop-up function 
popup() {
    am start -a android.intent.action.MAIN -e meowna "$@" -n popup.generator/meow.dump.MainActivity > /dev/null
    sleep 0.5
}

# Exit if disabled
[ -f "$FLAG" ] || exit 0

echo "Service started at $(date)" >> "$LOGFILE"

DEVICE=$(getevent -lp 2>/dev/null | awk '
  BEGIN { dev="" }
/add device/ { dev=$NF }
/ABS_MT_POSITION_X/ { print dev; exit }
')

[ -z "$DEVICE" ] || [ ! -e "$DEVICE" ] && {
  echo "Touch input device not found at $(date)" >> "$LOGFILE"
  exit 1
}

touches=0
reset() { touches=0; }

getevent -lt "$DEVICE" | while read -r line; do
  [ -f "$FLAG" ] || {
    echo "Gesture disabled, quitting at $(date)" >> "$LOGFILE"
    exit 0
  }

  if echo "$line" | grep -q "ABS_MT_TRACKING_ID"; then
    if echo "$line" | grep -q "ffffffff"; then
      touches=$((touches - 1))
    else
      touches=$((touches + 1))
    fi

    [ "$touches" -lt 0 ] && touches=0

    if [ "$touches" -ge 3 ]; then
      reset

      # Cooldown check
      NOW=$(date +%s)
      if [ -f "$DEBOUNCE_FILE" ]; then
        LAST=$(cat "$DEBOUNCE_FILE")
        [ $((NOW - LAST)) -lt "$COOLDOWN" ] && continue
      fi
      echo "$NOW" > "$DEBOUNCE_FILE"

      TIMESTAMP=$(date "+%d-%m-%Y-%H-%M-%S")
      FILENAME="Screenshot_${TIMESTAMP}.png"
      FILEPATH="${SSDIR}/${FILENAME}"

      screencap -p "$FILEPATH"
      chmod 0644 "$FILEPATH"
      am broadcast -a android.intent.action.MEDIA_SCANNER_SCAN_FILE -d "file://$FILEPATH" >/dev/null

      echo "📸 $FILENAME" >> "$LOGFILE"
      popup "Screenshot captured"
    fi
  fi
done