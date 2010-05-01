# Executable - Microsoft PE file format.  
# Pattern quality: good fast
# Protocol groups: file
# 
# If this pattern does not
# work for you, or you believe it could be improved, please post to 
# l7-filter-developers@lists.sf.net .  This list may be subscribed to at
# http://lists.sourceforge.net/lists/listinfo/l7-filter-developers

# Thanks to Brandon Enright [bmenrighATucsd.edu]

# This pattern doesn't techincally match the PE file format but rather the
# MZ stub program Microsoft uses for backwards compatibility with DOS.
# That means this will correctly match DOS executables too.

exe
# There are two different stubs used depending on the compiler/packer.
# Numerous NULL bytes have been stripped from this pattern.

# This pattern may be more efficient:
# \x4d\x5a\x90\x03\x04|\x4d\x5a\x50\x02\x04

# This is easier to understand:
\x4d\x5a(\x90\x03|\x50\x02)\x04
