ganglia-xfs-frag
================
Shell script for collecting fragmentation stats for mounted XFS filesystems using Ganglia.

This script is intended to run from the crontab as root so it  can periodically collect filesystem fragmentation stats. Root access is required as `xfs_db` would require read only access to the block devices of the mounted filesystems. For scheduling script execution each 10 minutes run
`crontab -e`
as root and add this line:

`*/10 * * * * /path/to/gmetric_xfs.sh`
