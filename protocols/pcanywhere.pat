# pcAnywhere - Symantec remote access program
# Pattern quality: marginal veryfast
# Protocol groups: 

# This is completely untested!

# See http://www.unixwiz.net/tools/pcascan.txt

# To get or provide more information about this protocol and/or pattern:
# http://www.protocolinfo.org/wiki/PcAnywhere
# http://lists.sourceforge.net/lists/listinfo/l7-filter-developers

pcanywhere
# I think this only matches queries and not the bulk of the traffic!
^(nq|st)$
