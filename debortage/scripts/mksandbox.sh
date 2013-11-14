#!/bin/bash

if [ "$1" == "" ]
then
    echo "Usage: $0 <sandbox-dir>" >/dev/stderr
    exit 1
fi

mkdir "$1/var/cache/apt/archives" -p || exit $?

mount -o bind /var/cache/apt/archives "$1/var/cache/apt/archives" || exit $?

debootstrap --arch amd64 wheezy "$1" http://ftp.us.debian.org/debian &&

cp "$(dirname $0)/../etc-apt/sources.list.d/debortage.list" "$1/etc/apt/sources.list.d/" &&

chroot "$1" /bin/bash -c 'aptitude update && aptitude install -y sudo zsh' &&

true

let x=$?

umount "$1/var/cache/apt/archives" || {
    let x=$?
    echo "UNMOUNT FAILED!!!" >/dev/stderr
    exit $x
}

tar cJvpf "$1.tar.xz" "$1" || exit $?

exit $x
