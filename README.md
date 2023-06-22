# spicy_cc_link_field_control

English is [here](https://github.com/nttcom/zeek-parser-CCLinkField-CCLinkControl/blob/main/README_en.md)

## 概要

spicy_cc_link_field_controlとは[CC-Linkファミリー](https://www.cc-link.org/ja/cclink/index.html)のCC-Link IE FieldとCC-Link IE Controlを解析できる、Spicyで作成したZeekのパーサです。

## 使い方

### マニュアルインストール

本パーサを利用する前に、ZeekとSpicyが既にインストールされていることを確認します。

```
# Zeekのチェック
~$ zeek -version
zeek version 5.0.0

# Spicyのチェック
~$ spicyz -version
1.3.16
~$ spicyc -version
spicyc v1.5.0 (d0bc6053)
```

手動で本パーサを利用する場合は、以下のコマンドでリポジトリをローカルにクロンします。

```
~$ git clone https://github.com/nttcom/zeek-parser-CCLinkField-CCLinkControl.git
~$ cd ~/zeek-parser-CCLinkField-CCLinkControl/analyzer/ 
```

パーサをコンパイルし、生成したオブジェクトファイルを以下のパスに移動します。

```
~$ spicyz -o cc_link_noip.hlto cc_link_noip.spicy cc_link_noip.evt
~$ # cc_link_noip.hltoが生成されます
~$ cp cc_link_noip.hlto /opt/zeek/lib/zeek-spicy/modules/
```

Zeekファイルを以下のパスに移動します。

```
~$ cd ~/zeek-parser-CCLinkField-CCLinkControl/scripts/
~$ cp main.zeek /opt/zeek/share/zeek/site/
```

以下のファイルの最後に新規追加したパーサをインポートします。

```
~$ tail /opt/zeek/share/zeek/site/local.zeek
...省略...
@load cc_link_noip
```

以上でパーサを利用できる様になり、Zeekを実行すれば、cclink-ie.logが生成されます。

注意：zeekを/opt/以外にインストールした場合は読み替えてください。

## ログのタイプと説明

このパーサはCC-Link IE FieldとCC-Link IE Controlの全関数を監視し、cclink-ie.logを出力します。

| フィールド | タイプ | 説明 |
| --- | --- | --- |
| ts | time | 最初に通信した時のタイムスタンプ |
| src_mac | string | 送信元MCAアドレス |
| dst_mac | string | 送信先MCAアドレス |
| service | string | プロトコル名 |
| pdu_type | string | プロトコルの関数名 |
| cmd | string | 関数内の情報 |
| node_type | string | 関数内の情報 |
| node_id | int | 関数内の情報 |
| connection_info | string | 関数内の情報 |
| src_node_number | string | 関数内の情報 |
| number | int | パケット出現回数 |
| ts_end | time | 最後に通信した時のタイムスタンプ |

生成したログの例は以下に示しました。

```
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
```

## 関連ソフトウエア

本パーサは[OsecT](https://github.com/nttcom/OsecT)で利用されています。
