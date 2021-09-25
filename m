Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 367BF4182A8
	for <lists+cluster-devel@lfdr.de>; Sat, 25 Sep 2021 16:24:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-Aseu2fZqOGC5SJTf_0rfiw-1; Sat, 25 Sep 2021 10:24:11 -0400
X-MC-Unique: Aseu2fZqOGC5SJTf_0rfiw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB7421808309;
	Sat, 25 Sep 2021 14:24:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBB205C1D0;
	Sat, 25 Sep 2021 14:24:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C974D1801241;
	Sat, 25 Sep 2021 14:24:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18PEM34R014618 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 25 Sep 2021 10:22:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 33B1A20A8C1F; Sat, 25 Sep 2021 14:22:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D83E20A8C39
	for <cluster-devel@redhat.com>; Sat, 25 Sep 2021 14:21:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB71C8556F4
	for <cluster-devel@redhat.com>; Sat, 25 Sep 2021 14:21:59 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-250-9nkiWMivPfm5tm2CXlhD2Q-1;
	Sat, 25 Sep 2021 10:21:58 -0400
X-MC-Unique: 9nkiWMivPfm5tm2CXlhD2Q-1
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-6-nL96vepVMUGDGlwNsbMo4g-1; Sat, 25 Sep 2021 16:21:55 +0200
X-MC-Unique: nL96vepVMUGDGlwNsbMo4g-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB8PR04MB7066.eurprd04.prod.outlook.com (2603:10a6:10:12e::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4544.18; Sat, 25 Sep 2021 14:21:54 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d]) by DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d%6]) with mapi id 15.20.4544.020;
	Sat, 25 Sep 2021 14:21:54 +0000
From: Heming Zhao <heming.zhao@suse.com>
To: teigland@redhat.com
Date: Sat, 25 Sep 2021 22:21:38 +0800
Message-ID: <20210925142142.1821-2-heming.zhao@suse.com>
In-Reply-To: <20210925142142.1821-1-heming.zhao@suse.com>
References: <20210925142142.1821-1-heming.zhao@suse.com>
X-ClientProxiedBy: HKAPR03CA0006.apcprd03.prod.outlook.com
	(2603:1096:203:c8::11) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
