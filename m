Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3C090410A7D
	for <lists+cluster-devel@lfdr.de>; Sun, 19 Sep 2021 08:47:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-d06T_z3FM32orS-u_1sj_w-1; Sun, 19 Sep 2021 02:47:32 -0400
X-MC-Unique: d06T_z3FM32orS-u_1sj_w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11D78180831B;
	Sun, 19 Sep 2021 06:47:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02D645C1A3;
	Sun, 19 Sep 2021 06:47:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C623C1800B8B;
	Sun, 19 Sep 2021 06:47:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18J6iMnw030470 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 19 Sep 2021 02:44:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6EAB8100A20A; Sun, 19 Sep 2021 06:44:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A0B61112875
	for <cluster-devel@redhat.com>; Sun, 19 Sep 2021 06:44:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4ECC91066681
	for <cluster-devel@redhat.com>; Sun, 19 Sep 2021 06:44:22 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-392-vMhjdpNBP3KY3VAoBUikQg-1;
	Sun, 19 Sep 2021 02:44:20 -0400
X-MC-Unique: vMhjdpNBP3KY3VAoBUikQg-1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-34-pP3rvxwzMUevilSkPhwI7A-1; Sun, 19 Sep 2021 08:44:18 +0200
X-MC-Unique: pP3rvxwzMUevilSkPhwI7A-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB7PR04MB5113.eurprd04.prod.outlook.com (2603:10a6:10:14::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4523.14; Sun, 19 Sep 2021 06:44:17 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d]) by DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d%6]) with mapi id 15.20.4523.018;
	Sun, 19 Sep 2021 06:44:17 +0000
From: Heming Zhao <heming.zhao@suse.com>
To: teigland@redhat.com, aahringo@redhat.com, cluster-devel@redhat.com
Date: Sun, 19 Sep 2021 14:43:19 +0800
Message-ID: <20210919064322.1670-8-heming.zhao@suse.com>
In-Reply-To: <20210919064322.1670-1-heming.zhao@suse.com>
References: <20210919064322.1670-1-heming.zhao@suse.com>
X-ClientProxiedBy: HK2PR02CA0185.apcprd02.prod.outlook.com
	(2603:1096:201:21::21) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (123.123.135.184) by
	HK2PR02CA0185.apcprd02.prod.outlook.com (2603:1096:201:21::21)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14
	via Frontend Transport; Sun, 19 Sep 2021 06:44:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02c6f602-aabd-460f-df2a-08d97b38e708
