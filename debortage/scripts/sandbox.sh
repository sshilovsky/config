#!/bin/bash

# TODO update, pack/unpack debootstrap dir
# currently just chroot

# debootstrap --arch amd64 wheezy "${DIR}"
# # do aptitude install zsh locales
# # do dpkg-reconfigure locales
# # copy .zshrc
# cp -Lr /usr/share/terminfo/* "${DIR}/usr/share/terminfo"

DIR="$(readlink -f $(dirname $0)/../sandbox)"

umount "${DIR}/dev" -l 2>/dev/null
umount "${DIR}/proc" 2>/dev/null
umount "${DIR}/var/cache/apt/archives" 2>/dev/null
umount "${DIR}/root/" 2>/dev/null

mount -o bind /dev "${DIR}/dev"
mount -o bind /proc "${DIR}/proc"
mount -o bind /var/cache/apt/archives/ "${DIR}/var/cache/apt/archives"
mount -o bind "${DIR}/../" "${DIR}/root/"
cp -L /etc/resolv.conf "${DIR}/etc/resolv.conf"

chroot "${DIR}" /bin/sh -c 'cd /root && exec zsh'

umount "${DIR}/dev" -l
umount "${DIR}/proc"
umount "${DIR}/var/cache/apt/archives"
umount "${DIR}/root/"
