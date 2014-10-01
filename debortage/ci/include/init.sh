PNVR="$(basename $0 .debuild)"
# TODO revision
PNV="${PNVR}"

PN="$(echo "$PNV"|rev|cut -d- -f2-|rev)"
PV="$(echo "$PNV"|rev|cut -d- -f1|rev)"
PV1="$(echo "$PV"|cut -d. -f1)"
PV12="$(echo "$PV"|cut -d. -f1-2)"

DEBORTAGEDIR="$(readlink -f $(dirname $0)/../..)"
WORKDIR="${DEBORTAGEDIR}/work/${PNVR}"
mkdir -p "${WORKDIR}" && cd "${WORKDIR}" || exit $?

function include {
    local INCLUDEDIR="${DEBORTAGEDIR}/include"

    if [[ "$#" != "1" ]] ; then
        echo "usage: include <argument>" >&2
        exit 1
    fi
    source "${INCLUDEDIR}/$1"
}
