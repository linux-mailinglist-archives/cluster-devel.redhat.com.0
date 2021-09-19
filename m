Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9D204410A7B
	for <lists+cluster-devel@lfdr.de>; Sun, 19 Sep 2021 08:47:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-mI9lmR8FN8GzbCrc8Gh4Aw-1; Sun, 19 Sep 2021 02:47:26 -0400
X-MC-Unique: mI9lmR8FN8GzbCrc8Gh4Aw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A04CB362FE;
	Sun, 19 Sep 2021 06:47:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90C7860C0F;
	Sun, 19 Sep 2021 06:47:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E88F4EA2A;
	Sun, 19 Sep 2021 06:47:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18J6iAUH030432 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 19 Sep 2021 02:44:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 75481111287A; Sun, 19 Sep 2021 06:44:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ED681111C69
	for <cluster-devel@redhat.com>; Sun, 19 Sep 2021 06:44:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13E5791C7D9
	for <cluster-devel@redhat.com>; Sun, 19 Sep 2021 06:44:03 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-504-uwTCpAFlPwudV7gS3mbX8w-1;
	Sun, 19 Sep 2021 02:44:01 -0400
X-MC-Unique: uwTCpAFlPwudV7gS3mbX8w-1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-24-Cd3ZreijMQ6WfjL3cBMP7A-2; Sun, 19 Sep 2021 08:43:59 +0200
X-MC-Unique: Cd3ZreijMQ6WfjL3cBMP7A-2
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB7PR04MB5113.eurprd04.prod.outlook.com (2603:10a6:10:14::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4523.14; Sun, 19 Sep 2021 06:43:58 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d]) by DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d%6]) with mapi id 15.20.4523.018;
	Sun, 19 Sep 2021 06:43:57 +0000
From: Heming Zhao <heming.zhao@suse.com>
To: teigland@redhat.com, aahringo@redhat.com, cluster-devel@redhat.com
Date: Sun, 19 Sep 2021 14:43:16 +0800
Message-ID: <20210919064322.1670-5-heming.zhao@suse.com>
In-Reply-To: <20210919064322.1670-1-heming.zhao@suse.com>
References: <20210919064322.1670-1-heming.zhao@suse.com>
X-ClientProxiedBy: HK2PR02CA0194.apcprd02.prod.outlook.com
	(2603:1096:201:21::30) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (123.123.135.184) by
	HK2PR02CA0194.apcprd02.prod.outlook.com (2603:1096:201:21::30)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14
	via Frontend Transport; Sun, 19 Sep 2021 06:43:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8190dda7-c57a-4c97-0703-08d97b38db41
