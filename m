Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1F6410A7C
	for <lists+cluster-devel@lfdr.de>; Sun, 19 Sep 2021 08:47:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-pAPe6Hc0MJGc5Mpvrl6yEQ-1; Sun, 19 Sep 2021 02:47:27 -0400
X-MC-Unique: pAPe6Hc0MJGc5Mpvrl6yEQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85BD03630A;
	Sun, 19 Sep 2021 06:47:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7601510190A7;
	Sun, 19 Sep 2021 06:47:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65C101800B9E;
	Sun, 19 Sep 2021 06:47:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18J6ikoD030513 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 19 Sep 2021 02:44:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DF04D1112875; Sun, 19 Sep 2021 06:44:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9CCD10CD2CA
	for <cluster-devel@redhat.com>; Sun, 19 Sep 2021 06:44:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53F37800B29
	for <cluster-devel@redhat.com>; Sun, 19 Sep 2021 06:44:44 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-283-TR7NG_YGNNiD6UKx8DjUgQ-1;
	Sun, 19 Sep 2021 02:44:40 -0400
X-MC-Unique: TR7NG_YGNNiD6UKx8DjUgQ-1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-7-ywHRNaF-N3aIAPJcJIjXtg-1; Sun, 19 Sep 2021 08:44:38 +0200
X-MC-Unique: ywHRNaF-N3aIAPJcJIjXtg-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB7PR04MB5113.eurprd04.prod.outlook.com (2603:10a6:10:14::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4523.14; Sun, 19 Sep 2021 06:44:36 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d]) by DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d%6]) with mapi id 15.20.4523.018;
	Sun, 19 Sep 2021 06:44:36 +0000
From: Heming Zhao <heming.zhao@suse.com>
To: teigland@redhat.com, aahringo@redhat.com, cluster-devel@redhat.com
Date: Sun, 19 Sep 2021 14:43:22 +0800
Message-ID: <20210919064322.1670-11-heming.zhao@suse.com>
In-Reply-To: <20210919064322.1670-1-heming.zhao@suse.com>
References: <20210919064322.1670-1-heming.zhao@suse.com>
X-ClientProxiedBy: HK2PR02CA0147.apcprd02.prod.outlook.com
	(2603:1096:202:16::31) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (123.123.135.184) by
	HK2PR02CA0147.apcprd02.prod.outlook.com (2603:1096:202:16::31)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14
	via Frontend Transport; Sun, 19 Sep 2021 06:44:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58c62300-380f-437c-2647-08d97b38f269
