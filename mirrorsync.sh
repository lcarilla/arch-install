#!/bin/bash
#your sync home folder
SYNC_HOME="/var/www/vhosts/arch.harald.ga"
#destination of the files you want to sync
SYNC_FILES="$SYNC_HOME/httpdocs"
#rsync lock file - will be removed when finished
SYNC_LOCK="$SYNC_HOME/mirrorsync.lck"
#the repos you want to sync
SYNC_REPO=(core extra community iso)
#the server you want to sync from
SYNC_SERVER=rsync://ftp.halifax.rwth-aachen.de/archlinux/
#maximum bandwidth that should be used when syncing
MAX_BANDWIDTH = 10000
for repo in ${SYNC_REPO[@]}; do
repo=$(echo $repo | tr [:upper:] [:lower:])
echo "syncing $repo -> $SYNC_FILES/$repo"
rsync -rptlv \
        --delete-after --exclude=os/i686 --bwlimit=$MAX_BANDWIDTH\
        --safe-links \
        --max-delete=1000 \
        --copy-links \
        --delay-updates $SYNC_SERVER/$repo "$SYNC_FILES"
sleep 5 
done
rm -f "$SYNC_LOCK"
