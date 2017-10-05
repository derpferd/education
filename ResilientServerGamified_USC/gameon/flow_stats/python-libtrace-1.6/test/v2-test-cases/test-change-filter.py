#!/usr/bin/env python

# Sat, 15 Mar 14 (PDT)
# change-filter.py: Create packet filter, change it after seeing a few packets
# Copyright (C) 2015, Nevil Brownlee, U Auckland | WAND

from plt_testing import *

try:
    t = plt.trace('pcapfile:anon-v4.pcap')
    filter = plt.filter('udp port 53')  # Only want DNS packets
    t.conf_filter(filter)
    t.conf_snaplen(128)
    # t.conf_promisc(true)
    # Remember: on a live interface, must sudo to capture
    #           on a trace file, can't set promicuous
except:
    test_println("Failed to configure something!", get_tag())
    exit()

test_println("starting ...", get_tag())
t.start()

ntcp = nfp = 0;  offset = 12
for pkt in t:
    nfp += 1

    trans = pkt.transport
    if trans:
        udp = pkt.udp;  tcp = pkt.tcp
#        print "%3d udp=%s, tcp=%s" % (nfp, udp, tcp)
        if udp:  # We filtered on UDP first
            print_udp(udp, 12, get_tag(str(nfp)))
            print_data("UDP:", offset, udp.data, 64, get_tag(str(nfp)))
            upl = udp.payload
            print_data("udp.payload:", offset, upl.data, 64, get_tag("nfp:"+str(nfp)))
            upl = pkt.udp.udp_payload
            print_data("udp.udp_pyld:", offset, upl.data, 64, get_tag("nfp:"+str(nfp)))
            upl = pkt.udp_payload
            print_data("udp_payload:", offset, upl.data, 64, get_tag("nfp:"+str(nfp)))
            if nfp == 4:
                filter = plt.filter('tcp')  # Now only want TCP packets
                t.pause
                t.conf_filter(filter)
                t.start
        elif tcp:  # Then we changed our filter to TCP
            tpl = tcp.payload
            if not tpl:
                continue
            print_tcp(tcp, 12, get_tag("nfp:"+str(nfp)))
            print_data("TCP:", offset, tcp.data, 64, get_tag("nfp:"+str(nfp)))
            print_data("tcp.payload:", offset, tpl.data, 64, get_tag("nfp:"+str(nfp)))
            tpl = pkt.tcp.tcp_payload
            print_data("tcp.tcp_pyld:", offset, tpl.data, 64, get_tag("nfp:"+str(nfp)))
            tpl = pkt.tcp_payload
            print_data("tcp_payload:", offset, tpl.data, 64, get_tag("nfp:"+str(nfp)))
            ntcp += 1
            if ntcp == 2:
                exit()
