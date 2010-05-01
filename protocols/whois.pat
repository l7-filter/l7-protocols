# Whois - query/response system, usually used for domain name info - RFC 3912
# Pattern quality: good fast overmatch
# Protocol groups: ietf_draft_standard networking
#
# Usually runs on TCP port 43
# 
# This pattern has been tested and is believed to work well.
#
# To get or provide more information about this protocol and/or pattern:
# http://www.protocolinfo.org/wiki/Whois
# http://lists.sourceforge.net/lists/listinfo/l7-filter-developers

whois
# Matches the query.  Assumes only that it is printable ASCII without wierd
# whitespace.
^[ !-~]+\x0d\x0a$
