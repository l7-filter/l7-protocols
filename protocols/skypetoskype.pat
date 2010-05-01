# Skype to Skype - UDP voice call (program to program) - http://skype.com
# Pattern attributes: marginal veryfast overmatch
# Protocol groups: proprietary voip p2p
# Wiki: http://www.protocolinfo.org/wiki/Skype

# Thanks to Myles Uyema, mylesuyema AT gmail.com

skypetoskype
# require at least 16 bytes (my limited tests always get at least 18)
^..\x02.............

