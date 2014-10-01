DOWNLOAD="http://downloads.sourceforge.net/project/${PN}/${PN}/${ARCHIVE}"
ARCHIVEDIR="${WORKDIR}/${DEB_PACKAGE}-${PV}"

function stage_fetch() {
    apt-get source ${DEB_PACKAGE} || exit $?
}

function stage_builddeb {
    cd "${ARCHIVEDIR}" || exit $?
    dpkg-buildpackage -us -uc || exit $?
    cd "${WORKDIR}" || exit $?
    ls
}
