Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D01E3410A70
	for <lists+cluster-devel@lfdr.de>; Sun, 19 Sep 2021 08:46:26 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-XX1MgoDiPpq9KeyfAi3Pjg-1; Sun, 19 Sep 2021 02:46:24 -0400
X-MC-Unique: XX1MgoDiPpq9KeyfAi3Pjg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24FB0802935;
	Sun, 19 Sep 2021 06:46:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A2615C1A3;
	Sun, 19 Sep 2021 06:46:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 138201801241;
	Sun, 19 Sep 2021 06:46:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18J6hqWA030401 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 19 Sep 2021 02:43:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D693F202E4B9; Sun, 19 Sep 2021 06:43:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEC67200B68D
	for <cluster-devel@redhat.com>; Sun, 19 Sep 2021 06:43:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41B2C1066680
	for <cluster-devel@redhat.com>; Sun, 19 Sep 2021 06:43:50 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-593-2Fyig_PsOLe45hlanOhG6w-1;
	Sun, 19 Sep 2021 02:43:46 -0400
X-MC-Unique: 2Fyig_PsOLe45hlanOhG6w-1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-18-dpuD9zZKMqmImMkECXyAnA-1; Sun, 19 Sep 2021 08:43:44 +0200
X-MC-Unique: dpuD9zZKMqmImMkECXyAnA-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB7PR04MB5113.eurprd04.prod.outlook.com (2603:10a6:10:14::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4523.14; Sun, 19 Sep 2021 06:43:43 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d]) by DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d%6]) with mapi id 15.20.4523.018;
	Sun, 19 Sep 2021 06:43:43 +0000
From: Heming Zhao <heming.zhao@suse.com>
To: teigland@redhat.com, aahringo@redhat.com, cluster-devel@redhat.com
Date: Sun, 19 Sep 2021 14:43:14 +0800
Message-ID: <20210919064322.1670-3-heming.zhao@suse.com>
In-Reply-To: <20210919064322.1670-1-heming.zhao@suse.com>
References: <20210919064322.1670-1-heming.zhao@suse.com>
X-ClientProxiedBy: HK2PR0302CA0022.apcprd03.prod.outlook.com
	(2603:1096:202::32) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (123.123.135.184) by
	HK2PR0302CA0022.apcprd03.prod.outlook.com (2603:1096:202::32)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.10
	via Frontend Transport; Sun, 19 Sep 2021 06:43:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68c93852-2f0c-4938-c523-08d97b38d2a8
