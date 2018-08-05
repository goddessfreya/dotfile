#!/bin/sh

usermodmap=$HOME/.Xmodmap

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi
exec i3
