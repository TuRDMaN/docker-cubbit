#!/bin/bash

DOWNDIR="/config/Downloads"
RUNFILE="Cubbit-7.2.2.AppImage"
RUNCMD="$DOWNDIR/$RUNFILE --appimage-extract-and-run &"

/usr/bin/pulseaudio --start
/usr/bin/startxfce4 > /dev/null 2>&1

if [ $DOWNDIR/$RUNFILE ] ; then
  /bin/bash -c "$RUNCMD"
else
  if [ mv /$RUNFILE $DOWNDIR/$RUNFILE ] ; then
    /bin/bash -c "$RUNCMD"
  else
    wget "https://get.cubbit.io/desktop/linux/$RUNFILE" -O "$DOWNDIR/$RUNFILE"
    /bin/bash -c "$RUNCMD"
  fi  
fi
