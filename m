Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 92BE54182A6
	for <lists+cluster-devel@lfdr.de>; Sat, 25 Sep 2021 16:23:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-2tSti4ocNsGgnv37cELvnw-1; Sat, 25 Sep 2021 10:23:04 -0400
X-MC-Unique: 2tSti4ocNsGgnv37cELvnw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 809AA1084683;
	Sat, 25 Sep 2021 14:23:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FB5818506;
	Sat, 25 Sep 2021 14:23:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C3374E58E;
	Sat, 25 Sep 2021 14:23:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18PEMRd2014696 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 25 Sep 2021 10:22:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 375EE1005B68; Sat, 25 Sep 2021 14:22:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 320DF111E3F1
	for <cluster-devel@redhat.com>; Sat, 25 Sep 2021 14:22:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08860800883
	for <cluster-devel@redhat.com>; Sat, 25 Sep 2021 14:22:27 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-461-WnNsJJNtOIKDmkWJsOPCtQ-1;
	Sat, 25 Sep 2021 10:22:24 -0400
X-MC-Unique: WnNsJJNtOIKDmkWJsOPCtQ-1
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-22-jCMr2PmSNv2BNCPLW4QLNQ-1; Sat, 25 Sep 2021 16:22:22 +0200
X-MC-Unique: jCMr2PmSNv2BNCPLW4QLNQ-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB8PR04MB7066.eurprd04.prod.outlook.com (2603:10a6:10:12e::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4544.18; Sat, 25 Sep 2021 14:22:21 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d]) by DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d%6]) with mapi id 15.20.4544.020;
	Sat, 25 Sep 2021 14:22:21 +0000
From: Heming Zhao <heming.zhao@suse.com>
To: teigland@redhat.com
Date: Sat, 25 Sep 2021 22:21:42 +0800
Message-ID: <20210925142142.1821-6-heming.zhao@suse.com>
In-Reply-To: <20210925142142.1821-1-heming.zhao@suse.com>
References: <20210925142142.1821-1-heming.zhao@suse.com>
X-ClientProxiedBy: HK2P15301CA0016.APCP153.PROD.OUTLOOK.COM
	(2603:1096:202:1::26) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
Received: from localhost (123.123.135.254) by
	HK2P15301CA0016.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::26)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.0
	via Frontend Transport; Sat, 25 Sep 2021 14:22:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5083173c-1a62-494a-11bb-08d9802fe306
