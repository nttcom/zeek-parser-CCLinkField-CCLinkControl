spicy_add_analyzer(
    NAME cc_link_noip
    PACKAGE_NAME spicy_cc_link_noip
    SOURCES cc_link_noip.spicy cc_link_noip.evt zeek_cc_link_noip.spicy
    SCRIPTS __load__.zeek main.zeek dpd.sig
)
