# Flash - Macromedia Flash.  
# Pattern quality: good veryfast
# Protocol groups: file
# 
# To discuss this pattern:
# http://lists.sourceforge.net/lists/listinfo/l7-filter-developers

# Thanks to Brandon Enright {bmenrigh AT ucsd.edu}

# Macromedia spec:
# http://download.macromedia.com/pub/flash/flash_file_format_specification.pdf

flash
# As of flash 6 SWF files can be compressed.  Flash 8 will be out soon
# (end of 2005?) so this pattern prepares for that.  It assumes that 
# no major changes will be made to the format.
^[FC]WS[\x01-\x08]