X-MS-TrafficTypeDiagnostic: DB7PR04MB5113:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB511398C9C24E31D52308599797DF9@DB7PR04MB5113.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: GozGRLuBoGAX2fNRzZY/+FD1Uw3yQCvJZvPsjZWdD5kTiS0PFtg/0vX+ViRBRgHyj50Cta+9nWdJqJaEgUtQO9eXyN9jm/2b0lDt2bbu9LiQevrvbMbg0X7nRkLsnqXpJ07BysA+FgS/uSsJD0DuxP93KWdZUTe7VraGo+Z8VxpZptYQ+vZcDUsCdhGnRGSx21ubETwFCVxHHohFaPj9jLLD5gwIGuZ8dNiCTHi/7c+mkIOLB0akpVyME+IxAKuCT27IzGXLrSzcLI7NfCcbPl9HHUcD+dgCd+bmQdKaBeIq6q9qVUGHrUxpIqYaRPOrDSWmiKjQnyEtU0F3Ej+J9woJ1/77o04Hxf92k92xk0NuMx+4gEq0ETcLQwaQ/vDAN9AX6ETP0QC8arcfAXLSQOTKigNUSovFZSJmEnheBxbDRfiS+X0AhnxZP0zZRiRwT6fuB+kD7MbmO/UN9zGWDfQhkyFAWKxxJ2A28FodfWu9Ij7tSFF29NcQOYA0UrETYYOtTE+sa6lkYPoTQJOnup0iPiQSUIEQaOoI6l5Rhv3tpF93wVflVe1vvyZKkWnt0Xl9juAS8RbMi2yRFV/ua4KtjDRrJDeurIl5llazkSeDTg5tyM/4TUa6NfMWToE73i690U6ZmhMZbZLkvxfBDCDn4MeU2GG837NwGY4q0BgeUWob74l2q4pZiLjy33mH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(136003)(366004)(39850400004)(396003)(346002)(376002)(66476007)(8676002)(8936002)(86362001)(6486002)(2906002)(478600001)(36756003)(5660300002)(66556008)(66946007)(6496006)(956004)(2616005)(450100002)(1076003)(26005)(107886003)(38100700002)(316002)(83380400001)(186003)(44832011)(4326008)(6666004)(9126006);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KZ7lY3FgP1BEe/b06MypsxsdvQL+SUk9hJgxzkzLiRoP+JHW/X0KINNAAydD?=
	=?us-ascii?Q?7eXFDCGNO0CC9tSisYZ82fT0A5WhuHTz10cOxmJEB/AGKIHTuRYMX6RdNqNa?=
	=?us-ascii?Q?WrDEZUMjEzRsbc7hN7S9X0xojpvuKJMWOB0939LGbfr4zUa+rvXs9ZFHuZ90?=
	=?us-ascii?Q?qd1hkrbJKAA4bUb6gZZHgq9jvvfyTvC5Xl40LSBRcSzBS0fsxGcHzIcie23y?=
	=?us-ascii?Q?iRMdxbV1csUlfxXoJcd1EkwUja1GUXj+p26RlPSKQ/es5eCWy1AWqKrQdYpS?=
	=?us-ascii?Q?Pg4rXB/s7o0FNKElyg+PJ1pEBp0TUaX3Td7WPg+sNlqBVJc3R3eIESJ5Ikqx?=
	=?us-ascii?Q?QE3VNMUzaJ67kKs0d9bHb439moPHYzPwpHfFzu7n2oWeX/d3KOlo0xalIgsA?=
	=?us-ascii?Q?Ahrbvkt+McDjr12dskUHdtR/FSmM31FsFvDunpYJ9wn/3VmyL17uCf3K/8v0?=
	=?us-ascii?Q?i3uW2VFP1Vy2XuhhZLAmDSx/dNwkXfB0CXTxdmJjijSU1TGqmUWy3uPAS8T0?=
	=?us-ascii?Q?mkA/rvncceV7iN04dA1uXuNZxedOn1EbWhib3UtIMW/Zk/edGmfh0MM80tml?=
	=?us-ascii?Q?smPAyvl1ChfYc65/AM4KZZvk4Ekb+MxaBz0XhV/eP3hzSQ9itEIvlo/d6dgG?=
	=?us-ascii?Q?w6BlT5ik70XaNOzacOzwqRyIJayvhAP2tAjtSa+m4AL/Pt6cEpU3pm6Bb15q?=
	=?us-ascii?Q?TtXJWseErHEoRpnIoG+sIwM9qsnUOet4FuXpZTid79wv3L5rYITqYx6vSZz4?=
	=?us-ascii?Q?14srgw59o00kEkSsPF3yoWxyo8eKs1SeE9hMGs5N12c+jPFp5PE6+3aqLreR?=
	=?us-ascii?Q?iekSciufihj5ff4HD1BB/7Y5/EzMgQbkhergQ5TSrauR6fIVhj0TeOuvHZyT?=
	=?us-ascii?Q?sfGvAmt72GL0ebJv/C2yMZ8K2dIsx2Dz3dbrOfnMkA9Na6zkQ9xYOhk5llhD?=
	=?us-ascii?Q?6NnvSvOXoHPkoZcRxWo8X3ShTkWuA8m8MxtZ7zPDM/bDIPrdQcDqYCXxuZJ5?=
	=?us-ascii?Q?Qm68EkzO86aJwBi/uhXIvjRZwcuzZcwujs41z1OUEAWzTkrMJn13/8dhq9lg?=
	=?us-ascii?Q?X7klBHS5zeHmtkMKZdFeimJHD3cpinD9xaxGpqKAARGChYh9vsYjHDO5u65w?=
	=?us-ascii?Q?gfcyFT23/oL0WK3ARwFOGevalJjpkenNepcNDc4m5BUnr9/L0Eh2cJwLQYe1?=
	=?us-ascii?Q?8GN3H9+5gCpPF0UG366npzq82/UU5tQ5grFKtc68X+hAU2W5w17UrIfqjS8o?=
	=?us-ascii?Q?7phX9NQZ6zb1PkRiAnMV7GDNR++WSRpfCuI53kPzL4k5fd0zmdxEyxrEKZ3r?=
	=?us-ascii?Q?L5aXiu6mOZGL1iEgQBscRIj3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8190dda7-c57a-4c97-0703-08d97b38db41
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2021 06:43:57.9048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b02A2JvsAiujzubylL4dRaGPNAK2jJT/O/CMv1cwl1dt5eEhSQWCZFu7GTRcblEBYKS8MTqaKbzE1zY2rzLZoA==
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18J6iAUH030432
X-loop: cluster-devel@redhat.com
Cc: zzhou@suse.com
Subject: [Cluster-devel] [PATCH 04/10] dlm_controld: put MAX_LINE in header
	file
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Signed-off-by: Heming Zhao <heming.zhao@suse.com>
---
 dlm_controld/config.c      | 4 ----
 dlm_controld/dlm_daemon.h  | 3 +++
 dlm_controld/node_config.c | 2 --
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/dlm_controld/config.c b/dlm_controld/config.c
index 947480dabe85..d77f3826bfe6 100644
--- a/dlm_controld/config.c
+++ b/dlm_controld/config.c
@@ -21,10 +21,6 @@ master node=2 weight=1
 
 #endif
 
-/* The max line length in dlm.conf */
-
-#define MAX_LINE 256
-
 int get_weight(struct lockspace *ls, int nodeid)
 {
 	int i;
diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index 436fc9109aa6..eae17a28c749 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -220,6 +220,9 @@ void log_level(char *name_in, uint32_t level_in, const char *fmt, ...);
 #define log_dlock(ls, fmt, args...) log_level((ls)->name, LOG_PLOCK|LOG_DEBUG, fmt, ##args)
 #define log_elock(ls, fmt, args...) log_level((ls)->name, LOG_PLOCK|LOG_ERR, fmt, ##args)
 
+/* The max line length in dlm.conf */
+#define MAX_LINE 256
+
 /* dlm_header types */
 enum {
 	DLM_MSG_PROTOCOL = 1,
diff --git a/dlm_controld/node_config.c b/dlm_controld/node_config.c
index fe794be72f22..0889451848b9 100644
--- a/dlm_controld/node_config.c
+++ b/dlm_controld/node_config.c
@@ -8,8 +8,6 @@
 
 #include "dlm_daemon.h"
 
-#define MAX_LINE 4096
-
 static struct node_config nc[MAX_NODES];
 
 static const struct node_config nc_default = {
-- 
2.32.0


