Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B7F57410A79
	for <lists+cluster-devel@lfdr.de>; Sun, 19 Sep 2021 08:47:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-NNFcuyzmPcS4ZXrK8tQAoQ-1; Sun, 19 Sep 2021 02:47:04 -0400
X-MC-Unique: NNFcuyzmPcS4ZXrK8tQAoQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F6F5824FA7;
	Sun, 19 Sep 2021 06:47:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 909CD6B559;
	Sun, 19 Sep 2021 06:47:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7BC154EA2F;
	Sun, 19 Sep 2021 06:47:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18J6hk9e030385 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 19 Sep 2021 02:43:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 184C3100A20A; Sun, 19 Sep 2021 06:43:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 135401112875
	for <cluster-devel@redhat.com>; Sun, 19 Sep 2021 06:43:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80EDF8007B1
	for <cluster-devel@redhat.com>; Sun, 19 Sep 2021 06:43:43 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-417-oQ-Mu3hVMAC2-iXDdRlMqA-1;
	Sun, 19 Sep 2021 02:43:39 -0400
X-MC-Unique: oQ-Mu3hVMAC2-iXDdRlMqA-1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-20-OC5bagKJO-aBttNHIP4cag-1; Sun, 19 Sep 2021 08:43:37 +0200
X-MC-Unique: OC5bagKJO-aBttNHIP4cag-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB7PR04MB5113.eurprd04.prod.outlook.com (2603:10a6:10:14::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4523.14; Sun, 19 Sep 2021 06:43:36 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d]) by DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d%6]) with mapi id 15.20.4523.018;
	Sun, 19 Sep 2021 06:43:36 +0000
From: Heming Zhao <heming.zhao@suse.com>
To: teigland@redhat.com, aahringo@redhat.com, cluster-devel@redhat.com
Date: Sun, 19 Sep 2021 14:43:13 +0800
Message-ID: <20210919064322.1670-2-heming.zhao@suse.com>
In-Reply-To: <20210919064322.1670-1-heming.zhao@suse.com>
References: <20210919064322.1670-1-heming.zhao@suse.com>
X-ClientProxiedBy: HK2PR0302CA0002.apcprd03.prod.outlook.com
	(2603:1096:202::12) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (123.123.135.184) by
	HK2PR0302CA0002.apcprd03.prod.outlook.com (2603:1096:202::12)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.6
	via Frontend Transport; Sun, 19 Sep 2021 06:43:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1a58a51-a661-458b-4e10-08d97b38ce3d
