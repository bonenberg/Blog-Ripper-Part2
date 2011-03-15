import urllib2
import sys
import re
from BeautifulSoup import BeautifulSoup


turl = "file://" + str(sys.argv[1])

toppage = urllib2.urlopen(turl)
soup = BeautifulSoup(toppage)
title = str(soup.title.string)


header = '''
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>%s</title>
<link rel="stylesheet" type="text/css" href="index.css" media="all">
<style>
body { background-color: #ffffff }
</style>
</head>
<body>	  
''' % (title)

footer = '''
</body>
</html>
''' 

# /home/x/test/20140304002511/index.html

center = str(soup.find("td", { "class" : re.compile("contentcell") }))

sys.stdout.write(header+center+footer)

