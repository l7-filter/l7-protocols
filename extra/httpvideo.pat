# HTTP - Video over HyperText Transfer Protocol (RFC 2616)
# Pattern quality: good
# Usually runs on port 80
#
# Contributed by Deepak Seshadri <dseshadri@broadbandmaritime.com>
#
# This pattern has been tested and is believed to work well.  If it does not
# work for you, or you believe it could be improved, please post to 
# l7-filter-developers@lists.sf.net .  This list may be subscribed to at
# http://lists.sourceforge.net/lists/listinfo/l7-filter-developers
#
# If you use this, you should be aware that:
#
# - they match both simple downloads of audio/video and streaming content.
#
# - blocking based on content-type encourages server
# writers/administrators to misreport content-type (which will just make
# headaches for everyone, including us), so I would strongly recommend
# shaping audio/video down to a speed that discourages use of streaming
# players without actually blocking it.
#
# - obviously, since this is a subset of HTTP, you need to match it
# earlier in your iptables rules than HTTP.

httpvideo
http/(0\.9|1\.0|1\.1)[1-5][0-9][0-9][\x09-\x0d -~]*(content-type: video)

