#!/system/bin/sh

FLAG="/sdcard/.ss"
MODDIR="/data/adb/modules/Three-Finger-Screenshot"
LOGDIR="/data/adb/Three-Finger-Screenshot"
LOGFILE="$LOGDIR/log.txt"
OUTPUT="$MODDIR/output.log"
MODULEPROP="$MODDIR/module.prop"
SERVICE="$MODDIR/service.sh"
TOAST="am start -a android.intent.action.MAIN -e meowna"

mkdir -p "$LOGDIR"

update_description() {
  sed -i "s/^description=.*/description=𝙎𝙩𝙖𝙩𝙪𝙨: $1 || Take screenshots using three-finger gesture/" "$MODULEPROP"
}

if [ -f "$FLAG" ]; then
  rm -f "$FLAG"
  update_description "❌"
#  echo "3 Finger Gesture disabled at $(date)" >> "$LOGFILE"
  $TOAST "3 Finger Gesture disabled" -n popup.generator/meow.dump.MainActivity >/dev/null 2>&1
  cp "$LOGFILE" "$OUTPUT"
else
  touch "$FLAG"
  update_description "✅"
  echo "Gesture enabled at $(date)" >> "$LOGFILE"
  cp "$LOGFILE" "$OUTPUT"
  $TOAST "3 Finger Gesture enabled" -n popup.generator/meow.dump.MainActivity >/dev/null 2>&1
  sh "$SERVICE" &
fi

# Randomize banner
RANDOM_NUM=$(( (RANDOM % 13) + 1 ))
sed -i "s|^banner=.*|banner=https://raw.githubusercontent.com/MeowDump/MeowDump/refs/heads/main/Banner/mona$RANDOM_NUM.png|" "$MODDIR/module.prop"

exit 0