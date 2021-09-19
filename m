Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2960E410A71
	for <lists+cluster-devel@lfdr.de>; Sun, 19 Sep 2021 08:46:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-JX5eGMvhOiC6RMs9VtrKVA-1; Sun, 19 Sep 2021 02:46:26 -0400
X-MC-Unique: JX5eGMvhOiC6RMs9VtrKVA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FE061800D41;
	Sun, 19 Sep 2021 06:46:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FA165C1A3;
	Sun, 19 Sep 2021 06:46:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 075E34EA29;
	Sun, 19 Sep 2021 06:46:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18J6iebv030500 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 19 Sep 2021 02:44:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9E9DC21677F4; Sun, 19 Sep 2021 06:44:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9820F21677F2
	for <cluster-devel@redhat.com>; Sun, 19 Sep 2021 06:44:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E27891C7C2
	for <cluster-devel@redhat.com>; Sun, 19 Sep 2021 06:44:36 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-563-S4-RRCAcOhyA9QuZXTnqrQ-1;
	Sun, 19 Sep 2021 02:44:33 -0400
X-MC-Unique: S4-RRCAcOhyA9QuZXTnqrQ-1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-38-wbrswBbwOHK9zjsz2wcWpw-1; Sun, 19 Sep 2021 08:44:31 +0200
X-MC-Unique: wbrswBbwOHK9zjsz2wcWpw-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB7PR04MB5113.eurprd04.prod.outlook.com (2603:10a6:10:14::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4523.14; Sun, 19 Sep 2021 06:44:30 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d]) by DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d%6]) with mapi id 15.20.4523.018;
	Sun, 19 Sep 2021 06:44:30 +0000
From: Heming Zhao <heming.zhao@suse.com>
To: teigland@redhat.com, aahringo@redhat.com, cluster-devel@redhat.com
Date: Sun, 19 Sep 2021 14:43:21 +0800
Message-ID: <20210919064322.1670-10-heming.zhao@suse.com>
In-Reply-To: <20210919064322.1670-1-heming.zhao@suse.com>
References: <20210919064322.1670-1-heming.zhao@suse.com>
X-ClientProxiedBy: HK0PR03CA0120.apcprd03.prod.outlook.com
	(2603:1096:203:b0::36) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (123.123.135.184) by
	HK0PR03CA0120.apcprd03.prod.outlook.com (2603:1096:203:b0::36)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14
	via Frontend Transport; Sun, 19 Sep 2021 06:44:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63d9bf6b-17ff-464b-c685-08d97b38eec1
