if [ -d ~/.profile.d ]
then
    for i in ~/.profile.d/*
    do
        . $i
    done
    unset i
fi
