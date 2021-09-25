Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 35D8B4182AA
	for <lists+cluster-devel@lfdr.de>; Sat, 25 Sep 2021 16:24:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-_EbexoB5Mnemn4eNI-9h3g-1; Sat, 25 Sep 2021 10:24:12 -0400
X-MC-Unique: _EbexoB5Mnemn4eNI-9h3g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF9761084685;
	Sat, 25 Sep 2021 14:24:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0A0060936;
	Sat, 25 Sep 2021 14:24:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC7571801241;
	Sat, 25 Sep 2021 14:24:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18PEMKjk014669 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 25 Sep 2021 10:22:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C44DA2164DCC; Sat, 25 Sep 2021 14:22:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDCBF2164DCD
	for <cluster-devel@redhat.com>; Sat, 25 Sep 2021 14:22:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26AC01066559
	for <cluster-devel@redhat.com>; Sat, 25 Sep 2021 14:22:18 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-252-3CkSZoLPM_C5ZMCpFuq1Yg-1;
	Sat, 25 Sep 2021 10:22:16 -0400
X-MC-Unique: 3CkSZoLPM_C5ZMCpFuq1Yg-1
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01lp2054.outbound.protection.outlook.com [104.47.1.54])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-12-knzrdi63NEaHwf_D-ib2vA-1; Sat, 25 Sep 2021 16:22:13 +0200
X-MC-Unique: knzrdi63NEaHwf_D-ib2vA-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB8PR04MB7066.eurprd04.prod.outlook.com (2603:10a6:10:12e::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4544.18; Sat, 25 Sep 2021 14:22:13 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d]) by DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d%6]) with mapi id 15.20.4544.020;
	Sat, 25 Sep 2021 14:22:12 +0000
From: Heming Zhao <heming.zhao@suse.com>
To: teigland@redhat.com
Date: Sat, 25 Sep 2021 22:21:41 +0800
Message-ID: <20210925142142.1821-5-heming.zhao@suse.com>
In-Reply-To: <20210925142142.1821-1-heming.zhao@suse.com>
References: <20210925142142.1821-1-heming.zhao@suse.com>
X-ClientProxiedBy: HKAPR03CA0008.apcprd03.prod.outlook.com
	(2603:1096:203:c8::13) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
Received: from localhost (123.123.135.254) by
	HKAPR03CA0008.apcprd03.prod.outlook.com (2603:1096:203:c8::13)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.7
	via Frontend Transport; Sat, 25 Sep 2021 14:22:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5787c3e6-c34b-4b49-121e-08d9802fddfc