X-MS-TrafficTypeDiagnostic: DB7PR04MB5113:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB51136B8265D76749A2CB77AC97DF9@DB7PR04MB5113.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: LZ3VcqjXjSagUSULAaRqhl9Ed7YG82GDpycx7BoI7fUkUVt7I7QGUYD1OJIG6i29ncJAivYKv0c57Bd+Rllso7gg0Xl5wOmXbHeuOV/sxlSwjVeni//4ZpA6qWXCDHZFZ6oxnD01UU615fYVRvb5wk0sMQq8yZHtUsXiULm3wCFhXehKMC7kA3YzAvYAeJ6unUibrzRvgNt0CqHiM8hWPqsjntsFG1QzNWTXa0BrS3YuPVlhOvVwEOQBVf8KTCVTFH/nkPzVE5DO4GgN4wTbme3x4DimkkPpNXsAK6snHmVkYnOz31yG9mr133NarnsU1jZ6yM5Eu8OonoqeOS2uycMo1HMrUnUa5GDygEz2rgPpvD1HO4r5m7Jai+zgr5sdlLjrkS2WAepUvXkCCmImnqX16p2v/G9L4E57lpJ8fca58zsxIjE/6gFMvdcUbS2naAvnSf2mdkZsPOVZngEr5dH9UQ8EKkN+P8ey5ADzSqvzSNNnCuFfFzIiijn5TLkZFiTHuXmu6Bwd+OvG+0ixO8BWp7jxastQOgNS3+xKtW+sxu0pPL2h1tSm0PPJpmGhws1MhSWbZJmEbdoI5cYx+u+wl+A3f4IDrmyJNntOO/68ijblByoWGWEE65amWZXwyQrGOZXoPaOm8QmxveeHUir9ZWpwexp0kxZkxm6vcQEIAzK20w8LL+Z0FuRNXHOU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(136003)(366004)(39850400004)(396003)(346002)(376002)(66476007)(8676002)(8936002)(86362001)(6486002)(2906002)(478600001)(36756003)(5660300002)(66556008)(66946007)(6496006)(956004)(2616005)(450100002)(1076003)(26005)(107886003)(38100700002)(316002)(83380400001)(186003)(44832011)(4326008)(6666004)(9126006);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JUxX8ZavPUiRVHYXZupfQ6VWwwqYLHrHX2Lw2dojLhuicrK/JUpVJhkpxQKW?=
	=?us-ascii?Q?CwdmHqX9rtexy4eSuprF9TUJE6JlR1Pv0upWfaUW53A3uUyTHvB5cxM3FiCX?=
	=?us-ascii?Q?CFwsU0HDcnOji43VwAYh5dkCfLWIY2Xkkb9qQ0uxh9UM0qMJFaDUnFm1B/1g?=
	=?us-ascii?Q?hKtDXo0PqEusRPhgCQxU+z3q6wNHRDLess8envh69LclivQVPLGxZ+378tfS?=
	=?us-ascii?Q?HhWtJqBGu8GmzUxcGnSeHhFgJzWeQSpXY7N/JEDXA7wdG7xbYYvN1sRLm46v?=
	=?us-ascii?Q?ZIcSdlVlEyris8nBEs06qzqSR5Uu2g4x+BpmwPWoH4dsDIFtDb+6Qjt7syFY?=
	=?us-ascii?Q?3vP+Ea9ixjMZUIR5RnRIEFgL6cZK8mmAHP/k8dmJuAH8feGc/leyK1XlUof1?=
	=?us-ascii?Q?mfSWZn2xF6qz8VmzN3AJLDFVPb8AFvER9Mjkoo+4vyVpRHxK4zaqz1hEotST?=
	=?us-ascii?Q?9AG8doDVI2c5WKzHVpEUmo6uoc0JTodslwyQ+mLZZcMyBpV0k6QDgVwEvGL7?=
	=?us-ascii?Q?mEJVKyNjY3M7YgqwIS6/Di7gBSrv+WIx6FTiOe2sdkZa2EUTu2TCqEEJB9YO?=
	=?us-ascii?Q?C7Ncu25+9HD39hfF1DH5c+gIGDxnZRwGbpck21XrZNv0niWYuKLkemTXopEJ?=
	=?us-ascii?Q?RtE77OzQ5Cq6dZg60C3U9u1N7fBWWNe6kzfMLD7s/OQt2a5Us2lBkGth3SJc?=
	=?us-ascii?Q?dOudQKWa7rC47sCrwAVhaOIM1EvA9xtH07VznlgBk96o0Fyme0FVzxJgjv/K?=
	=?us-ascii?Q?TMTZINc86jBUazLEnbsUMxS2VdDP7Jpy5icOK9gFZ5CCVURhPPcXO0IgqOW6?=
	=?us-ascii?Q?WzTBBkPp8z8g4znHJGyzFB/F9UkVWmCIvdxUi7b3XJQ/vjk2mlC9EJ/oDdp5?=
	=?us-ascii?Q?FSWilsjhOrm8RMiV6s/4oX97eTTTvgf/I11j03ycbo4/3yt5yF1tZZjMacgw?=
	=?us-ascii?Q?sBrFeYEM+a5a9m5itFNOhXlIow8g19MlNSxl9IhVEt6DkTC6d1gCQV6tPhHA?=
	=?us-ascii?Q?96domHw//U5HaVWomITUOEV1ZaRNxg9+McaZbxt4AlBAmVD9VjIz8GqGqFTr?=
	=?us-ascii?Q?efIbjZBWMUCWXXp0x3wL4mSjw/GPXS0gIdu4e6Qp+Ysb3xcMcGh8OWIyjtHt?=
	=?us-ascii?Q?gyxijNW7eHRObIqCxfy1LhbVsTL+XueZOFDesQPURYDsxEkBlqeU13rGwKCY?=
	=?us-ascii?Q?VijV49iA5WsmI87c1fwspVOnXZrwTQumGKGtJnAIbvR7B4Zk8r5Emjx9uDBe?=
	=?us-ascii?Q?dOSCVvPwUw/g0zS/owVQOsONsQ0DpRIco48yQ9BnArthwjixRaLnfsfkBNJH?=
	=?us-ascii?Q?MZ8jZfQi8BnMdrmglF8+SPo+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d9bf6b-17ff-464b-c685-08d97b38eec1
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2021 06:44:30.6477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdI2OUedlnZkn2E/2TLOBpiwSLG6jW904bUBoKwwrr6QFVotUaV3oG65EffTN5bkVp/YPw8GFDZ8d4cOyT+CfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5113
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18J6iebv030500
X-loop: cluster-devel@redhat.com
Cc: zzhou@suse.com
Subject: [Cluster-devel] [PATCH 09/10] dlm_controld: add new API
	set_opt_online()
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

This API has ability to change dlm_controld settings on the fly.

