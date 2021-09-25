Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 162104182A9
	for <lists+cluster-devel@lfdr.de>; Sat, 25 Sep 2021 16:24:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-NrV6gn6hNf-6sjurs1wr_Q-1; Sat, 25 Sep 2021 10:24:11 -0400
X-MC-Unique: NrV6gn6hNf-6sjurs1wr_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86C7E1006AA2;
	Sat, 25 Sep 2021 14:24:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77B4810016FE;
	Sat, 25 Sep 2021 14:24:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 32A7E4E58F;
	Sat, 25 Sep 2021 14:24:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18PEMDMc014641 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 25 Sep 2021 10:22:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F2B16112C243; Sat, 25 Sep 2021 14:22:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EAFDD1010B9D
	for <cluster-devel@redhat.com>; Sat, 25 Sep 2021 14:22:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8502866DF1
	for <cluster-devel@redhat.com>; Sat, 25 Sep 2021 14:22:12 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-315-AUfYal7lPF6OMPCsEV3nLg-1;
	Sat, 25 Sep 2021 10:22:10 -0400
X-MC-Unique: AUfYal7lPF6OMPCsEV3nLg-1
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01lp2056.outbound.protection.outlook.com [104.47.1.56])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-10-BC_C5u52PZmXpMorp0rzIA-1; Sat, 25 Sep 2021 16:22:08 +0200
X-MC-Unique: BC_C5u52PZmXpMorp0rzIA-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB8PR04MB7066.eurprd04.prod.outlook.com (2603:10a6:10:12e::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4544.18; Sat, 25 Sep 2021 14:22:07 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d]) by DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d%6]) with mapi id 15.20.4544.020;
	Sat, 25 Sep 2021 14:22:06 +0000
From: Heming Zhao <heming.zhao@suse.com>
To: teigland@redhat.com
Date: Sat, 25 Sep 2021 22:21:40 +0800
Message-ID: <20210925142142.1821-4-heming.zhao@suse.com>
In-Reply-To: <20210925142142.1821-1-heming.zhao@suse.com>
References: <20210925142142.1821-1-heming.zhao@suse.com>
X-ClientProxiedBy: HKAPR03CA0011.apcprd03.prod.outlook.com
	(2603:1096:203:c8::16) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
Received: from localhost (123.123.135.254) by
	HKAPR03CA0011.apcprd03.prod.outlook.com (2603:1096:203:c8::16)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.7
	via Frontend Transport; Sat, 25 Sep 2021 14:22:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3209476-1d37-4ed5-0a42-08d9802fda5b
