#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
#. /etc/X11/Xsession

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Keyboard layout 
#setxbmap -option 'grp:alt_shift_toggle' -layout us,ua 

# Compositor
picom -f &

# Execute
exec dunst

#
export PATH=$PATH:$HOME/.local/bin
#export PATH="$HOME/.local/bin:$PATH"

# The code belou will stop me from using computer after 23:00 to 5:00
#shutdown -P 23:00 &
#time=$(date '+%H')
#if 
#[ "$time" -gt 22 ] || [ "$time" -lt ];
#then shutdown -P now
#fi

# Execute i3wm
exec i3
