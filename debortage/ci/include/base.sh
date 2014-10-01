# aptitude install build-essential devscripts checkinstall ${BDEPEND} || exit $? # TODO replace -y with installation check
echo "**** PLEASE CHECK THAT THE FOLLOWING PACKAGES ARE INSTALLED: ****\n    "
echo "build-essential; checkinstall; ${BDEPEND}; ${RDEPEND}"
sleep 1s

function stage_fetch {
    #wget -c "${DOWNLOAD}" -O "${ARCHIVE}" || exit $?

    if   [[ "${ARCHIVE}" == *.tar.bz2 ]] ; then UNPACK="j"
    elif [[ "${ARCHIVE}" == *.tbz2 ]] ; then UNPACK="j"
    elif [[ "${ARCHIVE}" == *.tar.gz ]] ; then UNPACK="z"
    elif [[ "${ARCHIVE}" == *.tgz ]] ; then UNPACK="z"
    elif [[ "${ARCHIVE}" == *.tar.xz ]] ; then UNPACK="J"
    elif [[ "${ARCHIVE}" == *.tar ]] ; then UNPACK=""
    else
        echo "Unknown archive format" >/dev/stderr
        exit 1
    fi

    tar "x${UNPACK}f" "${ARCHIVE}" || exit $?
}

function stage_build {
    cd ${ARCHIVEDIR} || exit $?
    ./configure && make || exit $?
    cd ${WORKDIR} || exit $?
}

function stage_makedeb_and_install {
    cd ${ARCHIVEDIR} || exit $?
    DEB_PACKAGE="${DEB_PACKAGE:-${PN}}"
    checkinstall -D -y --fstrans --pkgname "${PN}" --pkgversion "${PV}" \
    --pkglicense "${LICENSE}" --pkgsource "${DOWNLOAD}" --maintainer \
    "${MAINTAINER}" --requires "${RDEPEND}" --nodoc --pakdir \
    "${DEBORTAGEDIR}/debs" || exit $?
    cd ${WORKDIR} || exit $?
}