X-MS-TrafficTypeDiagnostic: DB8PR04MB7066:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB7066FE7091EEEFA50B61F41D97A59@DB8PR04MB7066.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: 4Qw0G/7/0AkSzPu+1pbmB5NB1XdL5/k50wQWOLPJ9PPFgonVTRGlfvD6+KW32RbBGkdyKjazJmvUt5vrryLTRgQQYQX/J8UN3z3arN333lw3RBncxsjYcPmV/FVT6svg6FqHXzlGNMmlnzpExMizzii8z2DzYYu+RMe5Ss28e0HRn2ztEDe3/dXsGNN2Ved3w5LZwXkEDrR8vV9E0HdJJN6ZicJO8dWqiLk7WAPavyDR/Mnrp2EoBgV9vz1OCfMW6VP5JltNMXW54WXHZ/NKpsuZ804i00vugYin2O3sd8zcG6cD+TWTEUe8qROyKvQXOBU60WmoCCY+6Z7ussgVG1TGegX5I5xZDuYHZHL8C227jnhzzEzDNW7OGTBv+im7xBQL3moK6NPQHgikJ3HCAVnwJgZ/xGnImr7eG4iHtL2feLYrb6CgUjuL7AgMNBeFGmOYi0BvQ8H1Wajm/Zfl7ssHe2m2iZFo3FdQxhojhl0xi4LuowsUFDGq5GD18BI/d32giu0hsUEW7O7VHT9q/PldrxO6+ppDvxFCayjVNR/FsDj1MKACRYV8j1nDAUa/XQlZnmyV1hx3VQqrhaiMFHUPza7pKReH9gAAegZtUmjejFm8r0SCD0LL1B+x/kWTkgASeelumXKXwwzJX1LB3YQNnrtU+omUFuo0mo/44TYutHBOjGaVhKmczRfD2x53
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(83380400001)(316002)(5660300002)(38100700002)(186003)(26005)(44832011)(6496006)(6486002)(30864003)(2616005)(450100002)(6916009)(956004)(8936002)(4326008)(36756003)(86362001)(8676002)(66946007)(66476007)(66556008)(508600001)(6666004)(2906002)(107886003)(1076003)(9126006);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tw07bOQUJnKbLXdjybqGcGPTxb698jGPF5OJo1VKZop8OqVyTlgvmki6s87l?=
	=?us-ascii?Q?uLq8QT5g22SfzUI2QF6yxiicUCPf8TPUSFkbSqCSScYYPWLmxaHHVCUYwFyI?=
	=?us-ascii?Q?qKkSjgwWkOHHPfgacO685oJgdPv0SBgIbiirMVB6qgyI7Ws7MtNLI5Ny6OCD?=
	=?us-ascii?Q?puY8Wb20YWTKix3UTvs9V+dAx2AfI0I4xUdikhorOU5bElLguAAT4pJ2d0AT?=
	=?us-ascii?Q?F/6gd8mpU6HdWhnEXdC5M8ZJr0kqpBqH9AUKcfA3mX+jnWXM3c4rc90T6oRY?=
	=?us-ascii?Q?RmlyTzH1qiMp46Q3BhMTjMWJx1QBYii4UHLTzGy+f4OYNT8C4ko2+2wyOn7/?=
	=?us-ascii?Q?CSnh1DGB8cOdBXs30CA8+EbiGSRytExOTaZLR5NSm4VfgzFGyxLoWs0W+BRQ?=
	=?us-ascii?Q?Zv2ygwpfVcSD7gFy6SmsoIM5cAyeeExXkkQS9/M4YcXLj9svuCJMQ4v/G+7g?=
	=?us-ascii?Q?xr0LpxzyyRH52GAtYLFgYE0CsDs+6shuaHrI5ZjxlVFDNKktjkkqw8s5t7z0?=
	=?us-ascii?Q?sNmNf+P8DDOY9KfYrupZAnFmQwocnd5C0eMbVjWBYU693zKQl5dUAyPVvJbZ?=
	=?us-ascii?Q?cPubeqrDUC9RCHSQzcbqt4G0m1teVjphXyTyNTK0MB6FyQx6E8r7z2XZ1VZv?=
	=?us-ascii?Q?EXqhLTygFDZQtnzz2wbiskRKSenrU3zfv3drwCYBP2ajwaz2r9gOd1vukBGK?=
	=?us-ascii?Q?vRSY+hMwRJ3AaDhcPSPRgaRthc3qkrXSa/+gl3qjDNtr7XTad7YIJLBHvGUX?=
	=?us-ascii?Q?0u7Avvo7B4QWO3rAh/X2cfrGMvsllnIGMcTNnyidKI0fFBK900hmYX1KnRKj?=
	=?us-ascii?Q?EtYaIcxhlhTpzBP98SDq2mOUc5C+LtGkoQ8OT6hRyLpC8k5/4HYgzR4atVAt?=
	=?us-ascii?Q?gqOlKCFsNrAQjvTvy9GN0mn4Iupy3D7nLWj3Yj9O89y0+5cWgmjPsaM8ImYo?=
	=?us-ascii?Q?fwdo/TrTxUXTOs1Vpo295qs9L2kfA9ku5c/+FBFKG85wN+tGfsa87MRgZbVs?=
	=?us-ascii?Q?bFlQLyJNwfq2ZNrexpUbE3EPn7ojpoNQYfhvucoa8F5aqO1NJsvpG345S8vI?=
	=?us-ascii?Q?Hp2fPZeUt+CrNVdzjiFD3b1bS3Rm0YEqr9zxHHTUPOq/lzCl3A5zSplb+pI5?=
	=?us-ascii?Q?0Cau0gEK+Es2HIb7WYBYWAgZYu7NkwVQhspo11FcTVH9+bIfpXX90SMdUwzE?=
	=?us-ascii?Q?v8lA21fQpp73l7yabXnvIlKHSZ6Q84DkF/CDFz3Gzz9m6TJBU9EndcRm3fUF?=
	=?us-ascii?Q?1nIQ7EyB0/eG8HdbFy/0LNULyccp3hW/mtvSig4E8ZLp56q6Q+HrL53+epbt?=
	=?us-ascii?Q?q7Xi9ZzH2jiH8NpraxTtnTl3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3209476-1d37-4ed5-0a42-08d9802fda5b
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2021 14:22:06.8041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tiIJeKZTm0NMRsGnY2K53/1BiS+YDfeSqCZXsaX/PIrh/YdKdeL7GOFNKvPtMD0JA0G/CMVSll/uUGRNqWro5A==
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18PEMDMc014641
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, zzhou@suse.com
Subject: [Cluster-devel] [PATCH 3/5] dlm_controld: add reload_config feature
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Signed-off-by: Heming Zhao <heming.zhao@suse.com>
---
 dlm_controld/action.c        |   5 ++
 dlm_controld/config.c        | 119 ++++++++++++++++++++++++++++----
 dlm_controld/dlm_controld.h  |   1 +
 dlm_controld/dlm_daemon.h    |   4 ++
 dlm_controld/lib.c           |  19 ++++++
 dlm_controld/libdlmcontrol.h |   1 +
 dlm_controld/logging.c       |  18 +++--
 dlm_controld/main.c          | 128 +++++++++++++++++++++--------------
 dlm_tool/main.c              |  21 +++++-
 9 files changed, 247 insertions(+), 69 deletions(-)

