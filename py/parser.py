import db_config
from xml.dom import minidom
import xml.dom.minidom
from datetime import date, datetime, timedelta
import os

# ═══════════════════════════════════════════════════════════════════════════════╡
# GLOBAL CASES & DEATHS
# 2 ----> 's5'
# 3 ----> 's6'
# 4 ----> 's7'
# ═══════════════════════════════════════════════════════════════════════════════╡
def global_totals(nodeList, attributeValue1, attributeValue2, attributeValue3):
    rtn = []
    td = nodeList.getElementsByTagName("td")
    for elem in td:
        a = dict(elem.attributes.items())
        for key in a:
            if "class" in key:
                if a['class'] == attributeValue1:
                    if elem.firstChild is None:
                        continue
                    k = elem.firstChild.data
                    if ',' in k:
                        temp = k.split(',')
                        if len(temp) == 3:
                            val = int(temp[0] + temp[1] + temp[2])
                        elif len(temp) == 2:
                            val = int(temp[0] + temp[1])
                        else:
                            val = int(k)
                        rtn.append(val)
                if a['class'] == attributeValue2:
                    if elem.firstChild is None:
                        continue
                    k = elem.firstChild.data
                    if ',' in k:
                        temp = k.split(',')
                        val = int(temp[0] + temp[1])
                    else:
                        val = int(k)
                    rtn.append(val)
                if a['class'] == attributeValue3:
                    if elem.firstChild is None:
                        continue
                    k = elem.firstChild.data
                    if ',' in k:
                        temp = k.split(',')
                        val = int(temp[0] + temp[1])
                    else:
                        val = int(k)
                    rtn.append(val)
    return rtn

# ═══════════════════════════════════════════════════════════════════════════════╡
# STATE NAMES
# 1 ----> 's12'
# 2 ----> 's19'
# ═══════════════════════════════════════════════════════════════════════════════╡
def get_state_names(nodeList, attributeValue1, attributeValue2):
    states = []
    td = nodeList.getElementsByTagName("td")
    for elem in td:
        a = dict(elem.attributes.items())
        for key in a:
            if "class" in key:
                if a['class'] == attributeValue1:
                    if elem.firstChild is None:
                        continue
                    k = elem.firstChild.data
                    states.append(k)
                if a['class'] == attributeValue2:
                    if elem.firstChild is None:
                        continue
                    k = elem.firstChild.data
                    states.append(k)
    return states

# ═══════════════════════════════════════════════════════════════════════════════╡
# STATE DATA
# 1 ----> 's13'
# 2 ----> 's20'
# ═══════════════════════════════════════════════════════════════════════════════╡
def get_state_data(nodeList, attributeValue):
    data = []
    rtn = []
    td = nodeList.getElementsByTagName("td")
    for elem in td:
        a = dict(elem.attributes.items())
        for key in a:
            if "class" in key:
                if a['class'] == attributeValue: 
                    if elem.firstChild is None:
                        continue
                    d = elem.firstChild.data
                    if ',' in d:
                        temp = d.split(',')
                        val = int(temp[0] + temp[1])
                    else:
                        val = int(d)
                    data.append(val)
    for i, k in zip(data[0::2], data[1::2]):
        dat = [i, k]
        rtn.append(dat)
    return rtn

# ═══════════════════════════════════════════════════════════════════════════════╡
# COUNTY NAMES
# ═══════════════════════════════════════════════════════════════════════════════╡
def get_county_names(nodeList):
    counties = []
    tbody = nodeList.getElementsByTagName('tbody')
    for tr in tbody[0].getElementsByTagName('tr'):
        for th in tr.getElementsByTagName('th'):
            for node in th.childNodes:
                if node.firstChild is not None:
                    c = node.firstChild.data
                    counties.append(c)
                else:
                    c = node.data
                    counties.append(c)
    return counties

# ═══════════════════════════════════════════════════════════════════════════════╡
# COUNTY DATA
# ═══════════════════════════════════════════════════════════════════════════════╡
def get_county_data(nodeList):
    county_data = []
    tbody = nodeList.getElementsByTagName('tbody')
    for tr in tbody[0].getElementsByTagName('tr'):
        rtn = []
        for td in tr.getElementsByTagName('td'):
            for node in td.childNodes:
                if node.nodeType == node.TEXT_NODE:
                    if ',' in node.nodeValue:
                        text = node.nodeValue
                        temp = text.split(',')
                        val = int(temp[0] + temp[1])
                        rtn.append(val)
                    else:
                        rtn.append(node.nodeValue)
        county_data.append(rtn)
    return county_data

# ═══════════════════════════════════════════════════════════════════════════════╡
# CREATE STATE DICTIONARY
# ═══════════════════════════════════════════════════════════════════════════════╡
def create_state_dict(list1, list2, list3):
    state_dict = {}
    sd = []
    sname = []
    for x in range(27):
        sd.append(list1[x])
        sd.append(list2[x])
    for i in range(54):
        sname.append(list3[i])
    for j in range(54):
        state_dict[sname[j]] = sd[j]
    return state_dict

# ═══════════════════════════════════════════════════════════════════════════════╡
# CREATE COUNTY DICTIONARY
# ═══════════════════════════════════════════════════════════════════════════════╡
def create_county_dict(list1, list2):
    county_dict = {}
    cd = []
    cname = []
    for x in range(54):
        d = list2[x][0], list2[x][2]
        cd.append(d)
    for i in range(54):
        cname.append(list1[i])
    for j in range(54):
        county_dict[cname[j]] = cd[j]
    return county_dict

# ═══════════════════════════════════════════════════════════════════════════════╡
# MAIN
# ═══════════════════════════════════════════════════════════════════════════════╡
today = datetime.now().date()
t = str(today).split('-')
today = t[0] + t[1] + t[2]

dom1 = xml.dom.minidom.parse('/var/www/html/temp/page1.xhtml')
names = get_state_names(dom1, 's12', 's19')
dat1 = get_state_data(dom1, 's13')
dat2 = get_state_data(dom1, 's20')
state_data = create_state_dict(dat1, dat2, names)
global_data = global_totals(dom1, 's5', 's6', 's7')

db_config.update_state_table(state_data)
db_config.update_country_table(global_data)

dom2 = xml.dom.minidom.parse('/var/www/html/temp/page2.xhtml')
county_names = get_county_names(dom2)
data = get_county_data(dom2)
# county_d = create_county_dict(county_names, data)
# db_config.update_county_table(county_d)
