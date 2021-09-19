Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1A63C410A72
	for <lists+cluster-devel@lfdr.de>; Sun, 19 Sep 2021 08:46:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-CKdMsf0RNOi4G-WGrK4VbA-1; Sun, 19 Sep 2021 02:46:26 -0400
X-MC-Unique: CKdMsf0RNOi4G-WGrK4VbA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C290A802937;
	Sun, 19 Sep 2021 06:46:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B384C608BA;
	Sun, 19 Sep 2021 06:46:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CCE814E58F;
	Sun, 19 Sep 2021 06:46:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18J6iXfm030485 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 19 Sep 2021 02:44:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8888B200AE6E; Sun, 19 Sep 2021 06:44:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 833DC200AE6D
	for <cluster-devel@redhat.com>; Sun, 19 Sep 2021 06:44:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1EB28001EA
	for <cluster-devel@redhat.com>; Sun, 19 Sep 2021 06:44:28 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-560-9rF3mlVTM3mexVZY2RgjRA-1;
	Sun, 19 Sep 2021 02:44:27 -0400
X-MC-Unique: 9rF3mlVTM3mexVZY2RgjRA-1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-36-1sPd-EBPMC6JXcWvLu6B4g-1; Sun, 19 Sep 2021 08:44:24 +0200
X-MC-Unique: 1sPd-EBPMC6JXcWvLu6B4g-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB7PR04MB5113.eurprd04.prod.outlook.com (2603:10a6:10:14::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4523.14; Sun, 19 Sep 2021 06:44:23 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d]) by DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d%6]) with mapi id 15.20.4523.018;
	Sun, 19 Sep 2021 06:44:23 +0000
From: Heming Zhao <heming.zhao@suse.com>
To: teigland@redhat.com, aahringo@redhat.com, cluster-devel@redhat.com
Date: Sun, 19 Sep 2021 14:43:20 +0800
Message-ID: <20210919064322.1670-9-heming.zhao@suse.com>
In-Reply-To: <20210919064322.1670-1-heming.zhao@suse.com>
References: <20210919064322.1670-1-heming.zhao@suse.com>
X-ClientProxiedBy: HK0PR03CA0114.apcprd03.prod.outlook.com
	(2603:1096:203:b0::30) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (123.123.135.184) by
	HK0PR03CA0114.apcprd03.prod.outlook.com (2603:1096:203:b0::30)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14
	via Frontend Transport; Sun, 19 Sep 2021 06:44:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf18a015-ceeb-44d5-4cd1-08d97b38ea7d
