#!/bin/bash

GMETRIC=/usr/bin/gmetric
XFSDB_BIN=/usr/sbin/xfs_db

for dev in `awk '$3=="xfs" { print $1 }' /proc/mounts`
do
        FRAG=$(${XFSDB_BIN} -r -c frag $dev | awk '{print $8}' | cut -f1 -d"." | sed 's/,/\./' | sed 's/%//' )
        dev=`basename $dev`
        # echo "${dev}_frag: $FRAG"
        $GMETRIC --type=float --name="${dev}_frag" --units="%" --value="${FRAG}" --group="fragmentation"
done

