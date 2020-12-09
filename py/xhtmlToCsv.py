import sys
import xml.dom.minidom

document = xml.dom.minidom.parse(sys.argv[1])
tableElements = document.getElementsByTagName('table')
for tr in tableElements[0].getElementsByTagName('tr'):
    data = []
    for td in tr.getElementsByTagName('td'):
        for node in td.childNodes:
            if node.nodeType == node.TEXT_NODE:
                data.append(node.nodeValue)
    print(','.join(data))