X-MS-TrafficTypeDiagnostic: DB7PR04MB5113:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5113E7F4239E659EEAF34CC797DF9@DB7PR04MB5113.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: /D7NizhRM8yRttNbMKSZyU0vbYPJ/OSOLIK8UW9tXVNxYzFstkch5E6VV+33zNPyAltw+t7kSL6xF24zbZBlFrqHkGk0Z+x+raerE/rRXyiFg/bjM1zg2+yfbHVx1ABgfEdirIoVoFFGprb3pAihRpsSmKz9e60Hr4yZwz8mY3YEAtxWz67cqU2dig+h/KkrPAl70QVi1cA4+CxF9wPqMn2wha0H+Hj3ypbOeT66E2s1jies2Yf2CmQB/LoLLa8NfFrv548My+6qh5vWbm5hzFJ1BgVZ3VbsprJ8q4O6RkEY/NKXKzbDr49k14iVdsNddVetGp0xzXqbHDHbJcEH45/V4A489Idi6c5iSwKVZfGGz0Jy7NazHy5oQeLYAEDcQhs3sWBYiTUqPJ9FNGvULPl73p7nqOlAGLK+HrwFxxMMxL4T03p7VINFE+kRjBX/VxEpaTLINtASMYgKn2x/9Q2P8IXrQDD2AsdZq25vZgqmwP4VtqDppmGot1RhEAPpYzliWrh2Bx37xEu2Tvt1wZPUyt59lm5PWPVaruGshoGXzOa0cwMw+n/nwT5o26fMD72VNE9uyAKC2vrFMm4kibGjjrmqFqvq/MKP0Yqqcy5T+NFFqSYRSUUhA1gPCXJxI6eX3SJ+lAbJjoRoxwkesr3Yjs13hk0dlx5dBvhyXSOArbp056kEibXq9DwYtxpU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(136003)(366004)(39850400004)(396003)(346002)(376002)(66476007)(8676002)(8936002)(86362001)(6486002)(2906002)(478600001)(36756003)(5660300002)(66556008)(66946007)(6496006)(956004)(2616005)(450100002)(1076003)(26005)(107886003)(38100700002)(316002)(83380400001)(186003)(44832011)(4326008)(6666004)(9126006);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/xO387f8EeWQeEW3BPYzzL6AXbm4Z0I/noMnkBFcuTnCTmBlCKn38aAEBbl0?=
	=?us-ascii?Q?olcUdA9mttyBWEzJDY6NIlJ2Cl7M+v3M8aEydPVIop72lW6WQwCq8WXMGqVp?=
	=?us-ascii?Q?1AWqyG9gTyxFQHbW1xrBdxAOxU8XFjcNTFKXv15+gDj9Vnz/U6ycuAWSvvU8?=
	=?us-ascii?Q?0ULAhHtkX4/CllWzro801/ejgN0F6SAr2ibqVzsA0pqPfBzsnymGMugftBZj?=
	=?us-ascii?Q?7CTOecMnHCR150VeThByXIfPhjbzzIk/lJIsJS3n49X/lxyofr/uoRnFt0Af?=
	=?us-ascii?Q?gQfo9HF50cbrVci5nCwTOyK1yiT3xpCk8erU6li9f9ZyjzxX2E2QdQ7CwAJR?=
	=?us-ascii?Q?bITQ6UZOmp6TGQLmHsP136gM5n3OxRudTlFO2+c7FB5+UhOJrc8BjydczLZ9?=
	=?us-ascii?Q?cUuxU0FsSSGqvG4zWzVFc86LMdh9UeuWUPGt7SDPDWL+aXp8NoS7N3UQWob3?=
	=?us-ascii?Q?gZ+rTcHi3qziJqtJ371ozj+DAgg66WD0C2CuPzMDGeLu7sT8C1KHzzxkFqra?=
	=?us-ascii?Q?+9lCGQWzfPdl00it8MskQcljXK1AqwXCGfuYeuv4W+Pll6wmsCAWqi+nDiVX?=
	=?us-ascii?Q?LhBHkI1/wCt5iD9Brtppg9yf3KxWesbUg3D8aFTXHwROJJ4rTN15yy239Y2+?=
	=?us-ascii?Q?hTvirqr/3e3l4zT6sI2YvwfOa7Fv+2N/ASaJJ9bS3+v+smKdqW8DywnGdSxz?=
	=?us-ascii?Q?rkdlMJ1NIroepwqzGO1rmXs+ppBBcC4bAE/mWr4tX8+RtTmnfSI1rZuEa//S?=
	=?us-ascii?Q?k2DHgQRMrGNXUBsuTiQcspYbX4L5VVViribGsVA4cB8kSocKcDelRA+zaXDX?=
	=?us-ascii?Q?QQmhPbZthcIYmTv27Nut29fOiwkpudjkEuzpboCcUY8yFY66KybBtu/v7OJp?=
	=?us-ascii?Q?eACy/pImE7mD28ymE28iqtXkrKVWH27pjb6um24s/UCVOHad0kX8Ac1iobTZ?=
	=?us-ascii?Q?QPcTAWZJ9cGfq/gK3tSOKdxqinGtF1d1T4s1UrIonStWho+jh7wlDQsOybVl?=
	=?us-ascii?Q?rURo1EOC5N2I5oFhXydP57Mu3k3wDLwfP/+N9NbfCtPs+ddvu+gKBI4vRuEs?=
	=?us-ascii?Q?rDDDc6NfvmwiCZxiJXbkD2tu9yyTD+uTdXGf9UoHMLN+6i3jgLXextaReHLI?=
	=?us-ascii?Q?JbYghx2HDHuM8b+8F61dVqCd11hfn1VaZM2CzSxuFwpx0b4OzW07wqa6ENp8?=
	=?us-ascii?Q?4knAbl5FoefwPt1wtCgNcsVAULS/7UN2scc9jlxgbEV1LzfsqREHlzwJ2hyW?=
	=?us-ascii?Q?vLzWtSIHl8IEw3updZ4cRwB7xlnNqKqssSfSGLDiDM9LjH/Pe5NUF2ZFz9g2?=
	=?us-ascii?Q?JeTNbPspkweXKegwkO30N9RV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c62300-380f-437c-2647-08d97b38f269
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2021 06:44:36.7683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jQ5EkxfPrOp98k9eBeho39iAAc/Xp3kDt2XJCRYMeSHi1svrZxvHO0/Vr3xjNQfUSZmckfucEmP9aDaftm7QA==
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18J6ikoD030513
X-loop: cluster-devel@redhat.com
Cc: zzhou@suse.com
Subject: [Cluster-devel] [PATCH 10/10] dlm_controld: enable "dlm_tool
	run|run_start" dynamic setting feature
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

