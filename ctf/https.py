#!/usr/bin/env python2

import urllib2

url = "https://lallalalal/index.php" 
header = {}

# Setup Proxy (Brup) for better debugging
proxy = urllib2.ProxyHandler({'https': '127.0.0.1:8080'})
opener = urllib2.build_opener(proxy)
urllib2.install_opener(opener)

# Get request to get the cookie
req = urllib2.Request(url)
header['cookie'] = urllib2.urlopen(req).info().dict['set-cookie']

# Send POST request
req = urllib2.Request(url, data="flag=1&captcha=%d"%(solution), headers=header)
cont = urllib2.urlopen(req).read()
print cont
