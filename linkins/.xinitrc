
LOCK_TIMEOUT=1000

if [ -f ${HOME}/.Xresources ] 
    then
    xrdb -merge ${HOME}/.Xresources
fi

setxkbmap gb &
exec slstatus &
if [ -e ${HOME}/.wallpaper/setup.sh ]
then
    exec ${HOME}/.wallpaper/setup.sh &
fi

exec dwm
#exec $HOME/dev/ps-tinywm/tinywm