X-MS-TrafficTypeDiagnostic: DB7PR04MB5113:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB511360E40C63284D5D55ADF997DF9@DB7PR04MB5113.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: EHw2wb1BYmqZvaLPG7S6ZawZjkQi8UcvI5wV3zEpMhCLYZ2Cd53pCzPXvGcdRp3bUhA25oifvbIPr5rXBnrgLZGG0yMM306+cuQQfeXPINUQnYPCT+o2JpuVFVazaPXkEEL+fvvOx1XGSg7OqBbbnpGPYsvvyYsqXXBLHuWyvCAZHr3JdpTOPPbJQv/PnmiGCuVdtW1njUT6g5+45V1IGlhbY5jN1RIubmBUojhumbifuKqKk+Pk2gciY8bWHxD/MCnxdgZZuNPLIyRR1gNEttaQjjG7N9HxzLctG+9jgfhszLr8FQDHRSbXMBw3j006riGqNZAiJfg08Nwlamrl16y6MSoEjgxTXLor5MFWENAsZ7JYBFNk9Pw9edo7D37dZ3Mt1t/y3g+vEZWPKHKo3uFxePlslppV7O58HC1qQBpMECfY5xKKD/x6L+GEiYg0TvaYhKelTd4Lrz70i9v6X9NN1u3T/YGwkfLqMKw6qUIu39VVpqGzYrQbvJUfDueyDIEQDbYWqA78TVRkPesy1OJch2KFYWfxqz3skWMdHurhmt/pDtZex3vernHlAuuYBxFGbv5M5H+YFGTdlArXBfVRSp+ok3ZPwIlZqNzICvj6R9fRtas5lUcLYUdUy9o7+zLe9exuz9pXBLJhJLJN5zDoP0btdBCNKXGRdK5BIeeei4Gl/1qollrIXkqAu+It
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(136003)(366004)(39850400004)(396003)(346002)(376002)(66476007)(8676002)(8936002)(86362001)(6486002)(2906002)(478600001)(36756003)(5660300002)(66556008)(66946007)(6496006)(956004)(2616005)(450100002)(1076003)(26005)(107886003)(38100700002)(316002)(83380400001)(186003)(44832011)(4326008)(6666004)(9126006);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L3/D/X5H29BP4cBiBfWyAxo+aFUPztwCaF2QbzMLNFer6K7AkXINEThdq1jW?=
	=?us-ascii?Q?SUPp21TyYqnypqk8sNjHfTq8VGlewTXt4bZtTBa4bTFom6a3R3YTMCGK+oRB?=
	=?us-ascii?Q?R+7VF7b0wdSAZMnSEVCWbWqEZYqYYpZ+FhonfL8+gt7NLuYboPy0G51gA+Oh?=
	=?us-ascii?Q?E8nC8LzSNLkc6SVZXE6pBVGG3i5msPdyORtgqY5bzHyjJdFXI6fTMyffaLuP?=
	=?us-ascii?Q?z1plJIH6gqNyXtWhHErHHvkw8ib+ZYCwMm/WpsLOtCRR3qp8AiwB6t4ij4FH?=
	=?us-ascii?Q?Dpn2XiPaDY52Jcp6sgCgj5tHdXzmgSTXB3KdCfxRnAfHFfahQIVlwirh8EIg?=
	=?us-ascii?Q?rhQYnSdXXeoY0hxKg8LKQ++bTgxgou6QSYq5t1UAth5nUzA8McjmdfK6Rogr?=
	=?us-ascii?Q?qS2c/WUcJONOMWHRN8hYR6osNFH7I4UVvGc6gNWB4223ujWME04JMg2aZnsL?=
	=?us-ascii?Q?BSxWiXWw1c5Xb23XWIaYbmHEibrQ1G4c08CHDmAY2wcLcFLIp4dlncaD4QaP?=
	=?us-ascii?Q?+oj+nEby/6ElnRSwQa0oeNIYPhxagyGC1msAVHKX1v9fSMWEaMa9mBCkDdIp?=
	=?us-ascii?Q?VP9yoJ4qxXUTVfUCXMFF+eAQYx/1jt05gqSuLSTDEL3sInkV69GrOAz7z7jM?=
	=?us-ascii?Q?yq1asKzdB/3W5F5WaiyIuePhJ7ixrqG6QYmllsKmpBrIHctTVVlkY4dDm9V7?=
	=?us-ascii?Q?oxny9zioi3PvIlvyBieQoyrW9xulzKhdwGlstwvoJ/UtFdTh7sk3j9IJ3JKd?=
	=?us-ascii?Q?wNamsvm/BBWT5C8VTcoEKUyqoOzYJtveQq9Hu7l6mVtQEew11rfA333xQwR8?=
	=?us-ascii?Q?Q/XvRGJzyFoGXSNgP4cHFKTFDN+9RH5ssMKiIqyI2ha+eF/GR1Xb19+cOVGA?=
	=?us-ascii?Q?rQDllkMRYuIY6wHMQHb5YHyYsFn5Tf39Q8Bi+azlQ6IMuK0RTJQxPmxN0bW0?=
	=?us-ascii?Q?9dgw64wc00DvjBiQIIosD0tIPkuTLRDwDWbkyd3GuuBnGoKEWa47LBubb6oZ?=
	=?us-ascii?Q?m2L/v3znz6Px0j51gbawyDbuu1IThKxWEVNe/XeETaZCErOcIeHtt+tCi4u4?=
	=?us-ascii?Q?FxpwCqD/i76EjNSNXZz0c9VphtNL00a+Nn0LID4VDH5aW1i3WH4SxfUtJAwo?=
	=?us-ascii?Q?9GhoiyYhjCr7lFLpnY0gc3gfyD0kdaMm6GhfNPykxj3dvaadGpSzeiIaGa3+?=
	=?us-ascii?Q?uDqqhHh9VpLmIU0452XzpoEWdKi0tovqhN8ggww6wpCRSeGS2dFMdSfRQGCQ?=
	=?us-ascii?Q?Cn/H5bxmoJnfsI9zIyiKmK7orROxUYpSJGZOQSUPHuREOVuD1jqmmgsOwOsw?=
	=?us-ascii?Q?AdyZ8r+hVh75E6/axW4FWiDV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c93852-2f0c-4938-c523-08d97b38d2a8
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2021 06:43:43.4088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eUWdDc++zWziRcMcFaizEWwSEJs9aAuUkmISrTT5nACQW5r5aEJWcI8tTIfV1MsBggHSQ6lmnOaJE9K52DAH+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5113
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18J6hqWA030401
X-loop: cluster-devel@redhat.com
Cc: zzhou@suse.com
Subject: [Cluster-devel] [PATCH 02/10] dlm_tool: add run_(check|cancel) all
	feature
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

Current run_check and run_cancel require uuid for executing.
If users want to check/cancel all commands, they must input every
command uuid, which is a boring action.
This commit add a new option "-A", which makes one time travel
all the command without uuid.

Signed-off-by: Heming Zhao <heming.zhao@suse.com>
---
 dlm_tool/dlm_tool.8 |  5 ++-
 dlm_tool/main.c     | 80 ++++++++++++++++++++++++++++++++-------------
 2 files changed, 62 insertions(+), 23 deletions(-)

diff --git a/dlm_tool/dlm_tool.8 b/dlm_tool/dlm_tool.8
index 056c4af0213c..086596c67dbf 100644
--- a/dlm_tool/dlm_tool.8
+++ b/dlm_tool/dlm_tool.8
@@ -110,6 +110,9 @@ Wide lockdebug output
 .B \-M
 Include MSTCPY locks in lockdump output
 
+.B \-A
+Include all uuid in run_check and run_cancel
+
 .B \-h
 Print help, then exit
 