Signed-off-by: Heming Zhao <heming.zhao@suse.com>
---
 dlm_controld/config.c     | 128 ++++++++++++++++++++++++++++++++++++++
 dlm_controld/dlm_daemon.h |   1 +
 2 files changed, 129 insertions(+)

diff --git a/dlm_controld/config.c b/dlm_controld/config.c
index d77f3826bfe6..9e799c8c04d2 100644
--- a/dlm_controld/config.c
+++ b/dlm_controld/config.c
@@ -292,3 +292,129 @@ void set_opt_file(int update)
 	fclose(file);
 }
 
+static void reset_opt_value(struct dlm_option *o)
+{
+	/* config priority: cli, config file, default */
+
+	if (o->cli_set) {
+		o->use_int = o->cli_int;
+		o->use_uint = o->cli_uint;
+		o->use_str = o->cli_str;
+		return;
+	}
+
+	if (o->file_set) {
+		o->use_int = o->file_int;
+		o->use_uint = o->file_uint;
+		o->use_str = o->file_str;
+		return;
+	}
+
+	o->use_int = o->default_int;
+	o->use_uint = o->default_uint;
+	o->use_str = (char *)o->default_str;
+
+	return;
+}
+
+/*
+ * do the clean/restore job:
+ * - clean up dlm_options[].dynamic_xx
+ * - using high priority config to set use_xx items.
+ */
+static void reset_dynamic(struct dlm_option *o)
+{
+	o->dynamic_set = 0;
+	o->dynamic_int = 0;
+	if (o->dynamic_str){
+		free(o->dynamic_str);
+		o->dynamic_str = NULL;
+	}
+	o->dynamic_uint = 0;
+	reset_opt_value(o);
+
+	set_configfs_opt("log_debug", NULL, opt(log_debug_ind));
+	set_logfile_priority();
+
+	return;
+}
+
+void set_opt_online(int argc, char **argv)
+{
+	int i = -1, val = 0, ind;
+	unsigned int uval = 0;
+	struct dlm_option *o;
+	char str[MAX_LINE];
+
+	if (!strcmp(argv[0], "restore_all")) {
+		for (i = 0; i < dlm_options_max; i++)
+			reset_dynamic(&dlm_options[i]);
+
+		return;
+	}
+
+	while (++i < argc) {
+		ind = get_ind_name(argv[i]);
+		if (ind < 0)
+			continue;
+		o = &dlm_options[ind];
+		if (!o || !o->dynamic)
+			continue;
+
+		get_val_str(argv[i], str);
+		if (!strcmp(str, "restore")) {
+			reset_dynamic(o);
+			continue;
+		}
+
+		o->dynamic_set++;
+
+		if (!o->req_arg || o->req_arg == req_arg_int) {
+			get_val_int(argv[i], &val);
+			if (!o->req_arg)
+				val = val ? 1 : 0;
+
+			o->dynamic_int = val;
+
+			log_debug("config dynamic %s = %d previous use %d",
+				  o->name, o->dynamic_int, o->use_int);
+			o->use_int = o->dynamic_int;
+
+		} else if (o->req_arg == req_arg_uint) {
+			get_val_uint(argv[i], &uval);
+			o->dynamic_uint = uval;
+
+			log_debug("config dynamic %s = %u previous use %u",
+				  o->name, o->dynamic_uint, o->use_uint);
+			o->use_uint = o->dynamic_uint;
+
+		} else if (o->req_arg == req_arg_bool) {
+			get_val_int(argv[i], &val);
+			o->dynamic_int = val ? 1 : 0;
+
+			log_debug("config dynamic %s = %d previous use %d",
+				  o->name, o->dynamic_int, o->use_int);
+			o->use_int = o->dynamic_int;
+
+		} else if (o->req_arg == req_arg_str) {
+			memset(str, 0, sizeof(str));
+			get_val_str(argv[i], str);
+
+			o->dynamic_str = strdup(str);
+
+			log_debug("config dynamic %s = %s previous use %s",
+				  o->name, o->dynamic_str, o->use_str);
+			o->use_str = o->dynamic_str;
+		}
+
+		if (ind == log_debug_ind) {
+			set_configfs_opt("log_debug", NULL, opt(log_debug_ind));
+		} else if (ind == debug_logfile_ind) {
+			set_logfile_priority();
+		}
+
+	}
+
+	return;
+}
+
diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index 904bb0b50df9..8cc9f666872e 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -398,6 +398,7 @@ int set_configfs_opt(const char *name, char *str, int num);
 void set_opt_file(int update);
 int get_weight(struct lockspace *ls, int nodeid);
 void setup_lockspace_config(struct lockspace *ls);
+void set_opt_online(int argc, char **argv);
 
 /* cpg.c */
 void process_lockspace_changes(void);
-- 
2.32.0


