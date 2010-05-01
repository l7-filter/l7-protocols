# Ventrilo - VoIP - http://ventrilo.com
# Pattern quality: ok veryfast
# Protocol groups: proprietary voip
#
# See http://www.protocolinfo.org/wiki/Ventrilo for more information.
#
# I have tested this with Ventrilo client 2.3.0 on Windows talking to
# Ventrilo server 2.3.1 (the public version) on Linux.  In this test, I
# tried monkeying around with the server settings to see if I could
# break the pattern, and I couldn't.  However, you can't change the port
# number in the public server.  I didn't actually test it live to make
# absolutely certain that I could use the pattern to limit the bandwidth
# because my ^*&@^# Windows box won't talk to my bridge!
#
# It has also been tested by one other person in an unknown configuration.
# 
# If this pattern does not work for you, or you believe it could be
# improved, please post to l7-filter-developers@lists.sf.net .  This
# list may be subscribed to at
# http://lists.sourceforge.net/lists/listinfo/l7-filter-developers

ventrilo
^..?v\$\xcf

