# SNMP Monitoring - Simple Network Management Protocol (RFC1157)
# Pattern quality: good veryfast
# Protocol groups: ietf_internet_standard networking
#
# Usually runs on UDP ports 161
#
# These filters match SNMPv1 packets without fail, and are made
# as specific as possible not to match any ASN.1 encoded protocols.
# However these could still be matched by other protocols that 
# use ASN.1 encoding

# Contributed by Goli SriSairam <goli_sai AT yahoo.com>

# This pattern has been tested and is believe to work well.  If it does not
# work for you, or you believe it could be improved, please post to 
# l7-filter-developers@lists.sf.net .  This list may be subscribed to at
# http://lists.sourceforge.net/lists/listinfo/l7-filter-developers

# SNMPv1 GET/GETNEXT/SET request and response
# matches SNMP header 
#         version             \x02\x01
#         community           \x04.+ 
#         PDU type            [\xa0-\xa3] (GET/GETNEXT/SET/GETRESPONSE)
#         RequestId           \x02[\x01-\x04].?.?.?.?
#         errorStatus         \x02\x01.?
#         errorIndex          \x02\x01.?
#         varbinds start      \x30
snmp-mon
^\x02\x01\x04.+[\xa0-\xa3]\x02[\x01-\x04].?.?.?.?\x02\x01.?\x02\x01.?\x30
