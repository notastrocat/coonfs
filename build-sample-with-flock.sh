#!/bin/bash

SDK_DIR="/path/to/sdk"    # change this line to your SDK path.
LOCKFILE="$SDK_DIR/../.lockfile"    # it would be a better idea to keep the lockfile outside the actualy SDK since SDK contents may need to be cleared while updating. But, make sure to keep the lockfile in a shared filesystem since it's a kernel-level mechanism & all processes needs to be accessing the same inode, otherwise locking breaks and this would be of no use.

if [[ ! -f $LOCKFILE ]]; then
  touch $LOCKFILE
fi

# Open file descriptor 200 for the lockfile
exec 200>"$LOCKFILE"

if [[ $1 == "rebuild" ]]; then
  echo "[Update $$] Trying to acquire exclusive SDK lock..."
  # Acquire exclusive lock, wait if needed
  flock -x 200
  echo "[Update $$] Lock acquired! Starting update..."
  sleep 60    # pretend the update takes 60 seconds
  echo "[Update $$] Update finished. Releasing lock..."
else
  echo "[Build $$] Trying to acquire shared SDK lock..."
  flock -s 200
  echo "[Build $$] Lock acquired! Starting build..."
  sleep 30    # pretend the build takes 30 seconds
  echo "[Build $$] Build finished. Releasing lock..."
fi

