#!/bin/bash

DOWNDIR="/config/Downloads"
RUNFILE="Cubbit-7.2.2.AppImage"

/usr/bin/pulseaudio --start
/usr/bin/startxfce4 > /dev/null 2>&1

if [ mv /$RUNFILE $DOWNDIR/$RUNFILE ] ; then
  $DOWNDIR/$RUNFILE --appimage-extract-and-run &
else
  wget "https://get.cubbit.io/desktop/linux/$RUNFILE" -O "$DOWNDIR/$RUNFILE"
  $DOWNDIR/$RUNFILE --appimage-extract-and-run &
fi
