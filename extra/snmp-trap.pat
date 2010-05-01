# SNMP Traps - Simple Network Management Protocol (RFC1157)
# Pattern quality: good veryfast
# Usually runs on UDP ports 162
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

# SNMPv1 Trap
# matches SNMP trap header
#         version             \x02\x01
#         community string    \x04.+ 
#         PDU type            \xa4   (TRAP)
#         enterprise          \x06.+
#         agent  address      \x40\x04\.?.?.?.?
#         trap type           \x02\x01.?
#         specific trap type  \x02\x01.?
#         timestamp           \x43       
snmp-trap
^\x02\x01\x04.+\xa4\x06.+\x40\x04.?.?.?.?\x02\x01.?\x02\x01.?\x43
