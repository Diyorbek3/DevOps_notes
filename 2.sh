
#!/bin/bash
SRC="/data"
DEST="/backup"
LOG="backup.log"
[ -d "$SRC" ] || exit 1
[ -w "$DEST" ] || { echo "No write permission"; exit 2; }
tar -czf "$DEST/backup.tar.gz" "$SRC" && echo "Success" >> $LOG || echo "Fail" >> $LOG
