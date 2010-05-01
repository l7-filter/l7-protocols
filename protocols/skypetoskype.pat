# Skype to Skype - UDP voice call (program to program) - http://skype.com
# Pattern Quality : marginal veryfast overmatch
# Protocol groups: proprietary voip

# To get or provide more information about this protocol and/or pattern:
# http://www.protocolinfo.org/wiki/Skype
# http://lists.sourceforge.net/lists/listinfo/l7-filter-developers

# Thanks to Myles Uyema, mylesuyema AT gmail.com

skypetoskype
^..\x02

# This might work.  I'm waiting for more information.
#^..\x02..........................

