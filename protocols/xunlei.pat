# Xunlei - Chinese P2P filesharing - http://xunlei.com
# Pattern attributes: good veryfast fast
# Protocol groups: p2p
# Wiki: http://www.protocolinfo.org/wiki/Xunlei
#
# This has been tested by three people.  It definitely catches some
# streams. 
#
# Written by wsgtrsys of www.routerclub.com.  Improved by VeNoMouS.
# Improved more by wsgtrsys and platinum of bbs.chinaunix.net.

xunlei
^[()]...?.?.?(reg|get|query)

# From http://sourceforge.net/tracker/index.php?func=detail&aid=1885209&group_id=80085&atid=558668
# 
##############################################################################
# Date: 2008-02-03
# Sender: hydr0g3n
# 
# Xunlei (Chinese P2P) traffic is not matched anymore by layer7 xunlei
# pattern. It used to work in the past but not anymore. Maybe Xunlei was
# updated and pattern should be adapted?
#
# Apparently ipp2p was edited by Chinese people to detect pplive and xunlei.
# It is interesting and very recent:
# http://www.chinaunix.net/jh/4/914377.html
##############################################################################
# Date: 2008-02-03
# Sender: quadong
# 
# Ok.  Only some of the ipp2p function can be translated into an l7-filter
# regular expression.  The first part of search_xunlei can't be, since it
# works by checking whether the length of the packet matches a byte in the
# packet.  The second part of search_xunlei becomes: 
# 
# \x20.?\x01?.?[\x01\x77]............?.?.?.?\x38
# 
# Or possibly:
# 
# ^\x20.?\x01?.?[\x01\x77]............?.?.?.?\x38
# 
# I'm not sure whether IPP2P looks at every packet or only the first of each
# connection.
# 
# udp_search_xunlei says:
# \x01\x01\x01\xfe\xff\xfe\xff|\x01\x11\xa0\xfe\xff\xfe\xff
# 
# Again, putting a ^ at the beginning might work:
# 
# ^(\x01\x01\x01\xfe\xff\xfe\xff|\x01\x11\xa0\xfe\xff\xfe\xff)
# 
# So this *might* work:
# 
# ^(\x20.?\x01?.?[\x01\x77]............?.?.?.?\x38|\x01\x01\x01\xfe\xff\xfe\xff|\x01\x11\xa0\xfe\xff\xfe\xff)
# 
# but the ^ might be wrong and it will not match the HTTP part of Xunlei. 
##############################################################################