diff --git a/dlm_controld/action.c b/dlm_controld/action.c
index 0eff27997e1c..baddaf81cb4f 100644
--- a/dlm_controld/action.c
+++ b/dlm_controld/action.c
@@ -766,6 +766,11 @@ static int set_configfs_cluster(const char *name, char *str, int num)
 	return 0;
 }
 
+int set_configfs_opt(const char *name, char *str, int num)
+{
+	return set_configfs_cluster(name, str, num);
+}
+
 #define NET_RMEM_DEFAULT 4194304
 #define NET_RMEM_MAX 4194304
 
diff --git a/dlm_controld/config.c b/dlm_controld/config.c
index 947480dabe85..91ca10a62b15 100644
--- a/dlm_controld/config.c
+++ b/dlm_controld/config.c
@@ -188,6 +188,55 @@ static void get_val_str(char *line, char *val_out)
 	strcpy(val_out, val);
 }
 
+inline static void reload_setting(int index)
+{
+	switch(index) {
+	case log_debug_ind:
+		set_configfs_opt("log_debug", NULL, opt(log_debug_ind));
+		break;
+	case debug_logfile_ind:
+		set_logfile_priority();
+		break;
+	default:
+		break;
+	}
+}
+
+static void reset_opt_value(int index)
+{
+	struct dlm_option *o = &dlm_options[index];
+
+	/* config priority: cli, config file, default */
+
+	if (o->cli_set) {
+		o->use_int = o->cli_int;
+		o->use_uint = o->cli_uint;
+		o->use_str = o->cli_str;
+
+	} else if (o->file_set) {
+		o->use_int = o->file_int;
+		o->use_uint = o->file_uint;
+		o->use_str = o->file_str;
+
+	} else {
+		o->use_int = o->default_int;
+		o->use_uint = o->default_uint;
+		o->use_str = (char *)o->default_str;
+	}
+
+	/*
+	 * We don't handle reset value same as legacy value.
+	 *
+	 * i.e.
+	 * 1. option abc default value is 0, while in dlm.conf abc=0.
+	 * 2. Then remove abc from dlm.conf.
+	 * 3. This function still call reload_setting(), and won't bypass this calling
+	 *    for no change.
+	 */
+	reload_setting(index);
+	return;
+}
+
 void set_opt_file(int update)
 {
 	unsigned int uval = 0;
@@ -195,7 +244,8 @@ void set_opt_file(int update)
 	FILE *file;
 	char line[MAX_LINE];
 	char str[MAX_LINE];
-	int i, val = 0;
+	int i, val = 0, ind;
+	char scanned_dlm_opt[dlm_options_max];
 
 	if (!path_exists(CONF_FILE_PATH))
 		return;
@@ -204,6 +254,12 @@ void set_opt_file(int update)
 	if (!file)
 		return;
 
+	/* In update mode, there is a little bit bother if one option ever set
+	 * but later be removed or commented out */
+	memset(scanned_dlm_opt, 0, sizeof(scanned_dlm_opt));
+	scanned_dlm_opt[help_ind] = 1;
+	scanned_dlm_opt[version_ind] = 1;
+
 	while (fgets(line, MAX_LINE, file)) {
 		if (line[0] == '#')
 			continue;
@@ -226,30 +282,31 @@ void set_opt_file(int update)
 			str[i] = line[i];
 		}
 
-		o = get_dlm_option(str);
+		ind = get_ind_name(str);
+		if (ind < 0)
+			continue;
+		o = &dlm_options[ind];
 		if (!o)
 			continue;
 
-		/* Doesn't make sense to set this in conf file. */
-		if (!strcmp(str, "daemon_debug"))
+		scanned_dlm_opt[ind] = 1;
+
+		/* In update flow, option item doesn't support reload. */
+		if (update && !o->reload)
 			continue;
 
 		o->file_set++;
 
 		if (!o->req_arg) {
-			/* ignore any = x */
-
-			o->file_int = 1;
-
-			if (!o->cli_set)
-				o->use_int = o->file_int;
-
-			log_debug("config file %s = %d cli_set %d use %d",
-				  o->name, o->file_int, o->cli_set, o->use_int);
+			/* current only help & version are no_arg type, ignore */
+			continue;
 
 		} else if (o->req_arg == req_arg_int) {
 			get_val_int(line, &val);
 
+			if (update && (o->file_int == val))
+				continue;
+
 			o->file_int = val;
 
 			if (!o->cli_set)
@@ -261,6 +318,9 @@ void set_opt_file(int update)
 		} else if (o->req_arg == req_arg_uint) {
 			get_val_uint(line, &uval);
 
+			if (update && (o->file_uint == uval))
+				continue;
+
 			o->file_uint = uval;
 
 			if (!o->cli_set)
@@ -271,8 +331,12 @@ void set_opt_file(int update)
 
 		} else if (o->req_arg == req_arg_bool) {
 			get_val_int(line, &val);
+			val = val ? 1 : 0;
+
+			if (update && (o->file_int == val))
+				continue;
 
-			o->file_int = val ? 1 : 0;
+			o->file_int = val;
 
 			if (!o->cli_set)
 				o->use_int = o->file_int;
@@ -283,6 +347,11 @@ void set_opt_file(int update)
 			memset(str, 0, sizeof(str));
 			get_val_str(line, str);
 
+			if (update && !strcmp(o->file_str, str))
+				continue;
+
+			if (o->file_str)
+				free(o->file_str);
 			o->file_str = strdup(str);
 
 			if (!o->cli_set)
@@ -291,6 +360,28 @@ void set_opt_file(int update)
 			log_debug("config file %s = %s cli_set %d use %s",
 				  o->name, o->file_str, o->cli_set, o->use_str);
 		}
+
+		if (update)
+			reload_setting(ind);
+	}
+
+	if (update) {
+		/* handle commented out options  */
+		for (i=0; i<dlm_options_max; i++) {
+			if (scanned_dlm_opt[i])
+				continue;
+			if (!dlm_options[i].reload || !dlm_options[i].file_set)
+				continue;
+
+			dlm_options[i].file_set = 0;
+			dlm_options[i].file_int = 0;
+			dlm_options[i].file_uint = 0;
+			if(dlm_options[i].file_str) {
+				free(dlm_options[i].file_str);
+				dlm_options[i].file_str = NULL;
+			}
+			reset_opt_value(i);
+		}
 	}
 
 	fclose(file);
