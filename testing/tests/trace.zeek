# @TEST-EXEC: zeek -Cr ${TRACES}/raw-layer.pcap ${PACKAGE} %INPUT >output
# @TEST-EXEC: btest-diff output
# @TEST-EXEC: btest-diff conn.log
#
# @TEST-DOC: Test Zeek parsing a trace file through the cc_link_noip analyzer.

# TODO: Adapt as suitable. The example only checks the output of the event
# handler.

event cc_link_noip::packet(p: raw_pkt_hdr, payload: string)
    {
    print fmt("Testing cc_link_noip: [%s -> %s] %s", p$l2$src, p$l2$dst, payload);
    }