X-MS-TrafficTypeDiagnostic: DB8PR04MB7066:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB70669887BF810CD2FF075C4897A59@DB8PR04MB7066.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: ApBd+vDKk0ecvzcxf0fozp1skmckuDWnw4xBEnEWINvh9v4kuS4au/q9KF4nD9fLBIWp1GbKOFkbs5hTXHfx4eESFyZ7ywmxhZXh11CRkGI+4BLffk+efttzpO1BQA/ral9/MQTR8d+09P48LSzsG6sw2GaZ4jnqmhK6XtbMGMgct1Pckys65fxUn8Iv8VTbYbh6maubmigwgdf0A+hOy4U627e30fkFs8vv/TIqh8XDxI/xcirnWl6MS9G9wH4aJqfu7rAs5MPbM0uvuS2G3wJwz02MdJKtbr4lGTE+L5IkL2I0mr6K8MucZQrSl56an5YYkhMHhT8qnYr2ieFPDgL5UTC2dR6+hvut7HqlJ9c7fr5rj0wkcIbq0KObF+d9TmSwdfm1PkAv6VzfiImLkGKhcwajoSadPx5UxMTcZ/pJfp4Bul21feah0eOFCg7PqLEq34OlaIeAm39kdO2sdVM7HqxBk4nL/ZZ+Ypsm8R3aQxIOxu5U26fMbzJQz0nBnGxDqS4Hvxl96yZ7Es8/qkge0CySAX8SScEJgY0g0liFyWb6ttOzO5ywZ4drbPkCyb4CluxJLxphi2240DpqC/jMPErlwHfd4jp0I6ho4etjiOW4JJJfMXgFHhsRNF9QMGSO0hSE2ZgJyLmxx8J2qkP0xSeEqynAu4QUFBeAb20SaIfX+f6UjTyCraCXpkW1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(83380400001)(316002)(5660300002)(38100700002)(186003)(26005)(44832011)(6496006)(6486002)(30864003)(2616005)(450100002)(6916009)(956004)(8936002)(4326008)(36756003)(86362001)(8676002)(66946007)(66476007)(66556008)(508600001)(6666004)(2906002)(107886003)(1076003)(9126006);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8fIecm5+GyQwz9ax1NK2YaOVT8YpH8ywdtTrgsFdeWSnwRRhBvJgHBIAeu6n?=
	=?us-ascii?Q?n1u9j+P3JoSuoK2C82hg+KSDT2nct1CMlNo1jH/A2vdLI1dCJeS1QqU5CBLt?=
	=?us-ascii?Q?Z0Jh7Ie90R8nd4uWlD6CyMdIWcSPG+ScJ2Ko6EqppDfw5DaSMso31cWP6XcU?=
	=?us-ascii?Q?pzzbZLe7Sy7jtvB8MJlMRDv6YC9c73JZee2AtfUKvdl2CFMK0OhEumvnnxew?=
	=?us-ascii?Q?fY2A76RAb72X48SaACHfMFwBE1vw7iiJf9eekkeBjW3t2q2cdmCCPavdXWF2?=
	=?us-ascii?Q?Vq35GiLDYNkLO1SFqDUaHcnHVGmpBNRnd4tRsvlOyx5WJ4NET+bQ18Mro4Eu?=
	=?us-ascii?Q?MLjB0BJPm0GZ41vYgCBd9MqsiQH0B98E/Q2jUFEc2mI8n5+qxvyofLjrykFu?=
	=?us-ascii?Q?fUBjevU9tDlm8UNkb1yFPg+8DlSstC98FW5qhMDmoZntRFLDVR1bizyhkHPU?=
	=?us-ascii?Q?WQDTI/99MCsr9H4RSh33lKC2e+t7eizQGUsytDxEJTlRNL8cBq2o2gAQl6vw?=
	=?us-ascii?Q?sRRkLaCObJez0Kaou2Q8mQlgLfg5+hC00vwQaHBULCqEj5Jsirq0sbxT45qK?=
	=?us-ascii?Q?TjqCIG0Opa4moCRJDM5i9PbTN+rbr/mUZDF96uAZqt4uzT1ORpX+kh90pe3V?=
	=?us-ascii?Q?HqHD96ONfJhlgVH0t5vhBr2/6rUt7ZuifJS0CaLW9SDIyEvzJAsAgMb/pNgx?=
	=?us-ascii?Q?pYUDpBbmz4oNsXH1wz2n4ab2eQLljaPmCEFvvyYGYphbIacp2hXB44pd4CJA?=
	=?us-ascii?Q?5FjZwCjUC5g21QxHfTSafEzcimYMqaM+iDc6oQH59szafCStaHl9l8a3bvMR?=
	=?us-ascii?Q?dGZ2P8CtXk+6Lf8vnDjC7rynZGvBfe9FVkn5zuqq1nIynEMvU5WrCZCSRG2X?=
	=?us-ascii?Q?IvXjYXvMaoiuW+lBeoZYLrdH6PjIySE8gvWxjWG4H91alxrCQaBjXLPRV5LZ?=
	=?us-ascii?Q?/shVEojZwLcvrJlFzPeUzxCwp5CZB4gCSiAVjeTMgVGZdevc6OUyEaqp0tmO?=
	=?us-ascii?Q?ejuPQo/PeC4jBfdpWp0+Dwz4f9KFn2LP9nGFzBFB+sXfi7iI6SWOKiPqVjny?=
	=?us-ascii?Q?FdIID1+o4TTmCNZFkkV+oTTzl+nOThDA+EnjwYNEf1bUN97Sef/JT2sgPZMd?=
	=?us-ascii?Q?sIS5KEKH+VsNgBwv+OTi/mv6JazBAj8ZvMSatT4f39rJkvQIGoy7GCuje288?=
	=?us-ascii?Q?uv432sbJvxofwLj/WmdVnfnec9oWe9bBJpatldtn9naG1CRv75EM9z4/RtmS?=
	=?us-ascii?Q?KgByLMrL3aKbFI2B6hHxPtc5cbIno1SfAiOD4pvydoe2RgEBOB4Espqj8HW1?=
	=?us-ascii?Q?cTDEr8x6P6pd8vRIzl7MxEnh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5083173c-1a62-494a-11bb-08d9802fe306
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2021 14:22:21.3637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otU2479kJpEm9R3R7zMjmUKsp782m0IuacQrKR/Nx8YXi4dqRaxbH4oRf7JQ8q3c/8Go4z2DdtWB2rUNqxU0yw==
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18PEMRd2014696
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, zzhou@suse.com
Subject: [Cluster-devel] [PATCH 5/5] dlm_controld: add new feature set_config
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Signed-off-by: Heming Zhao <heming.zhao@suse.com>
---
 dlm_controld/config.c        | 169 +++++++++++++++++++++++++++++++++++
 dlm_controld/dlm_controld.h  |   1 +
 dlm_controld/dlm_daemon.h    |  11 +++
 dlm_controld/helper.c        |   4 -
 dlm_controld/lib.c           |  38 +++++++-
 dlm_controld/libdlmcontrol.h |   1 +
 dlm_controld/main.c          |  18 +++-
 dlm_tool/main.c              |  29 +++++-
 8 files changed, 260 insertions(+), 11 deletions(-)