Received: from localhost (123.123.135.254) by
	HKAPR03CA0006.apcprd03.prod.outlook.com (2603:1096:203:c8::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.7
	via Frontend Transport; Sat, 25 Sep 2021 14:21:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a1ae864-2840-4a4a-f05e-08d9802fd32e
X-MS-TrafficTypeDiagnostic: DB8PR04MB7066:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB70665B0B182660655389B35097A59@DB8PR04MB7066.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: ZlO6gfKAggDkJaKC01lI1xz33vq/pjC4uigXreCfKFQCeW347J4aokGfPWBCPpTSyf+VTyPM+v6YAikHHDm2WaHOm5QKEfbhtLz4SNfSAzP/zwq3+vU6NwnXXaTLzH+yZyQFiI1NfFhf645WWJtGA2DZbsqGv/oJg6JcnQSgt/Bapbo6eq3UGEF0gAI7w3Lt7THdNePgk41cj32po7ej+8nmnan3A0PPT986WXBEfDUV3I+HX/Bq7YcdZGd8+R1tOa1aHycEU9CEqNgBFCgznj/aY1EKxplKrnUjWBjdyIw6kaPDG2QRQiG8xmnqQ1Ge9HW6EjyGWSW59nVJjIhoIIw8+Z65Ob1C1QOsTnczoIndquG3kA5VTo1jOzd8DA5nmWNvOA9GwHQCRmPdzhtOWM+NpGHIs/zAkQ2ulg5BlInkn2YGnk7qkJSRU/9L6dJWYc9n/OrQ3KhB9kF6GhjMNPkjmZOPXcIgLUy3SU8qbn0hi5nxuO2lUJvCGzWu0wc8s/ZHZqnika0swZc7h/L1JalvWGcYGyCSyj4Os2Rn65McgBcO7R55OtNzV+jAasLRQtZUNRiS9u6SHnTMRiAk7T7669orh76Ngyd305a8AwXCFtWv4Fx7hM4hxhpIm+SZzMU1bYpSz5pCcEsOS+ghxkG7XJNRf/HgJTbIsu+EJLRmnHL58n+g7sDDRllTZATg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(83380400001)(316002)(5660300002)(38100700002)(186003)(26005)(44832011)(6496006)(6486002)(2616005)(450100002)(6916009)(956004)(8936002)(4326008)(36756003)(86362001)(8676002)(66946007)(66476007)(66556008)(508600001)(6666004)(2906002)(107886003)(1076003)(9126006);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f3+x4nga3jJREM8xI4TC8snuQp3Mb6+0eQxHF5bAUTRPTG52nOIjljrw8TLG?=
	=?us-ascii?Q?tjehfPoeNWiZPJA4d/vdbWqiMfoZGgbbSj65vkU6tsNhTH/5XSEMIBMH2xDr?=
	=?us-ascii?Q?yAVJZUGSzH1Ww8AE2y8+N7UBTlNZzfqloJSa7W022VbfMUvP9MWoI07Y8ITL?=
	=?us-ascii?Q?QF3SvoTejn8AtzIv8I93+mS6k6gZp+Z3qp6qISD8/yHxgGpmvlquKJkWMADF?=
	=?us-ascii?Q?1jdAf5kRmTlzx5ZmZEttCe0pOf53gmcwA+ZkcVrZOVTKiP2FkXiypDb+G8AO?=
	=?us-ascii?Q?ZRZPAay2zlxzGCVOD2WDNVa0HoedFzkvpExn7DvmteQPA1U1DwlnVTfzuVeh?=
	=?us-ascii?Q?SIhxZBDI/8zq15EKxSmAVbFpft90bTEzGgp+Rmc/TIIDqKxImq6rSpctLzeP?=
	=?us-ascii?Q?taWiEgA/CMAshMY+p+7j8M4w4F5fD42MoqE2DaK7gsCXpmfud/rNtgjHuWiA?=
	=?us-ascii?Q?BDUI9SXqXCfa3Rn1+FXwXKbXCybOgYBmcC7mzBmSd96J1Qrt05KyamQO1caK?=
	=?us-ascii?Q?XgrT2braMMuvUSDCrqreBzHhB/sVTrXnNI/CvxLuUJJBhg3Dh9pbsgKpAUWS?=
	=?us-ascii?Q?OGLrUy/qaR9rN/ZXP/JgTy2/nI1dnYj3J/ab1F2KHzty51Ey485YEazrNzB9?=
	=?us-ascii?Q?KUpFC3V4W5AWEdlpDiXZvJkobvMLXJJscCRDQMyPieHUzFutfYCudQaakgfZ?=
	=?us-ascii?Q?nyVn4wd3JDhYAxDKBcfDKEtT2OujXaKaYwZBdtls0uv/bgeE4Gh5RwmRQXlq?=
	=?us-ascii?Q?Mu/f35nb2txPEI7ebNGz9g6FDZxRniiPDN/mVvUKJAosXvInf/ajPW5xTFFv?=
	=?us-ascii?Q?6vVJGLaCeHsAMKZrFdXUlC4LrfD5DNJ88o2TWxhhmSwpKWJ663A/al37uies?=
	=?us-ascii?Q?WlC02v01GmzD8Lrf5abGlMiVX8yUa2z+8i/XyXOjag1/wEy0sod+yAv7BJou?=
	=?us-ascii?Q?gmvL9DJfssBqwuVXtZ2x9/i2Pb5y5VDV4liU9VKkq1W7p+sytugSDI1b7EpK?=
	=?us-ascii?Q?AwyL5WvdlcA8WMWI64yFLtWTmVpaBI6K2i9SHEqCgFmYY7tfo2zHh2I0z1tF?=
	=?us-ascii?Q?vn+Jt7ePG9+XipH2KLCNKiKwlUaErZq29XKEced/GsV5D0LWHu7z7kN00AB5?=
	=?us-ascii?Q?siNj648F6Yh7B/QedKtUaRZSbVfdTteMfdh6MMnThjtljb9aO01Quk2jPaa0?=
	=?us-ascii?Q?/hd1QXLXOJATEnGLOgCD8UcmCQ9E+m0fsO4+Ef100KE52zh1a0lr0u1+oHlj?=
	=?us-ascii?Q?i1CQZf7CpGbnUCFge5hHIDO+xaFR0WkQanvwP5a28OmeJ+8GMOmyXGXZlA2f?=
	=?us-ascii?Q?bjJdENLigGyu5Sg6Y6KxZQ8e?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1ae864-2840-4a4a-f05e-08d9802fd32e
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2021 14:21:54.7691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zf0XH7Eq+Pzy/lwP3v2WQQFjRhEuDFEYKEnamuLYpev8Fm/EW9Vm097Xw7XfnECJi5NTyLtKt3KzbemlpTTnXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7066
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18PEM34R014618
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, zzhou@suse.com
Subject: [Cluster-devel] [PATCH 1/5] dlm_tool man: add command "joinleave",
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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


