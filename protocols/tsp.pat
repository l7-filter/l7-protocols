# TSP - Berkely UNIX Time Synchronization Protocol
# Pattern quality: good veryfast overmatch
# Protocol groups: time_synchronization
#
# http://ftp.svbug.com/ftp/pub/manuals/pdf/smm.22.timed.pdf
# http://docs.freebsd.org/44doc/smm/12.timed/paper.pdf
# 
# This pattern is barely tested.  If it does not
# work for you, or you believe it could be improved, please post to 
# l7-filter-developers@lists.sf.net .  This list may be subscribed to at
# http://lists.sourceforge.net/lists/listinfo/l7-filter-developers

tsp
# type, version (1), sequence number, 8 type specific bytes, machine name
^[\x01-\x13\x16-\x24]\x01.?.?.?.?.?.?.?.?.?.?[ -~]+
