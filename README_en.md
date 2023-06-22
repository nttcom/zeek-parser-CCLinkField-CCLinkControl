# spicy_cc_link_field_control

## Overview

spicy_cc_link_field_control is a parser for CC-Link IE Field and CC-Link IE Control in [CC-Link family](https://www.cc-link.org/ja/cclink/index.html), Zeek's parser created by Spicy.

## Usage

### Manual Installation

Before using this parser, make sure that Zeek and Spicy are already installed.

````
## Check Zeek
~$ zeek -version
zeek version 5.0.0

# Check Spicy
~$ spicyz -version
1.3.16
~$ spicyc -version
spicyc v1.5.0 (d0bc6053)
````

If you want to use this parser manually, you can use the following command to clone the repository locally.

```
~$ git clone https://github.com/nttcom/zeek-parser-CCLinkField-CCLinkControl.git
~$ cd ~/zeek-parser-CCLinkField-CCLinkControl/analyzer/ 
```

Compile the parser and move the generated object files to the following path.

```
~$ spicyz -o cc_link_noip.hlto cc_link_noip.spicy cc_link_noip.evt
~$ # cc_link_noip.hlto will be generated
~$ cp cc_link_noip.hlto /opt/zeek/lib/zeek-spicy/modules/
```

Move the Zeek file to the following path.

```
~$ cd ~/zeek-parser-CCLinkField-CCLinkControl/scripts/
~$ cp main.zeek /opt/zeek/share/zeek/site/
```

Import the newly added parser at the end of the following file.

```
~$ tail /opt/zeek/share/zeek/site/local.zeek
... Omit ...
@load cc_link_noip
```

Now you can use the parser, run Zeek, and cclink-ie.log will be generated.

Note: If you installed zeek in a location other than /opt/, you will need to read it differently.

## Log type and description

This parser monitors all functions of CC-Link IE Field and CC-Link IE Control and outputs cclink-ie.log.

| Field | Type | Description |
| --- | --- | --- |
| ts | time | timestamp of the first communication |
| src_mac | string | source MCA address |
| dst_mac | string | destination MCA address |
| service | string | protocol name |
| pdu_type | string | protocol function name |
| cmd | string | Information in function |
| node_type | string | Information in function |
| node_id | int | Information in function |
| connection_info | string | Information in function |
| src_node_number | string | Information in function |
| number | int | number of packet occurrence |
| ts_end | time | Timestamp of the last communication |

An example of the generated log is shown below.

```
#separator \x09
#set_separator .
#empty_field (empty)
#unset_field -
#path cclink-ie
#open 2023-03-15-16-56-36
#fields ts src_mac dst_mac service pdu_type cmd node_type node_id connection_info src_node_number number ts_end
#types time string string string string string string string int string string string int time
1667903833.066101 00:11:11:11:11:11 00:00:00:00:01 cclink_ie_control select - - - - 0x0001 61 1667903833.134207
1667903833.065821 00:11:11:11:11:11 00:00:00:00:01 cclink_ie_control scan - - - - 0x0001 48 1667903833.129023
1667903833.064742 00:11:11:11:11:11 00:00:00:00:01 cclink_ie_control connectAck - - - - 0x0001 61 1667903833.133590
1667903833.065511 00:11:11:11:11:11 00:00:00:00:01 cclink_ie_control connect - - - 0x0001 62 1667903833.134085
1667903833.067818 00:11:11:11:11:11 00:00:00:00:01 cclink_ie_control nTNTest - - - - 0x0001 53 1667903833.131018
1667903833.068939 00:11:11:11:11:11 00:00:00:00:01 cclink_ie_control dummy - - - 0x0001 57 1667903833.133957
1667903833.065083 00:11:11:11:11:11 00:00:00:00:01 cclink_ie_control collect - - - - 0x0001 61 1667903833.133231
1667903833.064936 00:11:11:11:11:11 00:00:00:00:01 cclink_ie_control launch - - - - 0x0001 40 1667903833.132990
1667903833.066240 00:11:11:11:11:11 00:00:00:00:01 cclink_ie_control token - - - - 0x0001 57 1667903833.133351
#close 2023-03-15-16-56-36
```

## Other Software

This parser is used by [OsecT](https://github.com/nttcom/OsecT).