diff --git a/dlm_controld/config.c b/dlm_controld/config.c
index 91ca10a62b15..e825e2f8a1a6 100644
--- a/dlm_controld/config.c
+++ b/dlm_controld/config.c
@@ -387,3 +387,172 @@ void set_opt_file(int update)
 	fclose(file);
 }
 
+/*
+ * do the clean/restore job:
+ * - clean up dlm_options[].dynamic_xx
+ * - using top priority item to set use option.
+ */
+static void reset_dynamic(int index)
+{
+	struct dlm_option *o = &dlm_options[index];
+
+	if (!o->reload)
+		return;
+
+	o->dynamic_set = 0;
+	o->dynamic_int = 0;
+	if (o->dynamic_str){
+		free(o->dynamic_str);
+		o->dynamic_str = NULL;
+	}
+	o->dynamic_uint = 0;
+	reset_opt_value(index);
+
+	return;
+}
+
+/* copy code from exec_command() */
+void set_opt_online(char *cmd_str, int cmd_len)
+{
+	int i, ind, val = 0;
+	int av_count = 0;
+	int arg_len;
+	unsigned int uval = 0;
+	struct dlm_option *o;
+	char str[MAX_LINE];
+	char arg[ONE_ARG_LEN];
+	char *av[MAX_AV_COUNT + 1]; /* +1 for NULL */
+
+	if (cmd_len > RUN_COMMAND_LEN)
+		return;
+
+	for (i = 0; i < MAX_AV_COUNT + 1; i++)
+		av[i] = NULL;
+
+	if (!cmd_str[0])
+		return;
+
+	/* this should already be done, but make sure */
+	cmd_str[cmd_len - 1] = '\0';
+
+	memset(&arg, 0, sizeof(arg));
+	arg_len = 0;
+	cmd_len = strlen(cmd_str);
+
+	for (i = 0; i < cmd_len; i++) {
+		if (!cmd_str[i])
+			break;
+
+		if (av_count == MAX_AV_COUNT)
+			break;
+
+		if (cmd_str[i] == '\\') {
+			if (i == (cmd_len - 1))
+				break;
+			i++;
+
+			if (cmd_str[i] == '\\') {
+				arg[arg_len++] = cmd_str[i];
+				continue;
+			}
+			if (isspace(cmd_str[i])) {
+				arg[arg_len++] = cmd_str[i];
+				continue;
+			} else {
+				break;
+			}
+		}
+
+		if (isalnum(cmd_str[i]) || ispunct(cmd_str[i])) {
+			arg[arg_len++] = cmd_str[i];
+		} else if (isspace(cmd_str[i])) {
+			if (arg_len)
+				av[av_count++] = strdup(arg);
+
+			memset(arg, 0, sizeof(arg));
+			arg_len = 0;
+		} else {
+			break;
+		}
+	}
+
+	if ((av_count < MAX_AV_COUNT) && arg_len) {
+		av[av_count++] = strdup(arg);
+	}
+
+	/*
+	for (i = 0; i < MAX_AV_COUNT + 1; i++) {
+		if (!av[i])
+			break;
+
+		syslog(LOG_ERR, "command av[%d] \"%s\"", i, av[i]);
+	}
+	*/
+
+	if (!strcmp(av[0], "restore_all")) {
+		for (i = 0; i < dlm_options_max; i++)
+			reset_dynamic(i);
+		return;
+	}
+
+    i = -1;
+	while (++i < av_count) {
+
+		ind = get_ind_name(av[i]);
+		if (ind < 0)
+			continue;
+		o = &dlm_options[ind];
+		if (!o || !o->reload)
+			continue;
+
+		get_val_str(av[i], str);
+		if (!strcmp(str, "restore")) {
+			reset_dynamic(ind);
+			continue;
+		}
+
+		o->dynamic_set++;
+
+		if (!o->req_arg || o->req_arg == req_arg_int) {
+			get_val_int(av[i], &val);
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
+			get_val_uint(av[i], &uval);
+			o->dynamic_uint = uval;
+
+			log_debug("config dynamic %s = %u previous use %u",
+				  o->name, o->dynamic_uint, o->use_uint);
+			o->use_uint = o->dynamic_uint;
+
+		} else if (o->req_arg == req_arg_bool) {
+			get_val_int(av[i], &val);
+			o->dynamic_int = val ? 1 : 0;
+
+			log_debug("config dynamic %s = %d previous use %d",
+				  o->name, o->dynamic_int, o->use_int);
+			o->use_int = o->dynamic_int;
+
+		} else if (o->req_arg == req_arg_str) {
+			memset(str, 0, sizeof(str));
+			get_val_str(av[i], str);
+
+			o->dynamic_str = strdup(str);
+
+			log_debug("config dynamic %s = %s previous use %s",
+				  o->name, o->dynamic_str, o->use_str);
+			o->use_str = o->dynamic_str;
+		}
+
+		reload_setting(ind);
+	}
+
+	return;
+}
diff --git a/dlm_controld/dlm_controld.h b/dlm_controld/dlm_controld.h
index 0ea3548fce7d..94e5c49e88bd 100644
--- a/dlm_controld/dlm_controld.h
+++ b/dlm_controld/dlm_controld.h
@@ -36,6 +36,7 @@
 #define DLMC_CMD_RUN_CHECK		16
 #define DLMC_CMD_DUMP_RUN		17
 #define DLMC_CMD_RELOAD_CONFIG	18
