# Subversion - a version control system
# Pattern quality: ok veryfast
# Protocol groups: version_control
#
# This pattern is UNTESTED.  (But it seems straightforward enough...)
#
# Subversion uses TCP port 3690 by default.
#
# To get or provide more information about this protocol and/or pattern:
# http://www.protocolinfo.org/wiki/Subversion
# http://lists.sourceforge.net/lists/listinfo/l7-filter-developers

subversion
^\( success \( 1 2 \(
