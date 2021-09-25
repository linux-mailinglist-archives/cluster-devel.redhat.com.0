Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTP id 929904182A5
	for <lists+cluster-devel@lfdr.de>; Sat, 25 Sep 2021 16:23:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-8urd0RphN-OjFMvMNwue-w-1; Sat, 25 Sep 2021 10:23:04 -0400
X-MC-Unique: 8urd0RphN-OjFMvMNwue-w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 610A31006AA4;
	Sat, 25 Sep 2021 14:23:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31B0460936;
	Sat, 25 Sep 2021 14:23:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65BA11800B9E;
	Sat, 25 Sep 2021 14:22:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18PEMDgN014640 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 25 Sep 2021 10:22:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F0467111E3F1; Sat, 25 Sep 2021 14:22:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB035112C243
	for <cluster-devel@redhat.com>; Sat, 25 Sep 2021 14:22:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FE72811E7F
	for <cluster-devel@redhat.com>; Sat, 25 Sep 2021 14:22:06 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-459-ZwIrlVFgPgOC4fJt1PgA5Q-1;
	Sat, 25 Sep 2021 10:22:04 -0400
X-MC-Unique: ZwIrlVFgPgOC4fJt1PgA5Q-1
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01lp2059.outbound.protection.outlook.com [104.47.1.59])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-8-DmVSSrn2MDG860XwtazfWw-1; Sat, 25 Sep 2021 16:22:01 +0200
X-MC-Unique: DmVSSrn2MDG860XwtazfWw-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB8PR04MB7066.eurprd04.prod.outlook.com (2603:10a6:10:12e::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4544.18; Sat, 25 Sep 2021 14:22:00 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d]) by DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d%6]) with mapi id 15.20.4544.020;
	Sat, 25 Sep 2021 14:22:00 +0000
From: Heming Zhao <heming.zhao@suse.com>
To: teigland@redhat.com
Date: Sat, 25 Sep 2021 22:21:39 +0800
Message-ID: <20210925142142.1821-3-heming.zhao@suse.com>
In-Reply-To: <20210925142142.1821-1-heming.zhao@suse.com>
References: <20210925142142.1821-1-heming.zhao@suse.com>
X-ClientProxiedBy: HKAPR03CA0005.apcprd03.prod.outlook.com
	(2603:1096:203:c8::10) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
Received: from localhost (123.123.135.254) by
	HKAPR03CA0005.apcprd03.prod.outlook.com (2603:1096:203:c8::10)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.7
	via Frontend Transport; Sat, 25 Sep 2021 14:22:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f05dad87-72af-46d1-2c07-08d9802fd6d3