X-MS-TrafficTypeDiagnostic: DB7PR04MB5113:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB51134BBBCFC7BE92E5B3C8E897DF9@DB7PR04MB5113.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: hy0N9xpdIN5nP2h8+rnATxQ3bpeNBNlPjc1QExACmCaS92qhV45xgDGDbgFw8pUNbiYxQgzX14gpANJ7epsOTl7AUP1rwgQ0/JSwY42lE+Gj6rfBvVa3hZF5zDz5avnsA1nZCZJIASAWTzwA7DKZwo4ehrufAfj+IwLbV5ghSyPyUKZXBrkKftXg2maz8nbn3mwDDML0WWL8z3tXeNxZj4nt1yVYtd6IMoTL+KUhKJUCAzb70Ua/lIa4opxvdaGGaA33zYXwIbazImLXwP5hIifnDj5xkZQRWEKstE64BptJoGFA3/+jxbXwv6nr7RsRWZ3pBZ7MyNCAUnNvzp1vtbSmKdMUsuTcDwKg/AARnGJ8uM6lE2ylZNw46kpNUacVQdYORu4BTmdw7MZ1YppX2T2q9ZreS/2bUhD3mw1zUNSaWRrLJOkejYNbpYJMAG4pKG0GKmtfaxU9pAzZUixD8ffgYldiOyAnSqmE8QG+PvVSBRaLvepffx7EFDJF8wArGDwFLwxx8oTfwTPqHjSsnKcbcnfTi2bP0OJbVzZ14uTuLZTCUC5u4JMoMVbRcZ07YX9rUJU1iwqI6kPK20WstHRVNIn0f3o/euPRGuNVrkM24ShuI6yAkD12o617K/Ddi5XaVQR10WdNHP0mevLxr4jBLqQ1Vh793TLM4Rh2Dw4tQTxK2buqckfOKhL7BPpn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(136003)(366004)(39850400004)(396003)(346002)(376002)(66476007)(8676002)(8936002)(86362001)(6486002)(2906002)(478600001)(36756003)(5660300002)(66556008)(66946007)(6496006)(956004)(2616005)(450100002)(1076003)(26005)(107886003)(38100700002)(316002)(83380400001)(186003)(44832011)(4326008)(9126006);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W0tUftONOZgeTpm3ZPPXHWan50GsLp/sbxhSME/2bPS77THXFu8ccgA0vfhm?=
	=?us-ascii?Q?3Nj3OKlOfXKNcQAoQzHYrYpciB5xsG2QlfBe7dUDRHUH+AsLu1H4F3ao1fzL?=
	=?us-ascii?Q?Rn2+0/JtdYvPjK4smQ4EgG9nXmWwciB0dFFXYBo6u1AJso8qVEmuuhvsQQuM?=
	=?us-ascii?Q?1v27mFkD1Bx8+zKznjZfL7pj9Bxmg81aRn+BLekuLvG5suTaD857Wi73M2s7?=
	=?us-ascii?Q?JFaQKVqNbeaN2qzxMI/kg6vvWgLtoR0Yrr/eMvmtf4UKWOce3brQcdoCowrr?=
	=?us-ascii?Q?Dg+J8Z+5027EIHGzgmB6+t4JCrvJtHZ594SIsWmhd37mdUBmCEy4eSKY/cDo?=
	=?us-ascii?Q?v+4P/rmmDMt28/9TtyAoE3Cfeq+l1ArvPGiSMak6F6UzhNqlZxlIdY2T4ZVE?=
	=?us-ascii?Q?DMmD5Y8KNsMytr7sZ2uXqpO45Bo2jaD0o51vIhCNlBJTVv3uCC5Xzj3w75bU?=
	=?us-ascii?Q?Ro4ddbDEgPUgDP3ufBwIU+Ov++/ShL8jr/Cr59QWcbjPSjGWs2WtUTkFyWKE?=
	=?us-ascii?Q?RMSMmncVRe1S3wqZ1SOaf/DuPnLdKr2vvFCHT0P9TSylAjXlKYofJn1KgAsg?=
	=?us-ascii?Q?bYwyAHEKkF7Ee59/Tv6Dj/pCp/IKRvQ3xXoFh5Tq4a1qYPmkX1jVUhIPzhdH?=
	=?us-ascii?Q?GKlvGDRhetupMe/Eu62mhiH8VgJFYrJ/nuFy71ITNMPEmuynThs5+JS4D98X?=
	=?us-ascii?Q?oj6Xq+W70F8TXOzV5F7Hczv2I5y8e+LP4HAWa6brCbvfIKTWxx7bDGdtCFD6?=
	=?us-ascii?Q?T5jpB7SIrodlz0UZDfHv3RTjjVjTR3OZ24TjF2Ps98vgP6isj9FbH7QZHJ8u?=
	=?us-ascii?Q?RrJQ4VUXotUd4+1smzutWEhzHWaJ0iVYjh+x3EWPmHkKS+r8OakMy0IFNJRG?=
	=?us-ascii?Q?QDJbqn9ng3Te5L54RtQzCrp6rLGgvJP+uABEA7kjSZxBE59Bku+rB5dElSWF?=
	=?us-ascii?Q?ty/pV4GUWs1k5qNU0SXFg4szsdnpX3KtHKHRxE/uoOnvHzpORuIMUmqnGfTi?=
	=?us-ascii?Q?opVOKsCj6+6UbDzXaL+Ns0krhrvEi9aPlB/r570eTd05XODI9FxNflgvfeJQ?=
	=?us-ascii?Q?+7qXXIFunl1wDELzfJ80cnDTdL9zjrXPhFF3jKnbQB8AyvbTUTVyI44iKpkT?=
	=?us-ascii?Q?TXFstTLb1yOVNvk8hlDo94C4MK7Lmv41mdLSiOF4QrRb0oBzAefQnrnd90B9?=
	=?us-ascii?Q?/heQ5hnDSML37MLgqcU/Bk+JotZwKl4v94Kh0jhe/SW2ehODTBeSwdTMBPCm?=
	=?us-ascii?Q?8knT1xZ/q71LwECim3XeCbehpaENlXHAUiqncZ0+n0HVKCKaHOVP0LWXYPXu?=
	=?us-ascii?Q?VQnlT/8xfEEx+FMXeqszK3yk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf18a015-ceeb-44d5-4cd1-08d97b38ea7d
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2021 06:44:23.3218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 34AYNf3rt78t5IIh0Oh0pxkTkbVK+LbVpjXV0j0RelLEkMusjk267GrK26PeeftfyBzBy0eEklimJwuE8IDnVg==
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18J6iXfm030485
X-loop: cluster-devel@redhat.com
Cc: zzhou@suse.com
Subject: [Cluster-devel] [PATCH 08/10] dlm_controld: support "dlm_tool
	dump_config" to show dynamic setting
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
 dlm_controld/main.c | 70 +++++++++++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 31 deletions(-)

diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index 91187f2d2402..c4ee3540f508 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -920,17 +920,24 @@ static void copy_options(char *buf, int *len)
 {
 	struct dlm_option *o;
 	char tmp[256];
-	int i, ret, pos = 0;
+	int i, ret, pos = 0, p=5;
 
 	for (i = 0; i < dlm_options_max; i++) {
 		o = &dlm_options[i];
 
 		memset(tmp, 0, sizeof(tmp));
 
+		if (o->dynamic)
+			snprintf(tmp, p+1, "(%c%c) ", '*', o->dynamic_set ? '+' : '-');
+		else
+			memset(tmp, ' ', p);
+
 		if (o->req_arg == req_arg_str)
-			snprintf(tmp, 255, "%s=%s\n", o->name, o->use_str);
+			snprintf(tmp+p, 250, "%s=%s\n", o->name, o->use_str);
+		else if (o->req_arg == req_arg_uint)
+			snprintf(tmp+p, 250, "%s=%u\n", o->name, o->use_uint);
 		else
-			snprintf(tmp, 255, "%s=%d\n", o->name, o->use_int);
+			snprintf(tmp+p, 250, "%s=%d\n", o->name, o->use_int);
 
 		if (pos + strlen(tmp) >= LOG_DUMP_SIZE)
 			break;
@@ -1750,12 +1757,13 @@ static void print_usage(void)
 
 static void set_opt_default(int ind, const char *name, char letter, int arg_type,
 			    int default_int, const char *default_str,
-			    unsigned int default_uint, const char *desc)
+			    unsigned int default_uint, int dynamic, const char *desc)
 {
 	dlm_options[ind].name = name;
 	dlm_options[ind].letter = letter;
 	dlm_options[ind].req_arg = arg_type;
 	dlm_options[ind].desc = desc;
+	dlm_options[ind].dynamic = dynamic;
 	dlm_options[ind].default_int = default_int;
 	dlm_options[ind].default_str = default_str;
 	dlm_options[ind].default_uint = default_uint;
@@ -1768,137 +1776,137 @@ static void set_opt_defaults(void)
 {
 	set_opt_default(daemon_debug_ind,
 			"daemon_debug", 'D', no_arg,
-			0, NULL, 0,
+			0, NULL, 0, 1,
 			"enable debugging to stderr and don't fork");
 
 	set_opt_default(foreground_ind,
 			"foreground", '\0', no_arg,
-			0, NULL, 0,
+			0, NULL, 0, 0,
 			"don't fork");
 
 	set_opt_default(log_debug_ind,
 			"log_debug", 'K', no_arg,
-			0, NULL, 0,
+			0, NULL, 0, 1,
 			"enable kernel dlm debugging messages");
 
 	set_opt_default(timewarn_ind,
 			"timewarn", '\0', req_arg_int,
-			0, NULL, 0,
+			0, NULL, 0, 0,
 			""); /* do not advertise */
 
 	set_opt_default(protocol_ind,
 			"protocol", 'r', req_arg_str,
-			-1, "detect", 0,
+			-1, "detect", 0, 0,
 			"dlm kernel lowcomms protocol: tcp, sctp, detect");
 
 	set_opt_default(port_ind,
 			"port", 'R', req_arg_uint,
-			-1, NULL, 21064,
+			-1, NULL, 21064, 0,
 			"dlm kernel lowcomms protocol port");
 
 	set_opt_default(bind_all_ind,
 			"bind_all", '\0', req_arg_int,
-			0, NULL, 0,
+			0, NULL, 0, 0,
 			""); /* do not advertise */
 
 	set_opt_default(mark_ind,
 			"mark", '\0', req_arg_uint,
-			0, NULL, 0,
+			0, NULL, 0, 0,
 			"set mark value for DLM if not explicit by nodeid specified");
 
 	set_opt_default(debug_logfile_ind,
 			"debug_logfile", 'L', no_arg,
-			0, NULL, 0,
+			0, NULL, 0, 1,
 			"write debugging to log file");
 
 	set_opt_default(enable_fscontrol_ind,
 			"enable_fscontrol", '\0', req_arg_bool,
-			0, NULL, 0,
+			0, NULL, 0, 0,
 			""); /* do not advertise */
 
 	set_opt_default(enable_plock_ind,
 			"enable_plock", 'p', req_arg_bool,
-			1, NULL, 0,
+			1, NULL, 0, 0,
 			"enable/disable posix lock support for cluster fs");
 
 	set_opt_default(plock_debug_ind,
 			"plock_debug", 'P', no_arg,
-			0, NULL, 0,
+			0, NULL, 0, 1,
 			"enable plock debugging");
 
 	set_opt_default(plock_rate_limit_ind,
 			"plock_rate_limit", 'l', req_arg_int,
-			0, NULL, 0,
+			0, NULL, 0, 1,
 			"limit rate of plock operations (0 for none)");
 
 	set_opt_default(plock_ownership_ind,
 			"plock_ownership", 'o', req_arg_bool,
-			0, NULL, 0,
+			0, NULL, 0, 0,
 			"enable/disable plock ownership");
 
 	set_opt_default(drop_resources_time_ind,
 			"drop_resources_time", 't', req_arg_int,
-			10000, NULL, 0,
+			10000, NULL, 0, 1,
 			"plock ownership drop resources time (milliseconds)");
 
 	set_opt_default(drop_resources_count_ind,
 			"drop_resources_count", 'c', req_arg_int,
-			10, NULL, 0,
+			10, NULL, 0, 1,
 			"plock ownership drop resources count");
 
 	set_opt_default(drop_resources_age_ind,
 			"drop_resources_age", 'a', req_arg_int,
-			10000, NULL, 0,
+			10000, NULL, 0, 1,
 			"plock ownership drop resources age (milliseconds)");
 
 	set_opt_default(post_join_delay_ind,
 			"post_join_delay", 'j', req_arg_int,
-			30, NULL, 0,
+			30, NULL, 0, 1,
 			"seconds to delay fencing after cluster join");
 
 	set_opt_default(enable_fencing_ind,
 			"enable_fencing", 'f', req_arg_bool,
-			1, NULL, 0,
+			1, NULL, 0, 0,
 			"enable/disable fencing");
 
 	set_opt_default(enable_concurrent_fencing_ind,
 			"enable_concurrent_fencing", '\0', req_arg_bool,
-			0, NULL, 0,
+			0, NULL, 0, 0,
 			"enable/disable concurrent fencing");
 
 	set_opt_default(enable_startup_fencing_ind,
 			"enable_startup_fencing", 's', req_arg_bool,
-			1, NULL, 0,
+			1, NULL, 0, 0,
 			"enable/disable startup fencing");
 
 	set_opt_default(repeat_failed_fencing_ind,
 			"repeat_failed_fencing", '\0', req_arg_bool,
-			1, NULL, 0,
+			1, NULL, 0, 1,
 			"enable/disable retrying after fencing fails");
 
 	set_opt_default(enable_quorum_fencing_ind,
 			"enable_quorum_fencing", 'q', req_arg_bool,
-			1, NULL, 0,
+			1, NULL, 0, 1,
 			"enable/disable quorum requirement for fencing");
 
 	set_opt_default(enable_quorum_lockspace_ind,
 			"enable_quorum_lockspace", '\0', req_arg_bool,
-			1, NULL, 0,
+			1, NULL, 0, 1,
 			"enable/disable quorum requirement for lockspace operations");
 
 	set_opt_default(enable_helper_ind,
 			"enable_helper", '\0', req_arg_bool,
-			1, NULL, 0,
+			1, NULL, 0, 0,
 			"enable/disable helper process for running commands");
 
 	set_opt_default(help_ind,
 			"help", 'h', no_arg,
-			-1, NULL, 0,
+			-1, NULL, 0, 0,
 			"print this help, then exit");
 
 	set_opt_default(version_ind,
 			"version", 'V', no_arg,
-			-1, NULL, 0,
+			-1, NULL, 0, 0,
 			"Print program version information, then exit");
 }
 
-- 
2.32.0


