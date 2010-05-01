# HTTP - Proxy Cache hit for HyperText Transfer Protocol (RFC 2616)
# Pattern quality: good
# Usually runs on port 80
#
# Contributed by Francesco Del Degan <fdeldegan@libero.it>
#
# This pattern has been tested and is believed to work well.  If it does not
# work for you, or you believe it could be improved, please post to 
# l7-filter-developers@lists.sf.net .  This list may be subscribed to at
# http://lists.sourceforge.net/lists/listinfo/l7-filter-developers

httpcachehit
http/(0\.9|1\.0|1\.1)[1-5][0-9][0-9][\x09-\x0d -~]*(x-cache: hit)

