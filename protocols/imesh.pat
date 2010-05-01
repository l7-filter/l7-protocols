# iMesh - a P2P application
# Pattern quality: ok fast
# Pattern groups: p2p
#
# depending on the version of iMesh (the program), it can also use fasttrack,
# gnutella and edonkey in addition to iMesh (the protocol).

imesh
# The first branch matches the login
# The second branch matches the main non-download connection (searches, etc)
# The third branch matches downloads of "premium" content
# The fourth branch matches peer downloads.
^(post[\x09-\x0d -~]*<PasswordHash>................................</PasswordHash><ClientVer>|\x34\x80?\x0d?\xfc\xff\x04|get[\x09-\x0d -~]*Host: imsh\.download-prod\.musicnet\.com|\x02(\x01|\x02)\x83.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?\x02(\x01|\x02)\x83)
