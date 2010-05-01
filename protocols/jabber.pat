# Jabber - an open instant messenger protocol - http://jabber.org
# Pattern quality: marginal
#
# This pattern has been lightly tested.  It is only tested with
# non-SSL mode Jabber with no proxies.  If it does not
# work for you, or you believe it could be improved, please post to 
# l7-filter-developers@lists.sf.net .  This list may be subscribed to at
# http://lists.sourceforge.net/lists/listinfo/l7-filter-developers

# This pattern is based totally on looking at packet dumps.  It may not 
# always work!

# Jabber seems to take a long time to set up a connection.  I'm
# connecting with Gabber 0.8.8 to 12jabber.org and the first 8 packets
# is this:
# <stream:stream to='12jabber.com' xmlns='jabber:client'
# xmlns:stream='http://etherx.jabber.org/streams'><?xml
# version='1.0'?><stream:stream
# xmlns:stream='http://etherx.jabber.org/streams' id='3f73e951'
# xmlns='jabber:client' from='12jabber.com'>
#
# No mention of my username or password yet, you'll note.

jabber
<stream:stream [ -~]* xmlns=('|")jabber.*><\?xml