diff --git a/dlm_controld/dlm_controld.h b/dlm_controld/dlm_controld.h
index 649b2a5826f9..0ea3548fce7d 100644
--- a/dlm_controld/dlm_controld.h
+++ b/dlm_controld/dlm_controld.h
@@ -35,6 +35,7 @@
 #define DLMC_CMD_RUN_START		15
 #define DLMC_CMD_RUN_CHECK		16
 #define DLMC_CMD_DUMP_RUN		17
+#define DLMC_CMD_RELOAD_CONFIG	18
 
 struct dlmc_header {
 	unsigned int magic;
diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index 436fc9109aa6..9e68f8257cb5 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -132,6 +132,7 @@ struct dlm_option {
 	const char *name;
 	char letter;
 	int req_arg;
+	char reload;
 	const char *desc;
 
 	int use_int;
@@ -383,6 +384,7 @@ int setup_configfs_members(void);
 int check_uncontrolled_lockspaces(void);
 int setup_misc_devices(void);
 int path_exists(const char *path);
+int set_configfs_opt(const char *name, char *str, int num);
 
 /* config.c */
 void set_opt_file(int update);
@@ -471,6 +473,7 @@ struct lockspace *find_ls_id(uint32_t id);
 const char *dlm_mode_str(int mode);
 void cluster_dead(int ci);
 struct dlm_option *get_dlm_option(char *name);
+int get_ind_name(char *s);
 struct run *find_run(char *uuid_str);
 void clear_run(struct run *run);
 void send_helper_run_request(struct run_request *req);
@@ -522,6 +525,7 @@ void init_logging(void);
 void close_logging(void);
 void copy_log_dump(char *buf, int *len);
 void copy_log_dump_plock(char *buf, int *len);
+void set_logfile_priority(void);
 
 /* crc.c */
 uint32_t cpgname_to_crc(const char *data, int len);
diff --git a/dlm_controld/lib.c b/dlm_controld/lib.c
index 53c11cf9f269..951eb6561ba9 100644
--- a/dlm_controld/lib.c
+++ b/dlm_controld/lib.c
@@ -174,6 +174,25 @@ int dlmc_dump_run(char *buf)
 	return do_dump(DLMC_CMD_DUMP_RUN, NULL, buf);
 }
 
+int dlmc_reload_config(void)
+{
+	struct dlmc_header h;
+	int fd, rv;
+
+	init_header(&h, DLMC_CMD_RELOAD_CONFIG, NULL, 0);
+
+	fd = do_connect(DLMC_SOCK_PATH);
+	if (fd < 0) {
+		rv = fd;
+		goto out;
+	}
+
+	rv = do_write(fd, &h, sizeof(h));
+	close(fd);
+ out:
+	return rv;
+}
+
 static int nodeid_compare(const void *va, const void *vb)
 {
 	const int *a = va;
diff --git a/dlm_controld/libdlmcontrol.h b/dlm_controld/libdlmcontrol.h
index ba603feeccf0..ac84e702fb58 100644
--- a/dlm_controld/libdlmcontrol.h
+++ b/dlm_controld/libdlmcontrol.h
@@ -91,6 +91,7 @@ int dlmc_lockspaces(int max, int *count, struct dlmc_lockspace *lss);
 int dlmc_lockspace_nodes(char *lsname, int type, int max, int *count,
 			 struct dlmc_node *nodes);
 int dlmc_print_status(uint32_t flags);
+int dlmc_reload_config(void);
 
 #define DLMC_RESULT_REGISTER	1
 #define DLMC_RESULT_NOTIFIED	2
diff --git a/dlm_controld/logging.c b/dlm_controld/logging.c
index d48b8aebc237..2c57138ce766 100644
--- a/dlm_controld/logging.c
+++ b/dlm_controld/logging.c
@@ -14,6 +14,18 @@ static int logfile_priority;
 static char logfile[PATH_MAX];
 static FILE *logfile_fp;
 
+/* logfile_priority is the only one of these options that
+   can be controlled from command line, environment variable
+   and dynamic setting.
+ */
+void set_logfile_priority(void)
+{
+	if (opt(debug_logfile_ind))
+		logfile_priority = LOG_DEBUG;
+	else
+		logfile_priority = DEFAULT_LOGFILE_PRIORITY;
+}
+
 void init_logging(void)
 {
 	mode_t old_umask;
@@ -24,11 +36,7 @@ void init_logging(void)
 	logfile_priority = DEFAULT_LOGFILE_PRIORITY;
 	strcpy(logfile, DEFAULT_LOGFILE);
 
-	/* logfile_priority is the only one of these options that
-	   can be controlled from command line or environment variable */
-
-	if (opt(debug_logfile_ind))
-		logfile_priority = LOG_DEBUG;
+	set_logfile_priority();
 
 	if (logfile[0]) {
 		old_umask = umask(0077);
diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index 504cafa12ec6..a49bb0c9b9ad 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -1230,6 +1230,10 @@ static void process_connection(int ci)
 		client_dead(ci);
 		break;
 #endif
+	case DLMC_CMD_RELOAD_CONFIG:
+		set_opt_file(1);
+		break;
+
 	default:
 		log_error("process_connection %d unknown command %d",
 			  ci, h.command);
@@ -1749,12 +1753,13 @@ static void print_usage(void)
 
 static void set_opt_default(int ind, const char *name, char letter, int arg_type,
 			    int default_int, const char *default_str,
-			    unsigned int default_uint, const char *desc)
+			    unsigned int default_uint, char reload, const char *desc)
 {
 	dlm_options[ind].name = name;
 	dlm_options[ind].letter = letter;
 	dlm_options[ind].req_arg = arg_type;
 	dlm_options[ind].desc = desc;
+	dlm_options[ind].reload = reload;
 	dlm_options[ind].default_int = default_int;
 	dlm_options[ind].default_str = default_str;
 	dlm_options[ind].default_uint = default_uint;
@@ -1766,142 +1771,142 @@ static void set_opt_default(int ind, const char *name, char letter, int arg_type
 static void set_opt_defaults(void)
 {
 	set_opt_default(daemon_debug_ind,
-			"daemon_debug", 'D', no_arg,
-			0, NULL, 0,
+			"daemon_debug", 'D', req_arg_bool,
+			0, NULL, 0, 1,
 			"enable debugging to stderr and don't fork");
 
 	set_opt_default(foreground_ind,
-			"foreground", '\0', no_arg,
-			0, NULL, 0,
+			"foreground", '\0', req_arg_bool,
+			0, NULL, 0, 0,
 			"don't fork");
 
 	set_opt_default(log_debug_ind,
-			"log_debug", 'K', no_arg,
-			0, NULL, 0,
+			"log_debug", 'K', req_arg_bool,
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
-			"debug_logfile", 'L', no_arg,
-			0, NULL, 0,
+			"debug_logfile", 'L', req_arg_bool,
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
-			"plock_debug", 'P', no_arg,
-			0, NULL, 0,
+			"plock_debug", 'P', req_arg_bool,
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
 
-static int get_ind_name(char *s)
+int get_ind_name(char *s)
 {
 	char name[PATH_MAX];
 	char *p = s;
@@ -1948,11 +1953,12 @@ struct dlm_option *get_dlm_option(char *name)
 static void set_opt_cli(int argc, char **argv)
 {
 	struct dlm_option *o;
-	char *arg1, *p, *arg_str;
+	char *arg1, *p, *arg_str, *endptr;
+	char bool_str[]="1";
 	char bundled_letters[8];
 	int b, blc = 0, blc_max = 8;
 	int debug_options = 0;
-	int i, ind;
+	int i, ind, bundled;
 
 	if (argc < 2)
 		return;
@@ -1996,20 +2002,26 @@ static void set_opt_cli(int argc, char **argv)
 		o = &dlm_options[ind];
 		o->cli_set++;
 
-		if (!o->req_arg) {
-			/* "-x" has same effect as "-x 1" */
-			o->cli_int = 1;
-			o->use_int = 1;
+		if (!o->req_arg || (o->req_arg == req_arg_bool)) {
+			bundled = 0;
 
-			/* save bundled, arg-less, single letters, e.g. -DKP */
+			/* current for no_arg type, there is not possible to have bundled options.
+			 * for req_arg_bool, bundled options, e.g. -DKP. all treat as "true".
+			 * below code save bundled, arg-less, single letters */
 			if ((p[0] == '-') && isalpha(p[1]) && (strlen(p) > 2)) {
 				for (b = 2; b < strlen(p) && blc < blc_max; b++) {
 					if (!isalpha(p[b]))
 						break;
 					bundled_letters[blc++] = p[b];
+					bundled = 1;
 				}
 			}
-			continue;
+			if (bundled) {
+				/* "-x" has same effect as "-x 1" */
+				o->cli_int = 1;
+				o->use_int = 1;
+				continue;
+			}
 		}
 
 		arg_str = NULL;
@@ -2024,17 +2036,31 @@ static void set_opt_cli(int argc, char **argv)
 
 		} else {
 			/* space separates arg from name or letter */
-			if (i >= argc) {
-				fprintf(stderr, "option %s no arg", p);
-				exit(EXIT_FAILURE);
+			if (o->req_arg == req_arg_bool) {
+				/* bool type treat empty arg as true */
+				if (i >= argc || argv[i][0] == '-')
+					arg_str = bool_str;
+				else
+					arg_str = argv[i++];
+			} else {
+				if (i >= argc) {
+					fprintf(stderr, "option %s no arg\n", p);
+					exit(EXIT_FAILURE);
+				}
+				arg_str = argv[i++];
 			}
-			arg_str = argv[i++];
 		}
 
 		if (!arg_str || arg_str[0] == '-' || arg_str[0] == '\0') {
-			fprintf(stderr, "option %s requires arg", p);
+			fprintf(stderr, "option %s requires arg\n", p);
 			exit(EXIT_FAILURE);
 		}
+		if ((o->req_arg != req_arg_str) && !strtol(arg_str, &endptr, 10)) {
+			if (endptr == arg_str) {
+				fprintf(stderr, "option %s requires digit number\n", p);
+				exit(EXIT_FAILURE);
+			}
+		}
 
 		if (o->req_arg == req_arg_str) {
 			o->cli_str = strdup(arg_str);
@@ -2059,6 +2085,7 @@ static void set_opt_cli(int argc, char **argv)
 			fprintf(stderr, "unknown option char %c\n", bundled_letters[i]);
 			exit(EXIT_FAILURE);
 		}
+		/* bundled letter must be bool type, treat it with "true" value */
 		o = &dlm_options[ind];
 		o->cli_set++;
 		o->cli_int = 1;
@@ -2109,8 +2136,11 @@ int main(int argc, char **argv)
 	 * - explicit cli setting will override default,
 	 * - explicit file setting will override default
 	 * - explicit file setting will not override explicit cli setting
+	 *
+	 * "dlm reload_config" will trigger to reload config file, and
+	 * reload action also follows the rule: not override explicit
+	 * cli setting
 	 */
-
 	set_opt_defaults();
 	set_opt_cli(argc, argv);
 	set_opt_file(0);
@@ -2128,7 +2158,7 @@ int main(int argc, char **argv)
 	INIT_LIST_HEAD(&run_ops);
 	init_daemon();
 
-	if (!opt(daemon_debug_ind) && !opt(foreground_ind)) {
+	if (!opt(foreground_ind)) {
 		if (daemon(0, 0) < 0) {
 			perror("daemon error");
 			exit(EXIT_FAILURE);
diff --git a/dlm_tool/main.c b/dlm_tool/main.c
index 53d9336d59c6..07f020d71a66 100644
--- a/dlm_tool/main.c
+++ b/dlm_tool/main.c
@@ -47,6 +47,7 @@
 #define OP_RUN_CANCEL			17
 #define OP_RUN_LIST			18
 #define OP_DUMP_RUN			19
+#define OP_RELOAD_CONFIG	20
 
 static char *prog_name;
 static char *lsname;
@@ -196,7 +197,7 @@ static void print_usage(void)
 	printf("dlm_tool [command] [options] [name]\n");
 	printf("\n");
 	printf("Commands:\n");
-	printf("ls, status, dump, dump_config, fence_ack\n");
+	printf("ls, status, dump, dump_config, reload_config, fence_ack\n");
 	printf("log_plock, plocks\n");
 	printf("join, leave, lockdebug\n");
 	printf("run, run_start, run_check, run_cancel, run_list\n");
@@ -363,6 +364,12 @@ static void decode_arguments(int argc, char **argv)
 			opt_ind = optind + 1;
 			need_lsname = 0;
 			break;
+		} else if (!strncmp(argv[optind], "reload_config", 13) &&
+			   (strlen(argv[optind]) == 13)) {
+			operation = OP_RELOAD_CONFIG;
+			opt_ind = optind + 1;
+			need_lsname = 0;
+			break;
 		} else if (!strncmp(argv[optind], "plocks", 6) &&
 			   (strlen(argv[optind]) == 6)) {
 			operation = OP_PLOCKS;
@@ -1472,6 +1479,14 @@ static void do_dump(int op)
 	printf("\n");
 }
 
+static void do_reload_config(void)
+{
+	if (dlmc_reload_config() < 0)
+		printf("Issue reload_config failed.\n");
+	else
+		printf("Issue reload_config done.\n");
+}
+
 static void do_log_plock(void)
 {
 	char buf[DLMC_DUMP_SIZE];
@@ -1570,6 +1585,10 @@ int main(int argc, char **argv)
 		do_dump(operation);
 		break;
 
+	case OP_RELOAD_CONFIG:
+		do_reload_config();
+		break;
+
 	case OP_LOG_PLOCK:
 		do_log_plock();
 		break;
-- 
2.32.0


