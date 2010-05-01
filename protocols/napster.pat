# Napster - Peer-to-peer file sharing
# Pattern quality: good veryfast
# 
# Should work for any Napster offspring, like OpenNAP.
# (Yes, people still use this!)
# Matches both searches and downloads.
#
# http://opennap.sourceforge.net/napster.txt
#
# This pattern has been tested and is believed to work well.  If it does not
# work for you, or you believe it could be improved, please post to 
# l7-filter-developers@lists.sf.net .  This list may be subscribed to at
# http://lists.sourceforge.net/lists/listinfo/l7-filter-developers

napster
# (client-server: length, assumed to be less than 256, login or new user login, 
# username, password, port, client ID, link-type |
# client-client: 1, firewalled or not, username, filename) 
^(.[\x02\x06][!-~]* [!-~]* [0-9][0-9]?[0-9]?[0-9]?[0-9]? "[\x09-\x0d -~]*" ([0-9]|10)|1(send|get)[!-~]* "[\x09-\x0d -~]*")