X-MS-TrafficTypeDiagnostic: DB7PR04MB5113:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5113784904860781FEDBF04597DF9@DB7PR04MB5113.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:131
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: 4wumWBt93lWPmCiDcjpwBgBfNY7dt3JEdLyDuP0lRHhknyF1oPjF0aasn9la8wesBh7iHirM7iJLt84Lhl8muzR7SG8d4kYgLsJQXV5dXhuN2Gvsskntf5wDHEfzgzkRez5UJjOrCTjqGNl6oYRSlE2PG0/Lk2NkrzRX+TlIts3eGiL/WLrq2AJ3d2DnhZzDFC59nanysPJfjxdbRdsMBbs0vMxvWkpLOtnpQWuCCuyzDTCZozJ65r7JTxExIFu2y5i1Z12LTqZ5dUCos11Xjy/Z7lXUCEhOJN9MsshWY46KN9zKOBJFbZcQeKh+JXbw+8VWf957R5oE5C3YSpUVfGp/NZZYyXp1qsFv7GIOD1KkRok5tA0RhzCuFw0XyTn+3Ml1oHe/e0znhEZuI+5O8mint0K4P2EC+9J/KQADPqcVwV3NvdkX9mMJIHPOgDNeN+xePFk2W8qBBjoaeonbjp81UH04aFFNxhMsGclrsaPBSC9fItidx64egLwfF/xYKb8J5Te+83yVZEfD0/QNaej88CWPb+li8paKJuxK8OPUsjwNIY2Lqtwzu0RDFqhWGoq+J8SSxPWAzYHHqcBAHVnDw9lY+84SZZTxqK9VE2x97v1nAAytc9kzSSQr3Mt/UBr4n1c7WJ/ng23+eFmPROQJxPnweZeEKCABIBQSiDdn3hDQeN/mzGNAfY+0XY+h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(136003)(366004)(39850400004)(396003)(346002)(376002)(66476007)(8676002)(8936002)(86362001)(6486002)(2906002)(478600001)(36756003)(5660300002)(66556008)(66946007)(6496006)(956004)(2616005)(450100002)(1076003)(26005)(107886003)(38100700002)(316002)(83380400001)(186003)(44832011)(4326008)(9126006);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ETD421GxVW+3aEGfNJl8gPIRBUNsSgBtCHWS9PyICiLvNZBUU8gh1l0rzFzm?=
	=?us-ascii?Q?bGdE91bFrEgu2PSkp1Cc0l0s4V98nz2tt2ET+yDGKc6f5MYJokjFBuM271lP?=
	=?us-ascii?Q?vYtU1mdJCaHu0xVmV+xpqV/+LuLHonV+2VXnCfZgiXL7TXUC/iJe2+0p63/e?=
	=?us-ascii?Q?MBmWqLsPbMsDP6qr3Rez7cVDRCCWqPTWChu+TddMqu4VJLtH/2M+xlRo0tNW?=
	=?us-ascii?Q?WEx4BT8gpcEKd49e2Iaa2QbaCjqgawAedP6gw7YF925qDpinIzuNYDRAHkjv?=
	=?us-ascii?Q?Ye/C97+EOC1nS4RrqJMNGJHGslJEjMPAv5Hl/g8lKgl627Fyln2wDhWwTDGZ?=
	=?us-ascii?Q?gXEg0PRTAaSrjpD9dte8wXij3gk67+I1G8oEWu2S/QXGE/nGDHyzZnvsZk3y?=
	=?us-ascii?Q?paNKTKY05dGgkkqDgJbP6EI0iOeuZFWbP3fJEUZYLaDzaUgHbEzJGWRRYYgS?=
	=?us-ascii?Q?88RtbarXDcZ+TfvpEJYLTSdck5jeWPbkmjyvBfUNGzODQFURmmTyjAGPQvji?=
	=?us-ascii?Q?Csu9JqpHMeNrOSFODydhG4Z8s08v1J8uf4/ic/1JuMZF43BHp5ygli58OFAj?=
	=?us-ascii?Q?/zQnznHq5ticuOLiZz9Bzc1PRaOBOCjKA9MIJeMb9EGk7mqC3R8vA1bsJOoU?=
	=?us-ascii?Q?amgtpSstGnGyHSs5NNAyBjwhdV6GJ1S31KBB/uEd/q1IldTV6GX8avW+hElP?=
	=?us-ascii?Q?u4aDV0IgGYrDl1NCYGSKs+vZHVbfz5MO6Azz0AjUCv/XJ5XxEM4A27ycWLB4?=
	=?us-ascii?Q?26c4ADhVxrXJHsOY9s2A/M7evW96VkOlH57cJjdDyw0vvxwDzTYWfSfFGNvJ?=
	=?us-ascii?Q?JXBCqryT59wBbyL+wkkzW4ePmPnAPBRy0+Z+q565/nHLppA2Fl7SF/e16FqB?=
	=?us-ascii?Q?S+WPaYmY3Rr8MIxH8ww9S8F0WwgjSVMLSuyquamvvg/tUIswk3/EXEJs2o3i?=
	=?us-ascii?Q?ayiiFZxtmsLp3rJaiYJnpEnj3uNZHoxkoG2NMbOeoRoVOnM2byoQqeh+vPc+?=
	=?us-ascii?Q?SR0peTUlHTOwKyWkN02VvHZCOn4vgMUxUE1lDQBM13Di2Ua3/fEMCeJf7asX?=
	=?us-ascii?Q?GnodahnXzFN2qKsPLyskEuXG9cjSNMVsQB9LfD8jLsLuAn3M/OCCuEDLEu65?=
	=?us-ascii?Q?WcN9dO8DPnAGq88/s5XaWJqOvdgB+K44YbO06xpzE4wx1x18Q3FoEIGddY3t?=
	=?us-ascii?Q?9mzQox5fA/G8q6IYwQSq65mo4VBjqAEr9XlyW4YhEtaDBIcGXIFgZKrS0lyW?=
	=?us-ascii?Q?e/rL0dPSIk0b+0s0EtSwSH+blO8f+oggM2c9Ba6e6OkHucutlFE1jtkpRKsh?=
	=?us-ascii?Q?1DfU+HUqg1vFQsABG7StrnDa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c6f602-aabd-460f-df2a-08d97b38e708
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2021 06:44:17.4892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fSGwzIiNdpU2EzBrMOzl5MpshcTHfUEZvtzJMAYAvkIP5uXoOSBGOJiE6Yxn5a2g5U/7OcyHcAl4brNId3+ymA==
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18J6iMnw030470
X-loop: cluster-devel@redhat.com
Cc: zzhou@suse.com
Subject: [Cluster-devel] [PATCH 07/10] dlm_controld: make few APIs public
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

This commit makes possible for helper process accessing config info

Signed-off-by: Heming Zhao <heming.zhao@suse.com>
---
 dlm_controld/action.c     |  5 +++++
 dlm_controld/dlm_daemon.h |  3 +++
 dlm_controld/logging.c    | 18 +++++++++++++-----
 dlm_controld/main.c       |  2 +-
 4 files changed, 22 insertions(+), 6 deletions(-)

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
 
diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index e20e98e78707..904bb0b50df9 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -392,6 +392,7 @@ int setup_configfs_members(void);
 int check_uncontrolled_lockspaces(void);
 int setup_misc_devices(void);
 int path_exists(const char *path);
+int set_configfs_opt(const char *name, char *str, int num);
 
 /* config.c */
 void set_opt_file(int update);
@@ -480,6 +481,7 @@ struct lockspace *find_ls_id(uint32_t id);
 const char *dlm_mode_str(int mode);
 void cluster_dead(int ci);
 struct dlm_option *get_dlm_option(char *name);
+int get_ind_name(char *s);
 struct run *find_run(char *uuid_str);
 void clear_run(struct run *run);
 void send_helper_run_request(struct run_request *req);
@@ -531,6 +533,7 @@ void init_logging(void);
 void close_logging(void);
 void copy_log_dump(char *buf, int *len);
 void copy_log_dump_plock(char *buf, int *len);
+void set_logfile_priority(void);
 
 /* crc.c */
 uint32_t cpgname_to_crc(const char *data, int len);
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
index 2a4f33b1b455..91187f2d2402 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -1902,7 +1902,7 @@ static void set_opt_defaults(void)
 			"Print program version information, then exit");
 }
 
-static int get_ind_name(char *s)
+int get_ind_name(char *s)
 {
 	char name[PATH_MAX];
 	char *p = s;
-- 
2.32.0