X-MS-TrafficTypeDiagnostic: DB8PR04MB7066:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB7066F40464CB34031B30CB2897A59@DB8PR04MB7066.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: 3h6ZPiCzTDh6rIUVeCa3YwwgVOLLiSPbJtiH3xwKCe+Lb1Klvwk48n/RsYrFtdSnIf9kbrejJQliRwFGLXpuH2mDk//B4Tc3huw+XLy2lf0zxWzuH5MzLS+3F3WE2FzNy7xRCIn0CVtfNW1w9xgf7hUnOZ+punKLDktAM4w5Mv8i00Tpc6pqQ0pm3lGBSm2+AvrpfUtS/oiI/WIq/ByHuq/Bt0yfYeJbIDdIIXq+c7JAgSTOFTVjiCYyusN0G9vkbyT/DzZT27T9tYoeeW45iC3UmEUeWaMbwVOjRJ+/5eFPlm8ogoqo5T5PhexcqKB+/HgZX480JO11R8er4ayzXw4++f9dkX+6wjS6jwB8hNzMeTzTHQmlvsEXiqxGKZ/JvnRw5TmoUZL1sCqQ4dDEiPTkKIvM6kZsSNcIRbeievncEGnaEwh8Ijd4xmaXJ8LKnUUhsMIqLvMSIadxHQyG83AfruH8YlU0g8Qbaz9C8FdkAk59y83vo8ZqF08GkDf+Y8EVgnofEAjZaJf9+S6VRVqQod38xSixuKm2RT9U+0IX5cJET1XS2BnD4bDkuUYX6PVZlcbwNU4aIknJ6zsPr/enkR3dSmy/DBkgRmPRoKSBL9sickkyKQI9H8+1rYQLD+6jlq3EcPReBRXDZylFGx0AoVkO5DU/ZJnUrTsIFiEMCQcwL4GBWg9hrUR9BM1uE0hcfoT82z9/Vg/ZqGGHEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(83380400001)(316002)(5660300002)(38100700002)(186003)(26005)(44832011)(6496006)(6486002)(2616005)(450100002)(6916009)(956004)(8936002)(4326008)(36756003)(86362001)(8676002)(66946007)(66476007)(66556008)(508600001)(6666004)(2906002)(107886003)(1076003)(9126006)(21314003);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f0PbdXIHN+6aMQtFUaw6WrJQJsJKWxjdduFvPwa7viZfIYA5NP720QjAJvRu?=
	=?us-ascii?Q?4hqMK/Y31HVvq/Q+5hz0a9gs5mgynVG80qBmFa6S9Cfv43AyAIotWSQKoRFX?=
	=?us-ascii?Q?iINa/C9K5V4KuV+/fJR3DBTEikOq3w12eWwZ+eK4VTsjoJzvrxEYegGlWs8m?=
	=?us-ascii?Q?AoXQgn3BK8ueHKJ0PEV8KyU57dYJytOpHW+n9wcwLUz0TKgdG6qI8Zg6Ca4R?=
	=?us-ascii?Q?F9sWv823TFNwd+bX8nyky2T0lGboKBWj8zFMn0REbeKR8+dD5P+rRzhmp2mp?=
	=?us-ascii?Q?PFutywRcQE8qvmtnS+ZzsliryhW/0zJhui2jfe9m1JNlQtTnJ683yZxZ8t9P?=
	=?us-ascii?Q?MvySvRnE9sUiZunaRqXqIrnvqOrzh6IwieDwBEB8m5YFlU3EOzz4N/Y5nEyi?=
	=?us-ascii?Q?+BELL3RwY1abbvWvBS+tvXdTOSZpAsqMG6NJJrW/6XqDErIRbJyyEF1aD509?=
	=?us-ascii?Q?HWotIXkDQjDK4DhfDnlJ4127fSJqtZQsN9QZMpWXzjz9n/frRyAhIbvwE3z3?=
	=?us-ascii?Q?qJsOADU8JxxVuwynm+qVk2Iomx+WiSRbtELhMwgkwESm8muJH2vP2j8vXqNU?=
	=?us-ascii?Q?stY6+wdvX7ew+YM5XAZc/SVGXtMVyqd9gPNXgvwzJVxBX8+J4YpENmNQmEFw?=
	=?us-ascii?Q?cTldBIoQx6Vk69TkF1L3xVcRbVduy+5kScS0fShsBpq2huo/5I9SnBVNDlti?=
	=?us-ascii?Q?7hHfbaoBLrIwy6RUTNMOHPPdZhAK4A7iwMm9mn10BL7amNNQZUJVZE1ZnuGk?=
	=?us-ascii?Q?Z9KGxUoesKDnZwip2XsXSNhWBuiBDwGg3b8OvWyhEBfC6S0TEBLjwX38q358?=
	=?us-ascii?Q?iayRD0Pm+Uec1y2PuHOhGyw4O241aAMGRGU9vfO7BZDUiplhqed6A2NdF1sJ?=
	=?us-ascii?Q?F2SLgI9cxbdcE3OUkduRo/iZ75FQZeXNpeO7fiZRNoUPVQba4xkp4u0hs+Xh?=
	=?us-ascii?Q?ERId/Yo+LpJkQvSumHi5s/120e5eu+h7US/+SuTYtP//JJIkz6Bk5dei6zC+?=
	=?us-ascii?Q?gtdOFc8uuBRxscdTifhtWo9Ei3yiHHH9+arQUa4NX6Xe9z/Z3POMjF6ipH2l?=
	=?us-ascii?Q?sYwDObuzODIEQyHqXNhGjq7vaso4m2Tui/N2T1KlgJX6tXQYPay+H5zZxHby?=
	=?us-ascii?Q?pnkh+ukinBVu+dpRTUeD2V4+UXX5dLrE1xFGWlqChz9Cdk8RRh5nvVzEZz8z?=
	=?us-ascii?Q?GY6DsOwysovvvJMOggThK4LHfLQ9Gf7GxTszHEYiTJByOjuvYLYfkxIQs/w5?=
	=?us-ascii?Q?q58/kB5xzcr1FEqLhYoJwGQoGtY+lzm9W/Hi6GEki+2NRAu++Sui16lmMwt7?=
	=?us-ascii?Q?NkceG2fLIB4pKOTkdaqF33er?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5787c3e6-c34b-4b49-121e-08d9802fddfc
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2021 14:22:12.8926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r6rIbgfIzgX4Dw5MaZnsN60KfCeKOoxI9DsFc+FRXV8ef1SK1/4mFGCIHAEe/MCreKYA+yz26NLXE0++VNBWxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7066
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18PEMKjk014669
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, zzhou@suse.com
Subject: [Cluster-devel] [PATCH 4/5] dlm_tool man: add new command set_config
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Signed-off-by: Heming Zhao <heming.zhao@suse.com>
---
 dlm_tool/dlm_tool.8 | 89 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/dlm_tool/dlm_tool.8 b/dlm_tool/dlm_tool.8