+#define DLMC_CMD_SET_CONFIG		19
 
 struct dlmc_header {
 	unsigned int magic;
diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index 9e68f8257cb5..da261774bee0 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -25,6 +25,7 @@
 #include <arpa/inet.h>
 #include <net/if.h>
 #include <stdio.h>
+#include <ctype.h>
 #include <errno.h>
 #include <string.h>
 #include <stdlib.h>
@@ -133,6 +134,7 @@ struct dlm_option {
 	char letter;
 	int req_arg;
 	char reload;
+	char dynamic;
 	const char *desc;
 
 	int use_int;
@@ -152,6 +154,11 @@ struct dlm_option {
 	int file_int;
 	char *file_str;
 	unsigned int file_uint;
+
+	int dynamic_set;
+	int dynamic_int;
+	char *dynamic_str;
+	unsigned int dynamic_uint;
 };
 
 EXTERN struct dlm_option dlm_options[dlm_options_max];
@@ -328,6 +335,9 @@ struct lockspace {
 
 #define RUN_COMMAND_LEN DLMC_RUN_COMMAND_LEN /* 1024 */
 
+#define MAX_AV_COUNT 32
+#define ONE_ARG_LEN 256
+
 struct run_info {
 	int dest_nodeid;
 	int start_nodeid;
@@ -390,6 +400,7 @@ int set_configfs_opt(const char *name, char *str, int num);
 void set_opt_file(int update);
 int get_weight(struct lockspace *ls, int nodeid);
 void setup_lockspace_config(struct lockspace *ls);
+void set_opt_online(char *cmd_str, int cmd_len);
 
 /* cpg.c */
 void process_lockspace_changes(void);
diff --git a/dlm_controld/helper.c b/dlm_controld/helper.c
index a20965b76195..469dd22095f0 100644
--- a/dlm_controld/helper.c
+++ b/dlm_controld/helper.c
@@ -20,7 +20,6 @@
 #include <time.h>
 #include <stdarg.h>
 #include <signal.h>
-#include <ctype.h>
 #include <sys/time.h>
 #include <sys/types.h>
 #include <sys/wait.h>
@@ -29,9 +28,6 @@
 
 #include "dlm_daemon.h"
 
-#define MAX_AV_COUNT 32
-#define ONE_ARG_LEN 256
-
 
 static int _log_stderr;
 
diff --git a/dlm_controld/lib.c b/dlm_controld/lib.c
index 951eb6561ba9..8cbdd27f15e2 100644
--- a/dlm_controld/lib.c
+++ b/dlm_controld/lib.c
@@ -189,7 +189,43 @@ int dlmc_reload_config(void)
 
 	rv = do_write(fd, &h, sizeof(h));
 	close(fd);
- out:
+out:
+	return rv;
+}
+
+int dlmc_set_config(char *command)
+{
+	struct dlmc_header h;
+	char *cmdbuf;
+	int fd, rv;
+
+	cmdbuf = malloc(DLMC_RUN_COMMAND_LEN);
+	if (!cmdbuf)
+		return -1;
+
+	memset(cmdbuf, 0, DLMC_RUN_COMMAND_LEN);
+	strncpy(cmdbuf, command, DLMC_RUN_COMMAND_LEN-1);
+
+	init_header(&h, DLMC_CMD_SET_CONFIG, NULL, DLMC_RUN_COMMAND_LEN);
+
+	fd = do_connect(DLMC_SOCK_PATH);
+	if (fd < 0) {
+		rv = fd;
+		goto out;
+	}
+
+	rv = do_write(fd, &h, sizeof(h));
+	if (rv < 0)
+		goto out_close;
+
+	rv = do_write(fd, cmdbuf, DLMC_RUN_COMMAND_LEN);
+	if (rv < 0)
+		goto out_close;
+
+out_close:
+	close(fd);
+out:
+	free(cmdbuf);
 	return rv;
 }
 
diff --git a/dlm_controld/libdlmcontrol.h b/dlm_controld/libdlmcontrol.h
index ac84e702fb58..a106171b1073 100644
--- a/dlm_controld/libdlmcontrol.h
+++ b/dlm_controld/libdlmcontrol.h
@@ -92,6 +92,7 @@ int dlmc_lockspace_nodes(char *lsname, int type, int max, int *count,
 			 struct dlmc_node *nodes);
 int dlmc_print_status(uint32_t flags);
 int dlmc_reload_config(void);
+int dlmc_set_config(char *command);
 
 #define DLMC_RESULT_REGISTER	1
 #define DLMC_RESULT_NOTIFIED	2
diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index a49bb0c9b9ad..02fe89bbc60b 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -919,17 +919,24 @@ static void copy_options(char *buf, int *len)
 {
 	struct dlm_option *o;
 	char tmp[256];
-	int i, ret, pos = 0;
+	int i, ret, pos = 0, p=5;
 
 	for (i = 0; i < dlm_options_max; i++) {
 		o = &dlm_options[i];
 
 		memset(tmp, 0, sizeof(tmp));
 
+		if (o->reload)
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
@@ -1234,6 +1241,11 @@ static void process_connection(int ci)
 		set_opt_file(1);
 		break;
 
+	case DLMC_CMD_SET_CONFIG:
+		if (extra_len)
+			set_opt_online(extra, extra_len);
+		break;
+
 	default:
 		log_error("process_connection %d unknown command %d",
 			  ci, h.command);
diff --git a/dlm_tool/main.c b/dlm_tool/main.c
index 07f020d71a66..5364f7ea22d8 100644
--- a/dlm_tool/main.c
+++ b/dlm_tool/main.c
@@ -48,6 +48,7 @@
 #define OP_RUN_LIST			18
 #define OP_DUMP_RUN			19
 #define OP_RELOAD_CONFIG	20
+#define OP_SET_CONFIG		21
 
 static char *prog_name;
 static char *lsname;
@@ -197,7 +198,8 @@ static void print_usage(void)
 	printf("dlm_tool [command] [options] [name]\n");
 	printf("\n");
 	printf("Commands:\n");
-	printf("ls, status, dump, dump_config, reload_config, fence_ack\n");
+	printf("ls, status, dump, fence_ack\n");
+	printf("dump_config, reload_config, set_config\n");
 	printf("log_plock, plocks\n");
 	printf("join, leave, lockdebug\n");
 	printf("run, run_start, run_check, run_cancel, run_list\n");
@@ -370,6 +372,13 @@ static void decode_arguments(int argc, char **argv)
 			opt_ind = optind + 1;
 			need_lsname = 0;
 			break;
+		} else if (!strncmp(argv[optind], "set_config", 10) &&
+			   (strlen(argv[optind]) == 10)) {
+			operation = OP_SET_CONFIG;
+			opt_ind = optind + 1;
+			need_lsname = 0;
+			need_command = 1;
+			break;
 		} else if (!strncmp(argv[optind], "plocks", 6) &&
 			   (strlen(argv[optind]) == 6)) {
 			operation = OP_PLOCKS;
@@ -477,8 +486,10 @@ static void decode_arguments(int argc, char **argv)
 			exit(EXIT_FAILURE);
 		}
 
-		strcat(run_command, argv[i]);
-		strcat(run_command, " ");
+		if (strlen(argv[i])) {
+			strcat(run_command, argv[i]);
+			strcat(run_command, " ");
+		}
 	}
 }
 
@@ -1487,6 +1498,14 @@ static void do_reload_config(void)
 		printf("Issue reload_config done.\n");
 }
 
+static void do_set_config(void)
+{
+	if (dlmc_set_config(run_command) < 0)
+		printf("Issue set_config failed.\n");
+	else
+		printf("Issue set_config done.\n");
+}
+
 static void do_log_plock(void)
 {
 	char buf[DLMC_DUMP_SIZE];
@@ -1589,6 +1608,10 @@ int main(int argc, char **argv)
 		do_reload_config();
 		break;
 
+	case OP_SET_CONFIG:
+		do_set_config();
+		break;
+
 	case OP_LOG_PLOCK:
 		do_log_plock();
 		break;
-- 
2.32.0


