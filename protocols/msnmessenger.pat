# MSN Messenger - Microsoft Network chat client
# Pattern quality: good veryfast
# Protocol groups: proprietary chat
#
# Usually uses port 1863
# http://www.hypothetic.org/docs/msn/index.php
#
# This pattern has been tested and is believed to work well.
#
# To get or provide more information about this protocol and/or pattern:
# http://www.protocolinfo.org/wiki/MSN_Messenger
# http://lists.sourceforge.net/lists/listinfo/l7-filter-developers

msnmessenger
# ver: allow versions up to 99.
# usr (in case ver didn't work):  
^(ver [0-9]+ msnp[1-9][0-9]? [\x09-\x0d -~]*cvr|usr md5 i [ -~]*)
