# Biff - new mail notification 
# Pattern quality: good veryfast undermatch overmatch
# Protocol groups: mail
#
# Usually runs on port 512
#
# To get or provide more information about this protocol and/or pattern:
# http://www.protocolinfo.org/wiki/Biff
# http://lists.sourceforge.net/lists/listinfo/l7-filter-developers


biff
# This is a rare case where we will specify a $ (end of line), since
# this is the entirety of the communication.
# something that looks like a username, an @, a number.
# won't catch usernames that have strange characters in them.
^[a-z][a-z0-9]+@[1-9][0-9]+$