X-MS-TrafficTypeDiagnostic: DB8PR04MB7066:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB7066CD08D572406AFCF742D697A59@DB8PR04MB7066.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: e4buzjfgDmQXS4+3N1ePZSd9PKagDVOjartQeXdHEW78r1nMA9mEHXEw0z/upSqB96DVoHpR4bRar/VCQxFHiCXYNiif7LaRzcF1d070xszfI35Hvq7CbfTO/s4OPDSeXz4rEc/erF87ISJPatmgNJ+hHyKSkqJCZrsUZsLqEeBSBWqHFu9XfLzQVjJ2GClyYwjJDiWjrFzuNvIlI3pHPKaAr0FQP3V/XxylZX+syfrE9uH8mCfzprzfTSsL5eXXdN4RsC2rqsKmdv107V/qPmbguROPSi0O/YzPMoU4OXHLMr3r8I0DgoPNWwWr/vY2yyAQALweBaYrfMvsm69JYka4HWWpT024fNIvzHHuZsxvGYVf/UL9sa6ixiaNvBHWLDszBq+Qd0pmB9wQ5nLtCM1Eh82k5TGGmS7stMIAn5KCfXiBaw+f4Rr3A2gMLPRt79Iu+ICLF4CZ/tTdpY7FvhbBHnvscErq8hd0MZokBqtSYvQT4AytFyCpY0yiH2mGOOQp8EgmpiX0uI0tZVqosZVnAfyGpEI5nRFAQ6ahLhgxOFCmK3nrIblTnVmxY+wA/CEgoQTRnJKt4ltpnc87FrxEnhSuc+FYvcOheSSGJsoctULbU7xbREhk/hd3YOoB8OFhzu3MbJUj9WeJw8zTA3vXIRojbPSVbTqIgKwq/FEkAdjxjNkEqFeSCkpcvCcW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(83380400001)(316002)(5660300002)(38100700002)(186003)(26005)(44832011)(6496006)(6486002)(2616005)(450100002)(6916009)(956004)(8936002)(4326008)(36756003)(86362001)(8676002)(66946007)(66476007)(66556008)(508600001)(6666004)(2906002)(107886003)(1076003)(9126006);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iwpLuVAIsRwozsqv8MOQOmSGOnY3zz+wzugjL5CRIG2sW1Im0BGcCImyR5XC?=
	=?us-ascii?Q?+FuyxbE4CfYtCX4LjyY+IyRTERFa/7t0JLy/LyZdMxuvSLoADxiQl2XHBshb?=
	=?us-ascii?Q?3GZfMZdXq3NSeeyaQmFyIW194CRhNEX0TMd0McMjCAyTSqA15F1uS0s6btuw?=
	=?us-ascii?Q?9lVffO05hGtdmDryzNAsdgzpZ0ror7SJ/PsCiJjcwRUiY69d+W+f7RjbbNC2?=
	=?us-ascii?Q?YOnsei9OVPOMfThm+o7rOKJLhuBSt4ZyN8QBKwlWKH/4CtDlvnNJMWi9CJC3?=
	=?us-ascii?Q?JtRIQpoDWSWfl3/UCghDHTik+DNFBk9xCEmFZE/+juODEDAs20lMTnatflse?=
	=?us-ascii?Q?pxvF7cmsMv3AnVoJhkrbhX3Cr/mKU1pRoVjqMgYfuWyCdBt56U0+t+Y3eti8?=
	=?us-ascii?Q?cenDgUtaWoeiVgvbh/GogojYwkREhvNk+1Af127w9Lrhkn8HopfP4yp7s81G?=
	=?us-ascii?Q?SvWE740OcQxTYQGpNta34CzYE0NdpJLiDVNXBgXx8n09ET9S0NjEqUOGbgYs?=
	=?us-ascii?Q?H0NZvULqE5XaTMqyhBSWeE6Nkgy+DnlMK9TnZhfqLSAqDBmpWsqDj7kmW8fm?=
	=?us-ascii?Q?wqfX0dQtnjcAABFhZKPvPeb1/HYfOVHr/mYr4VrDE5Kw2nnRN6VFD4Zu0aC7?=
	=?us-ascii?Q?YjMscEmTV2wk3vspQiVOc84Jlu1kIj4xWa4oLZr7EEopDYs+Q+I3uelKQNSk?=
	=?us-ascii?Q?Rm01pcRehF25N3vU2YvoZEwmdKWTKDXDM0fBU+K/3IfHnr4OLOK2b/wmaJdO?=
	=?us-ascii?Q?WthtiF+GRx2DbprHuEvL3rMMaQlX33eb1A0fa2uMok/uuXCE76zxYdZxYwOG?=
	=?us-ascii?Q?1sDFUmq+LUhPix+fesPs7YmGmTpNTj2oaVANpepBxYn9WgzsiIJ+YWApQxkK?=
	=?us-ascii?Q?ZPMSJcQ9qtZU+g3lNPTr8napVa+gfeVpVnGA9gTZjtyMfDPD15AwR23DQzm1?=
	=?us-ascii?Q?B9Vc1fibGCLGh0suC/TwQYewsyIMxhiGiZ297OErgmD8VkWxWUPb7WrCJfeT?=
	=?us-ascii?Q?5zTCi2rvVm4qrlQPkkTbdAyvqup0Do/qU40fg8fzUCtj06rtqp1v8+6H+tcf?=
	=?us-ascii?Q?wIhBI32QkUx0qF3gU8JjgJmpTkp0LbPaWzuVTYPiRIeYNrDJ777gqdFIWMFb?=
	=?us-ascii?Q?+cpDN+hAdu013yDfLtjiEvaWzsHNd6hWag9pSmG+Tw/R8o9tY0rH7+CjUyJ8?=
	=?us-ascii?Q?9BSNAHphJCZ1LZe4hlZJ3llQ0TGtQu4nicOrVryDs3GWxRYYOilosq93RyG5?=
	=?us-ascii?Q?DZgaPxT5CjkPDWUeNmyQ0iB5KYKgkDu6c3MpmEdO1L1sOIkNY5NEh1Ne9B/e?=
	=?us-ascii?Q?uvARQ8wGXIClW+lrr4kYjVpf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f05dad87-72af-46d1-2c07-08d9802fd6d3
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2021 14:22:00.6707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IPnTfTDKSRvj7xZ7ngQEwg8YhEkTyIPHlokDMfaALBcLC4vqTjoaQ3b4Rkiz2otxfF2z6WR49vrriwUnVBNA+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7066
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18PEMDgN014640
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, zzhou@suse.com
Subject: [Cluster-devel] [PATCH 2/5] man: add reload_config in dlm_tool &
	dlm.conf
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
 dlm_controld/dlm.conf.5 | 42 ++++++++++++++++++++++++++++++-----------
 dlm_tool/dlm_tool.8     | 11 +++++++++++
 2 files changed, 42 insertions(+), 11 deletions(-)