@@ -177,7 +180,7 @@ dlm_tool run|run_start [-n] \fIcommand\fP
 
 -
 
-dlm_tool run_check|run_cancel [-i "sec"] \fIuuid\fP
+dlm_tool run_check|run_cancel [-A] [-i "sec"] \fIuuid\fP
 
 -
 
diff --git a/dlm_tool/main.c b/dlm_tool/main.c
index 53d9336d59c6..37f381f6d980 100644
--- a/dlm_tool/main.c
+++ b/dlm_tool/main.c
@@ -53,6 +53,7 @@ static char *lsname;
 static int operation;
 static int opt_ind;
 static int ls_all_nodes = 0;
+static int opt_all_uuid = 0;
 static int opt_excl = 0;
 static int opt_fs = 0;
 static int dump_mstcpy = 0;
@@ -215,7 +216,7 @@ static void print_usage(void)
 	printf("\n");
 }
 
-#define OPTION_STRING "MhVnm:e:f:vwsi:"
+#define OPTION_STRING "MhVAnm:e:f:vwsi:"
 
 static void decode_arguments(int argc, char **argv)
 {
@@ -254,6 +255,10 @@ static void decode_arguments(int argc, char **argv)
 			ls_all_nodes = 1;
 			break;
 
+		case 'A':
+			opt_all_uuid = 1;
+			break;
+
 		case 's':
 			summarize = 1;
 			break;
@@ -456,8 +461,10 @@ static void decode_arguments(int argc, char **argv)
 		fprintf(stderr, "command required\n");
 		exit(EXIT_FAILURE);
 	} else if (need_uuid) {
-		fprintf(stderr, "uuid required\n");
-		exit(EXIT_FAILURE);
+		if (!opt_all_uuid) {
+			fprintf(stderr, "uuid required\n");
+			exit(EXIT_FAILURE);
+		}
 	} else {
 		fprintf(stderr, "missing arg\n");
 		exit(EXIT_FAILURE);
@@ -1486,14 +1493,42 @@ static void do_log_plock(void)
 	printf("\n");
 }
 
+static int check_or_cancel(int do_cancel)
+{
+	uint32_t flags = 0;
+	uint32_t check_status = 0;
+	int rv = 0;
+
+	if (do_cancel)
+		flags = DLMC_FLAG_RUN_CHECK_CANCEL;
+	else
+		flags = DLMC_FLAG_RUN_CHECK_CLEAR;
+
+	rv = dlmc_run_check(run_uuid, strlen(run_uuid), wait_sec, flags,
+			&check_status);
+
+	printf("check_status: ");
+
+	if (check_status & DLMC_RUN_STATUS_WAITING)
+		printf("waiting ");
+	if (check_status & DLMC_RUN_STATUS_DONE)
+		printf("done ");
+	if (check_status & DLMC_RUN_STATUS_FAILED)
+		printf("failed ");
+	printf("\n");
+	return rv;
+}
+
 static int do_run(int op)
 {
 	int do_start = (op == OP_RUN) || (op == OP_RUN_START);
 	int do_check = (op == OP_RUN) || (op == OP_RUN_CHECK);
 	int do_cancel = (op == OP_RUN_CANCEL);
 	uint32_t flags = 0;
-	uint32_t check_status = 0;
-	int rv = 0;
+	int rv = 0, pos = 0;
+	char buf[DLMC_DUMP_SIZE];
+	char *p;
+
 
 	if (do_start) {
 		/* FIXME: use proper option to specify */
@@ -1508,23 +1543,24 @@ static int do_run(int op)
 	}
 
 	if (do_check || do_cancel) {
-		if (do_cancel)
-			flags = DLMC_FLAG_RUN_CHECK_CANCEL;
-		else
-			flags = DLMC_FLAG_RUN_CHECK_CLEAR;
-
-		rv = dlmc_run_check(run_uuid, strlen(run_uuid), wait_sec, flags,
-				    &check_status);
-
-		printf("check_status: ");
-
-		if (check_status & DLMC_RUN_STATUS_WAITING)
-			printf("waiting ");
-		if (check_status & DLMC_RUN_STATUS_DONE)
-			printf("done ");
-		if (check_status & DLMC_RUN_STATUS_FAILED)
-			printf("failed ");
-		printf("\n");
+		if (opt_all_uuid) {
+			memset(buf, 0, sizeof(buf));
+			dlmc_dump_run(buf);
+			buf[DLMC_DUMP_SIZE-1] = '\0';
+			while (1) {
+				p = strstr(buf + pos, "run_uuid ");
+				if (!p)
+					break;
+				pos = p - buf;
+				sscanf(buf + pos, "run_uuid %s start_nodeid", run_uuid);
+				pos += 10 + strlen(run_uuid); /* 10: "run_uuid" + 2 spaces */
+				printf("uuid: %s\n", run_uuid);
+				rv += check_or_cancel(do_cancel);
+			}
+			return rv;
+		} else {
+			rv = check_or_cancel(do_cancel);
+		}
 	}
 
 	return rv;
-- 
2.32.0


