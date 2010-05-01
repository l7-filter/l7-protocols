# Ares - A P2P program - http://www.aresgalaxy.org/
# Pattern quality: undermatch good

# This pattern catches only client-server connect messages.  This is
# sufficient for blocking, but not for shaping, since it doesn't catch 
# the actual file transfers (?). :-(

# Pattern by Brandon Enright <bmenrigh at the server known as ucsd.edu>

# This pattern has been tested.  If it does not work for you as
# advertised, or you believe it could be improved, please post to
# l7-filter-developers@lists.sf.net .  This list may be subscribed to at
# http://lists.sourceforge.net/lists/listinfo/l7-filter-developers

ares
^\x03\x5a.?.?\x05\x8d\x38

