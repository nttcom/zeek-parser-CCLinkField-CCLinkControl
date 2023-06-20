spicy_cc_link_noip
=================================

spicy_cc_link_noipとはSpicyで作成したZeekのパーサです。

OsecTで利用されています。

以下の様なログを生成できます。

#separator \x09
#set_separator	,
#empty_field	(empty)
#unset_field	-
#path	cclink-ie
#open	2023-03-15-16-56-36
#fields	ts	src_mac	dst_mac	service	pdu_type	cmd	node_type	node_id	connection_info	src_node_number	number	ts_end
#types	time	string	string	string	string	string	string	int	string	string	int	time
1667903833.066101	00:11:11:11:11:11	00:00:00:00:00:01	cclink_ie_control	select	-	-	-	-	0x0001	61	1667903833.134207
1667903833.065821	00:11:11:11:11:11	00:00:00:00:00:01	cclink_ie_control	scan	-	-	-	-	0x0001	48	1667903833.129023
1667903833.064742	00:11:11:11:11:11	00:00:00:00:00:01	cclink_ie_control	connectAck	-	-	-	-	0x0001	61	1667903833.133590
1667903833.065511	00:11:11:11:11:11	00:00:00:00:00:01	cclink_ie_control	connect	-	-	-	-	0x0001	62	1667903833.134085
1667903833.067818	00:11:11:11:11:11	00:00:00:00:00:01	cclink_ie_control	nTNTest	-	-	-	-	0x0001	53	1667903833.131018
1667903833.068939	00:11:11:11:11:11	00:00:00:00:00:01	cclink_ie_control	dummy	-	-	-	-	0x0001	57	1667903833.133957
1667903833.065083	00:11:11:11:11:11	00:00:00:00:00:01	cclink_ie_control	collect	-	-	-	-	0x0001	61	1667903833.133231
1667903833.064936	00:11:11:11:11:11	00:00:00:00:00:01	cclink_ie_control	launch	-	-	-	-	0x0001	40	1667903833.132990
1667903833.066240	00:11:11:11:11:11	00:00:00:00:00:01	cclink_ie_control	token	-	-	-	-	0x0001	57	1667903833.133351
#close	2023-03-15-16-56-36