X-MS-TrafficTypeDiagnostic: DB7PR04MB5113:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB511348DE62CA090AF2709C4097DF9@DB7PR04MB5113.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: HNaC2hbqnlFLDBe4SL1AoYa4dmu2A06LW4t4bOsLvF+bJMRzYWES4tqGNXpAqUB1hgvcrXLayQwakPNguTDTGjHLEz16zw6/h0/Kl/n9fP0ganhSlfeGAacVydywcvd5/ocfkTiGmpjOPvXkE9vew0ooHFDU7tU2st0IA29T6FuMAbB3IC+jxIf0gdltT9u5OnfiX5H6rIA+mj41NAyeQvpm66cO7sGAsDIveAd0uJMHzOvNAsPcbziI5c+x7dCqXJvCI/fM6+8zjAh+cGwDmiqGugXF8VkC0zTnrw0MHAEWcaiV1zNZ42wrlCUHuMf5EddLf0Z4+jkwCn3849FoJx+f1Kh9DmEK6ZZR+3X5qLa+2xnt8JwCRb5Mi/Jr3DB5wpJSawHlw9FDgK6rYpqfrF+xc3avT9HA3UffUQfuw0mwOvhQy5/mXXdsz+qYpIi+u5iQk0LfbSfFFf7Yrdd8OdqG3dnMx+OBYZld12eglYziZ04w64LrfvGqPEwNtlDw/byJXjD1SvbdXd+kGSGg7ozOczdq5pmEekq/uxA17avi+xyp2Ysvf38TqPvYjSOrANwtONU+Iz+3PW9NjvmUfO3YeVviUCwLrSO1u2U4tuzd6N+SfhYhm0vqutCMdY9ngdBBTWVQlZsPYdgtFeSxiX4oh2TWpK/ZUxwVPXhcu3ceOwAS0F4RW2e/d/EQlc2B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(136003)(366004)(39850400004)(396003)(346002)(376002)(66476007)(8676002)(8936002)(86362001)(6486002)(2906002)(478600001)(36756003)(5660300002)(66556008)(66946007)(6496006)(956004)(2616005)(450100002)(1076003)(26005)(107886003)(38100700002)(316002)(83380400001)(186003)(44832011)(4326008)(6666004)(9126006);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AQpkauV7NWZLdWQ9fe0/hDaVf0x3Jou+XxUfgywwd3L8iuOX65K95hwPN/uW?=
	=?us-ascii?Q?/7nIPmyW+gx/g2lF7P4ySbwwAiDwBeaHoHezLnYNrJBe0iWXJ3Q81vzi/ZPf?=
	=?us-ascii?Q?utO5IHyBOmGdOvHo1+Oy2PiwXEStqSv9MnMbDjuQVVlMxlx26Ns9DrbxDTd0?=
	=?us-ascii?Q?Sd04tfoI/VHrhmlFULNCk998gMhdcX+q/ErxP3R7COMHl86OqPoCAYhen6UG?=
	=?us-ascii?Q?eO+SJxCUY4Gp3dAodk4QWoKE+uSRaUZyzTxQY/9cBJvQRnk0dZor4H1gZLBz?=
	=?us-ascii?Q?LRp4xY5jnj7rvgxIhY9LbpmXzKZalqi11mAcqcL8yMhr7cE7cK0kfS21LeIW?=
	=?us-ascii?Q?IBma7CQ1dxgAoX1jJbvw6e4bNKQlkizBdg2ZLMSadxU2Dez9Ipx0JVvUWglY?=
	=?us-ascii?Q?MEBzNVyjJKVZ9uqjoE8IWYYf3PLPOYhqkg5LcPcdrfMpuANC1TtLODJG709w?=
	=?us-ascii?Q?VHkXv+G+2Rjs6b4/Z3bd47Bx80xrWpXs5WgGXym3GqVLxT7g8WgjoKLhRpnv?=
	=?us-ascii?Q?90kxi+G+Sfc1DD1943/mz+bs/vgiZTn4LOkVYmHillzfG0lgko8WqblLfcSE?=
	=?us-ascii?Q?GEuh54qOh+hA+tZ3gh4eeRwxdsE+NDgC4Lwxzrl9uA1SFs6VivlMAgOhXKxD?=
	=?us-ascii?Q?F8z9OHks4Q4jj2IcHEFYOBruHd2fxkOupGG/ZHqbDskQU5kOa05mgcJkheYK?=
	=?us-ascii?Q?kZ5e0ZnGnqoEtM/8CGh+8Us5ECaDOeqOI1MIa0cMA0ML4tdU5I9JRGDoTjIs?=
	=?us-ascii?Q?vhI22wgVJdtPXouZEr4s4bWrFyk7YkIhfCL6gyl6oQwpza2jvGcQ5Zx8yi3q?=
	=?us-ascii?Q?1EV21aILBDd5i42do47LCiIvi2tzd7KUqEv//1vj/R4bNa4IhUpa3BNyKtjp?=
	=?us-ascii?Q?2M6OGASchZFaujEaFS/3QoyD3BczF1RGwlAJDa0hx+LDXdp9HCS4NHL/B9rt?=
	=?us-ascii?Q?3QBDoAd1zUEfFao019c3Hgle/ETu6T+DapXTtaKlo1eXIV54VO6pPDGkFsn7?=
	=?us-ascii?Q?Pe0Ethv1M6pmhAaLqHCAJjcTDdOpn3FalEw5n4LdSQTyon7Xz5Rn4Ea6RTAP?=
	=?us-ascii?Q?BCfplq0fOPASRJX1qEjak9q75xegHoxec40uRxdhLDcF7gj1MD4jsetD+y4I?=
	=?us-ascii?Q?5Lnn98lptVsZ65jgvE3B0IQzHMNkSZ4uEIWe1YI7/syZcA5xkET0mZnooqvj?=
	=?us-ascii?Q?7k/7L5t3H9sNBYjef+u8cnjZnT90lmgvM+nlzXy12Fg4QYPM6lezrMIFOaLR?=
	=?us-ascii?Q?u1RtlQ26dg1TbKYAM9cXM1rXm9VUT8bAUWOKSTzO3Rb7klbqBbeAkwvJ+iGJ?=
	=?us-ascii?Q?yoZUYwEe9vz8rQFpsD56y+J8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a58a51-a661-458b-4e10-08d97b38ce3d
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2021 06:43:36.0825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MP0dk1k7pc/LR1putzh/qj/xILZVMq6qOv82yrRFrfFxEzw176LFRL38TJSOn4OP+BpFNze5IEebVDfrnFQBxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5113
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18J6hk9e030385
X-loop: cluster-devel@redhat.com
Cc: zzhou@suse.com
Subject: [Cluster-devel] [PATCH 01/10] dlm_tool man: add command "joinleave",
	add "USAGE" section
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Signed-off-by: Heming Zhao <heming.zhao@suse.com>
---
 dlm_tool/dlm_tool.8 | 79 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/dlm_tool/dlm_tool.8 b/dlm_tool/dlm_tool.8
