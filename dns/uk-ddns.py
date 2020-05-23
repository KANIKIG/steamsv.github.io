#!/usr/bin/env python
#coding: utf-8
import commands, sys, os, json

# dnsmasq配置文件路径
path = "/etc/dnsmasq.d/unlock.conf"

# dns配置，一行一个规则对应DDNS
dnsconf = '''
{
    "netflix.com":"uk.ddns.bar",
    "netflix.net":"uk.ddns.bar",
    "nflximg.net":"uk.ddns.bar",
    "nflximg.com":"uk.ddns.bar",
    "nflxvideo.net":"uk.ddns.bar",
    "nflxso.net":"uk.ddns.bar",
    "nflxext.com":"uk.ddns.bar"
}
'''

# 以下勿动
if os.path.exists(path):
    with open(path) as unlockconf:
        unlockconf = unlockconf.read().split("\n")
else:
    print "check dnsmasq config path"
    exit()

dnsconf = json.loads(dnsconf)
change = False
for host, dns in dnsconf.iteritems():
    output = commands.getoutput("nslookup " + dns)
    output = output.split("\n");

    for str in output:
        if "Address" in str and "#53" not in str:
            str = str.replace("Address:","")
            str = str.replace(" ","")
            ip = str.replace("\t","")
            print "nslookup: " + host + "/" + dns + "/" + ip

            for index, rule in enumerate(unlockconf):
                if host in rule:
                    if rule.split("/")[2] != ip:
                        unlockconf[index] = "server=/" + host + "/" + ip
                        print "changed:  " + unlockconf[index]
                        change = True

if change == True:
    s = "\n".join(unlockconf)
    with open(path, 'w') as outfile:
        outfile.write(s)
        outfile.close()
        output = commands.getoutput("systemctl restart dnsmasq")
        if output != "":
            print output




    