This commit gives dlm_tool the ability to change dlm_controld settings
on the fly.

Signed-off-by: Heming Zhao <heming.zhao@suse.com>
---
 dlm_controld/helper.c | 41 ++++++++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/dlm_controld/helper.c b/dlm_controld/helper.c
index a20965b76195..dd03cb1c973f 100644
--- a/dlm_controld/helper.c
+++ b/dlm_controld/helper.c
@@ -48,6 +48,7 @@ do { \
 
 #define CMD_ID_LVCHANGE_REFRESH 1
 #define CMD_ID_LVS 2
+#define CMD_ID_OPT 3
 
 static int _get_cmd_id(char **av, int av_count)
 {
@@ -64,6 +65,11 @@ static int _get_cmd_id(char **av, int av_count)
 		return CMD_ID_LVS;
 	}
 
+	if ((av_count >= 2) &&
+	    (!strcmp(av[0], "option") || !strcmp(av[0], "opt"))) {
+		return CMD_ID_OPT;
+	}
+
 	return 0;
 }
 
@@ -133,19 +139,19 @@ static void _clear_running_cmd(struct running *running)
 
 /* runs in child process that was forked by helper */
 
-static void exec_command(char *cmd_str, int out_fd)
+static int exec_command(char *cmd_str, int out_fd)
 {
 	char cmd_buf[16];
 	char arg[ONE_ARG_LEN];
 	char *av[MAX_AV_COUNT + 1]; /* +1 for NULL */
 	int av_count = 0;
-	int i, rv, arg_len, cmd_len, cmd_id;
+	int i, rv = -1, arg_len, cmd_len, cmd_id;
 
 	for (i = 0; i < MAX_AV_COUNT + 1; i++)
 		av[i] = NULL;
 
 	if (!cmd_str[0])
-		return;
+		return rv;
 
 	/* this should already be done, but make sure */
 	cmd_str[RUN_COMMAND_LEN - 1] = '\0';
@@ -214,11 +220,26 @@ static void exec_command(char *cmd_str, int out_fd)
 		log_helper("write cmd_buf from child error %d", rv);
 	close(out_fd);
 
-	/* if we return before exec, the child does exit(1) (failure) */
-	if (!cmd_id)
-		return;
+	switch (cmd_id) {
+	case 0:
+		/* if we return from here, the child does exit(1) (failure) */
+		rv = -1;
+		break;
+	case 1:
+	case 2:
+		rv = 0;
+		execvp(av[0], av);
+		break; /* useless */
+	case 3:
+		set_opt_online(av_count-1, av+1);
+		rv = 0;
+		break;
+	default:
+		rv = -1;
+		break;
+	}
 
-	execvp(av[0], av);
+	return rv;
 }
 
 static int read_request(int fd, struct run_request *req)
@@ -352,8 +373,10 @@ int run_helper(int in_fd, int out_fd, int log_stderr)
 				pid = fork();
 				if (!pid) {
 					close(cmd_pipe[0]);
-					exec_command(req.command, cmd_pipe[1]);
-					exit(1);
+					if (exec_command(req.command, cmd_pipe[1]) < 0)
+						exit(1);
+					else
+						exit(0);
 				}
 
 				close(cmd_pipe[1]);
-- 
2.32.0


