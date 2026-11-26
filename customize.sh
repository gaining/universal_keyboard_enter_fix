#!/sbin/sh
ui_print " "
ui_print "Universal Keyboard Enter Fix"
LAYOUT_DIR="/vendor/usr/keylayout"
DEST_DIR="$MODPATH/system/vendor/usr/keylayout"
COUNT=0

[ -d "$LAYOUT_DIR" ] || abort "Cannot find $LAYOUT_DIR"
mkdir -p "$DEST_DIR" || abort "Cannot create module layout directory"

for SRC in "$LAYOUT_DIR"/*.kl; do
  [ -f "$SRC" ] || continue
  if grep -Eq '^[[:space:]]*key[[:space:]]+28[[:space:]]+DPAD_CENTER([[:space:]]|$)' "$SRC"; then
    NAME="${SRC##*/}"
    DEST="$DEST_DIR/$NAME"
    cp "$SRC" "$DEST" || abort "Failed to copy $NAME"
    sed -i -E 's/^([[:space:]]*key[[:space:]]+28[[:space:]]+)DPAD_CENTER([[:space:]]*(#.*)?)$/\1ENTER\2/' "$DEST"
    grep -Eq '^[[:space:]]*key[[:space:]]+28[[:space:]]+ENTER([[:space:]]|$)' "$DEST" || abort "Could not verify change in $NAME"
    set_perm "$DEST" 0 0 0644
    ui_print "- Updated $NAME"
    COUNT=$((COUNT + 1))
  fi
done

[ "$COUNT" -gt 0 ] || abort "No vendor layouts contained key 28 DPAD_CENTER"
ui_print "Updated $COUNT vendor layout(s)."
ui_print "Only keycode 28 mappings were changed."
ui_print "Reboot to activate."
