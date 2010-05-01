# Quicktime HTTP 
# Pattern quality: good
#
# This pattern has been tested and is believed to work well.  
# (Quick Time v6.5.1 downloading from www.apple.com/trailers) If it does not
# work for you, or you believe it could be improved, please post to 
# l7-filter-developers@lists.sf.net .  This list may be subscribed to at
# http://lists.sourceforge.net/lists/listinfo/l7-filter-developers
#
# Since this is a subset of HTTP, it should be put earlier in the packet
# filtering chain than HTTP.  Also, please don't use this to block Quicktime.
# If you must do that, you should use a filtering HTTP proxy, which is probably
# more accurate.

quicktime
user-agent: quicktime \(qtver=[0-9].[0-9].[0-9];os=[\x09-\0d -~]+\)\x0d\x0a