index bbc11c261b7e..056c4af0213c 100644
--- a/dlm_tool/dlm_tool.8
+++ b/dlm_tool/dlm_tool.8
@@ -48,6 +48,10 @@ dlm_tool \- a utility for the dlm and dlm_controld daemon
 .br
 	Leave a lockspace.
 
+.BI joinleave " name"
+.br
+	Do two actions: first Join then Leave a lockspace.
+
 .BI lockdebug " name"
 .br
 	Complete display of locks from the lockspace.
@@ -112,6 +116,81 @@ Print help, then exit
 .B \-V
 Print program version information, then exit
 
+.SH USAGE
+
+dlm_tool ls [-n] [ls_name]
+
+-
+
+dlm_tool status [-v]
+
+-
+
+dlm_tool dump
+
+-
+
+dlm_tool dump_config
+
+-
+
+dlm_tool fence_ack \fIls-name\fP
+
+-
+
+dlm_tool log_plock
+
+-
+
+dlm_tool plocks \fIls-name\fP
+
+-
+
+dlm_tool join [-e 0|1] [-f 0|1] \fIls-name\fP
+
+-
+
+dlm_tool leave \fIls-name\fP
+
+-
+
+dlm_tool joinleave [-e 0|1] [-f 0|1] \fIls-name\fP
+
+-
+
+dlm_tool lockdebug [-s] [-v] [-w] \fIls-name\fP
+
+-
+
+dlm_tool lockdump [-M] \fIls-name\fP
+
+-
+
+dlm_tool run|run_start [-n] \fIcommand\fP
+
+* current run & run_start support \fIcommand\fP:
+.RS 4
+"lvm lvchange --refresh"
+.br
+"lvm lvs"
+.RE
+
+-
+
+dlm_tool run_check|run_cancel [-i "sec"] \fIuuid\fP
+
+-
+
+dlm_tool run_list
+
+-
+
+dlm_tool -h
+
+-
+
+dlm_tool -V
+
 .SH SEE ALSO
 .BR dlm_controld (8),
 .BR dlm.conf (5)
-- 
2.32.0


