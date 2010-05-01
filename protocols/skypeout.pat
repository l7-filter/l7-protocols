# Skype to phone - UDP voice call (http://skype.com/)
# Pattern Quality : ok fast undermatch

# Thanks to Myles Uyema, mylesuyema AT gmail.com

# Taken using Ethereal traces of Windows Skype v1.2.037
# Protocol changes in Skype likely made first pattern obsolete
#
# It's much easier to match Skype by UDP port number -- it will attempt
# to use the same UDP port for all its connections as configured in its options.
#
# Skype doesn't necessarily start with the same byte pattern, we can no
# longer use the carat character to optimize matching.
#
#SkypeOut <USA phone number>
#c6 5c bf 41 8e 8d d6 d2 08
#c6 5c bf 41 8e 8d d6 d2 08
#00 6b 2c f5 87 f1 06
#00 6b 2c f5 87 f1 06
#00 6b 2c f5 36 ea 85
#00 6b 2c f5 36 ea 85
#00 6b 2c f5 57 27 d4
#00 6b 2c f5 57 27 d4
#00 6b 2c f5 43 5b 00
#00 6b 2c f5 43 5b 00
#
#Skypeout <USA phone number>
#7e 4f e5 b8
#7e 4f e5 b8
#00 6b 88 61 80 52 93
#00 6b 88 61 80 52 93
#00 6b 88 61 1a 09 e9
#00 6b 88 61 1a 09 e9
#00 6b 88 61 47 43 c4
#00 6b 88 61 47 43 c4

skypeout
\x6b.....\x6b.....\x6b.....\x6b.....\x6b.....\x6b.....$


# old pattern:
#^..\x0d\x6b..\x0d\x6b..\x0d\x6b$|..\x0d\x01..\x0d\x01$
