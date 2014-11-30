#!/usr/bin/env python2

import urllib2
import re


url = "https://c.iceqll.eu/rkz/scoreboard/code.php?p=chal&id=6"
header = {"Cookie": "PHPSESSID=7qf5shhtn9na34gpbnouie7aj3"}

# Setup Proxy (Brup) for better debugging
proxy = urllib2.ProxyHandler({'https': '127.0.0.1:8080'})
opener = urllib2.build_opener(proxy)
urllib2.install_opener(opener)


for a in range(0,16):
    for b in range(0,16):
        flag = "%xb%x3bb"%(a,b)
        print flag
        # Send POST request
        #req = urllib2.Request(url, data="flag=%s"%(flag), headers=header)
        #cont = urllib2.urlopen(req).read()
        #m = re.search(r'Inkorrekte Flag', cont)
        #if m:
        #    print m.group()
        #else:
        #    print cont
