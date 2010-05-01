# (Simple) Network Time Protocol - RFC 1305, 2030
# Pattern quality: ok veryfast overmatch 
#
# If this does not work for you, or you believe it could be improved,
# please post to l7-filter-developers@lists.sf.net .  Subscribe at
# http://lists.sourceforge.net/lists/listinfo/l7-filter-developers

# client|server
# require the server's timestamp to be in the present or future (of 2005).
# Assumes version 4.
# Tested with ntpdate on Linux.
ntp
^([\x23\xe3]|\$.......?.?.?.?.?.?.?.?.?[\xc6-\xff])