diff --git a/dlm_controld/dlm.conf.5 b/dlm_controld/dlm.conf.5
index 1ce0c6445ee1..99e302a92bd2 100644
--- a/dlm_controld/dlm.conf.5
+++ b/dlm_controld/dlm.conf.5
@@ -34,7 +34,9 @@ protocol=tcp
 
 Options:
 
-log_debug
+daemon_debug(*)
+.br
+log_debug(*)
 .br
 protocol
 .br
@@ -42,23 +44,23 @@ bind_all
 .br
 mark
 .br
-debug_logfile
+debug_logfile(*)
 .br
 enable_plock
 .br
-plock_debug
+plock_debug(*)
 .br
-plock_rate_limit
+plock_rate_limit(*)
 .br
 plock_ownership
 .br
-drop_resources_time
+drop_resources_time(*)
 .br
-drop_resources_count
+drop_resources_count(*)
 .br
-drop_resources_age
+drop_resources_age(*)
 .br
-post_join_delay
+post_join_delay(*)
 .br
 enable_fencing
 .br
@@ -66,15 +68,33 @@ enable_concurrent_fencing
 .br
 enable_startup_fencing
 .br
-enable_quorum_fencing
+enable_quorum_fencing(*)
 .br
-enable_quorum_lockspace
+enable_quorum_lockspace(*)
 .br
-repeat_failed_fencing
+repeat_failed_fencing(*)
 .br
 enable_helper
 .br
 
+Option with tail (*) means this item can be reload on the fly by "dlm_tool reload_config". See \fB"Reload config"\fP for more examples.
+
+.SH Reload config
+
+dlm.conf can be changed then reloaded some settings on the fly, it gives users more flexible and powerful ability to manage dlm.
+
+The supported reload operations:
+.br
+- add a new item
+.br
+- remove an exist item
+.br
+- commented out an item
+.br
+- change an item value
+
+After modifying settings in dlm.conf, run "dlm_tool reload_config" to take effect. User can use "dlm_tool dump_config" to check the result. Again, only reloadable item can be changed.
+
 .SH Fencing
 
 A fence device definition begins with a
diff --git a/dlm_tool/dlm_tool.8 b/dlm_tool/dlm_tool.8
index 056c4af0213c..e1242308302f 100644
--- a/dlm_tool/dlm_tool.8
+++ b/dlm_tool/dlm_tool.8
@@ -28,6 +28,10 @@ dlm_tool \- a utility for the dlm and dlm_controld daemon
 .br
 	Dump dlm_controld config settings.
 
+.B reload_config
+.br
+	Reload dlm_controld config settings from dlm.conf.
+
 .BI fence_ack " nodeid"
 .br
 	Quit trying to fence a node.
@@ -134,6 +138,13 @@ dlm_tool dump_config
 
 -
 
+dlm_tool reload_config
+.RS 4
+see examples in \fBdlm.conf(5)\fP
+.RE
+
+-
+
 dlm_tool fence_ack \fIls-name\fP
 
 -
-- 
2.32.0