index e1242308302f..e6012315f082 100644
--- a/dlm_tool/dlm_tool.8
+++ b/dlm_tool/dlm_tool.8
@@ -32,6 +32,10 @@ dlm_tool \- a utility for the dlm and dlm_controld daemon
 .br
 	Reload dlm_controld config settings from dlm.conf.
 
+.B set_config
+.br
+	Set dlm_controld config settings on the fly.
+
 .BI fence_ack " nodeid"
 .br
 	Quit trying to fence a node.
@@ -145,6 +149,13 @@ see examples in \fBdlm.conf(5)\fP
 
 -
 
+dlm_tool set_config "dlm_controld-config-item=x"
+.RS 4
+see below \fBEXAMPLES\fP section
+.RE
+
+-
+
 dlm_tool fence_ack \fIls-name\fP
 
 -
@@ -202,6 +213,84 @@ dlm_tool -h
 
 dlm_tool -V
 
+.SH EXAMPLES
+
+command \fIdlm_tool set_config "xxx"\fP can do the dynamic config job. It makes possible to debug, or to do flexible operations on the fly.
+
+If the line of "dlm_tool dump_config" output leading with "(*)", the START symbol, it indicates this item supports dynamic config.
+.br
+i.e.
+
+.RS 4
+.EX
+# dlm_tool dump_config | grep log_debug
+(*-) log_debug=1
+.EE
+
+The "log_debug" supports dynamic setting.
+.br
+The '-' (minus) means dynamic config doesn't take effect on this item.
+.br
+If "(*-)" becomes "(*+)", it means this item is dynamically changed on the fly.
+.RE
+
+
+Below show more usage
+
+.RS 4
+.EX
+Default log_debug is 0, we use "set_config" to change to 1.
+.br
+
+# dlm_tool dump_config | grep log_debug
+(*-) log_debug=0
+# dlm_tool set_config "log_debug=1"
+Issue set_config done.
+# dlm_tool dump_config | grep log_debug
+(*+) log_debug=1
+
+Default log_debug is 0, we do "set_config", it will overwrite with 0.
+"dump_config" show "(*+)" to indicate this option had been changed by set_config.
+.br
+
+# dlm_tool dump_config | grep log_debug
+(*-) log_debug=0
+# dlm_tool set_config "log_debug=0"
+Issue set_config done.
+# dlm_tool dump_config | grep log_debug
+(*+) log_debug=0
+
+We use "restore" to reset dlm_controld setting. change status "(*)" to "(*-)"
+.br
+
+# dlm_tool dump_config | grep log_debug
+(*+) log_debug=0
+# dlm_tool set_config "log_debug=restore"
+# dlm_tool dump_config | grep log_debug
+(*-) log_debug=0
+
+Below we use "restore_all" to reset all dynamic settings in one command
+.br
+
+# dlm_tool dump_config | grep _debug
+(*-) daemon_debug=0
+(*-) log_debug=0
+(*-) plock_debug=0
+# dlm_tool set_config "daemon_debug=1 log_debug=1"
+Issue set_config done.
+# dlm_tool dump_config | grep _debug
+(*+) daemon_debug=1
+(*+) log_debug=1
+(*-) plock_debug=0
+# dlm_tool set_config "restore_all"
+Issue set_config done.
+# dlm_tool dump_config | grep _debug
+(*-) daemon_debug=0
+(*-) log_debug=0
+(*-) plock_debug=0
+.EE
+.RE
+
 .SH SEE ALSO
 .BR dlm_controld (8),
 .BR dlm.conf (5)
-- 
2.32.0


