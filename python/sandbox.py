import sys
import ctypes

xxx = 666
#print sys.getrefcount(xxx)
#print hex(id(xxx))
print ctypes.c_long.from_address(id(xxx))
