# Bearshare - a Gnutella client (use gnutella pattern)
# Pattern quality: poor
# 
# Please post to l7-filter-developers@lists.sf.net if you can help
# improve this pattern.  You may subscribe at 
# http://lists.sourceforge.net/lists/listinfo/l7-filter-developers

bearshare
# This is the pattern used by www.bandwidtharbitrator.com
# It has NOT been verified and is furthermore far too permissive, as it 
# matches _any_ stream with the word "bear" in it (or the string "nldu").
# However, the "z9.*u>p" branch has potential, so I'm including it alone.  
# Can anyone explain what it is and say whether it alone is sufficient to 
# match Bearshare?

# bear|nldu|z9.*u>p

z9.*u>p
