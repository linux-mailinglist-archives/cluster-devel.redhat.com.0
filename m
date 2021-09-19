Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id F24C4410A7A
	for <lists+cluster-devel@lfdr.de>; Sun, 19 Sep 2021 08:47:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-yU-9p2-HNPON0tBvfkhG-Q-1; Sun, 19 Sep 2021 02:47:05 -0400
X-MC-Unique: yU-9p2-HNPON0tBvfkhG-Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1FC0802C8A;
	Sun, 19 Sep 2021 06:47:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C28E26B54B;
	Sun, 19 Sep 2021 06:47:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B0A5B1800B9E;
	Sun, 19 Sep 2021 06:47:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18J6iIGR030457 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 19 Sep 2021 02:44:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B81A11112876; Sun, 19 Sep 2021 06:44:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B36DF1112875
	for <cluster-devel@redhat.com>; Sun, 19 Sep 2021 06:44:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C0BF899ECB
	for <cluster-devel@redhat.com>; Sun, 19 Sep 2021 06:44:18 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-50-pxphrDtBPGmYcYp8iynNgA-1;
	Sun, 19 Sep 2021 02:44:13 -0400
X-MC-Unique: pxphrDtBPGmYcYp8iynNgA-1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-30-NIuorzj_M3yCntpPlFhSAA-1; Sun, 19 Sep 2021 08:44:11 +0200
X-MC-Unique: NIuorzj_M3yCntpPlFhSAA-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB7PR04MB5113.eurprd04.prod.outlook.com (2603:10a6:10:14::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4523.14; Sun, 19 Sep 2021 06:44:10 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d]) by DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d%6]) with mapi id 15.20.4523.018;
	Sun, 19 Sep 2021 06:44:10 +0000
From: Heming Zhao <heming.zhao@suse.com>
To: teigland@redhat.com, aahringo@redhat.com, cluster-devel@redhat.com
Date: Sun, 19 Sep 2021 14:43:18 +0800
Message-ID: <20210919064322.1670-7-heming.zhao@suse.com>
In-Reply-To: <20210919064322.1670-1-heming.zhao@suse.com>
References: <20210919064322.1670-1-heming.zhao@suse.com>
X-ClientProxiedBy: HK2PR02CA0178.apcprd02.prod.outlook.com
	(2603:1096:201:21::14) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (123.123.135.184) by
	HK2PR02CA0178.apcprd02.prod.outlook.com (2603:1096:201:21::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14
	via Frontend Transport; Sun, 19 Sep 2021 06:44:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb595e5a-44c0-4c61-5d49-08d97b38e2b8
X-MS-TrafficTypeDiagnostic: DB7PR04MB5113:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5113F2A8B000D80AA0A402F097DF9@DB7PR04MB5113.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: XrMRT2n8Bq0xvMF0/UwfuBA77ErH7ce7mcSmn+YtyMLxR7nPeNfTXET86zP0fJ3DKLQyTqckk3Mt2ghmmb+FMHjekRZLcdGaSUSS/sGnRpRAne1LLwU66KIuE+zlibLcsdyMJIrNdeYJqxlK3Jt3j7477UDLhSQFhpd+O57gLiu9ZCleJg8g06JFb/Mlg2Gqe5tVFKKR38Ta6+n2dN06V2beqIq0CteNnuMA+kmGjYQK6RGfCCYrL7h6F7pxeWlc5E4Ekn9sP8WZH72kIHyyvguwqe3eQsCPtCfdP2oxvyYZn251PGSPn07pMawMxcWNxlj10LLljbRWNC8WARP59a48mRgFfyPPbEIV1/nCBgMpq8fuykPEKciGwTDivmhlQUmWGVAOdcUXWv/yrM3utgonSmB4N1BmtrjQWqAMfWGTJ3T++RSm1TCVZPa3hdEq2Drb7nC8qfZEUHRcwwZkq92bLwAa5/ggY1YtuEIf0TwbuL8AndewPtzBoUG77eb5PmR6EXGotTz3S/waUcq+teYR6gNbIKYTKX7KsQsRDHKTPY7qP0w/NEOPeKzRaOqMR1vzh297+n41bUnX7BD34vAQRBtKbhFfR8bpZ3is+JXZ1Cr06qwvRawfSIguM/eZnuR4urC5vhrFquAtLEj3FnxG2xThGRB+QXJGsRluH4L7nzafMpKJ3d6jvhxQYk/5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(136003)(366004)(39850400004)(396003)(346002)(376002)(66476007)(8676002)(8936002)(86362001)(6486002)(2906002)(478600001)(36756003)(5660300002)(66556008)(66946007)(6496006)(956004)(2616005)(450100002)(1076003)(26005)(107886003)(38100700002)(316002)(83380400001)(186003)(44832011)(4326008)(6666004)(9126006);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9vFHogKfxkpCmh3QGuUS6zfTGyac4Y8uqsfSQLLSTpsbRnLJnkk+pZPR8+QR?=
	=?us-ascii?Q?S/76J8yHMjG3Hn1vB6uzGwXu7dcT25L3jN7aesuzUeCF+L3Y8y2PWYh7xhI0?=
	=?us-ascii?Q?0uZu/m7wA/KuoRlfdgs+/VKEZxFMZehbStxopB7V66Fsm2Tn7P/0ss7+r1Go?=
	=?us-ascii?Q?ZAYmjxZsbRzRwZ4gwBaWmzzdYLRKWiB4IWEsiRhaYtNGLqkoLB/lwVLKACwp?=
	=?us-ascii?Q?8fOwKZs1IsHH1AgeTVirg9jY3ImkdIPYUJm7M6OSs0Nz4B/2ajIjhTFXTWCA?=
	=?us-ascii?Q?utN5BaxDJI+upKix5SzPTCjLCN2g8ZD01benQmWpF28cHJmJ7sGz9l/nJNrS?=
	=?us-ascii?Q?l3RRKRv4K8ong++06SfZVIdG8QPtneuXpd5pPR2uTPR91c0g0lelUtXrTRtn?=
	=?us-ascii?Q?NRgx30Y4b8gRmJeHiv+3D+XJ17vpCjF2KmFUVcJBr6Db1q3la024K/8nNrVR?=
	=?us-ascii?Q?ar3CdrQGBqRE4etYbua5fkM7u4zBtaIhI+W0LgTJkcRFihwDhJjun/T1/ZDS?=
	=?us-ascii?Q?+LvHjvzHQ8adt0WNUrKbgB/Su3g+ZS7acxrmOw0fY+obeh2lY8tbJCRLhpk5?=
	=?us-ascii?Q?mDRPlclLT9iY+ZCdwDPhKlpyt4nQWoOev579Nf9/QJhee32VYEO0OVeifHE9?=
	=?us-ascii?Q?xsR3sLQxH8PAETm55GzgrNytgkrPqT/MOcoGQxgF9ettjJYvxPDeXSOcmMnL?=
	=?us-ascii?Q?7v95S5c7jbljKcpAV0/M3VOOnUD4Hsxq7Mtbk0w7k13bcMB1NYTDdtLrNWA6?=
	=?us-ascii?Q?0VdwHK9yUmSSq8sriILJsdidSPRLtaL1spF7bFoBVHEix4FAMGThFz9+Cbf0?=
	=?us-ascii?Q?3tP/G41cb750ZqrZyzvwpiGxzjhELEBOeJgN11VT9g7TBILpFw/CQZ/Lz0gi?=
	=?us-ascii?Q?pxKu71yPpLZcMk5phgbyL3447Km7QtAs1Gx8TRQ703ft6kobEN9Nlsl7T2jG?=
	=?us-ascii?Q?8lZrryb3KaMwqrhpcai17amGQg7DtsAz6WkSNcNNavSj8QJn/G2xiM9UEQnC?=
	=?us-ascii?Q?BKbKh6RqJAna5YzI5/76/9nX5UwlO76+GItiarLzZt5AuNaOh+h6Qd3x4DYx?=
	=?us-ascii?Q?895CB4lktJP9km3Aj1TA7pGqfLN25IaQPdrWInvVmu2cE4yGQ74zNTNrrZaE?=
	=?us-ascii?Q?r8rAtqN9xiklx5vB7a49hgzIIpfB6EGfyqfCxkwms6PLYkNuA7+wL7lnXucr?=
	=?us-ascii?Q?a4IPT6L7zd7Ft+ytVTEEhQagCnhW91/kIJFVkp6Uk6/4z/N89SD8D6CBj/1T?=
	=?us-ascii?Q?1rdOsgP4tKTP09N7N66H7FWKYTHYGAHQ4R5mBayI4h/Bu0ZTxkY3RbdazWxk?=
	=?us-ascii?Q?mPZ4Na7Fu/AuDw9fdLIPkKHs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb595e5a-44c0-4c61-5d49-08d97b38e2b8
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2021 06:44:10.2482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhvLrIHqJYX57wb9zbhihi9gNKjHl2z9p6PWxptRnDByIuFVaCUhYXinM5Ox3pVfjX6dPHzfU2Gj7R8vInftFg==
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18J6iIGR030457
X-loop: cluster-devel@redhat.com
Cc: zzhou@suse.com
Subject: [Cluster-devel] [PATCH 06/10] dlm_controld: change dlm_options[] to
	shared memory type
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

This commit makes dlm_options[] could be modified after fork().
The patch is foundation to dynamic setting feature.

Signed-off-by: Heming Zhao <heming.zhao@suse.com>
---
 dlm_controld/dlm_daemon.h |  2 +-
 dlm_controld/main.c       | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index 76f5f4d082a5..e20e98e78707 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -159,7 +159,7 @@ struct dlm_option {
 	unsigned int dynamic_uint;
 };
 
-EXTERN struct dlm_option dlm_options[dlm_options_max];
+EXTERN struct dlm_option *dlm_options;
 #define opt(x) dlm_options[x].use_int
 #define opts(x) dlm_options[x].use_str
 #define optu(x) dlm_options[x].use_uint
diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index 504cafa12ec6..2a4f33b1b455 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -14,6 +14,7 @@
 #include <linux/genetlink.h>
 #include <linux/dlm_netlink.h>
 #include <uuid/uuid.h>
+#include <sys/mman.h>
 
 #ifdef USE_SD_NOTIFY
 #include <systemd/sd-daemon.h>
@@ -2104,11 +2105,21 @@ int main(int argc, char **argv)
 	struct sigaction act;
 	int fd, rv;
 
+	/* share the cfg memory for helper process */
+	dlm_options = mmap(NULL, sizeof(struct dlm_option)*dlm_options_max,
+						PROT_READ|PROT_WRITE, MAP_SHARED|MAP_ANON, -1, 0);
+	if (dlm_options == MAP_FAILED) {
+		perror("mmap failed");
+		return 1;
+	}
+
 	/*
-	 * config priority: cli, config file, default
+	 * config priority: dynamic, cli, config file, default
 	 * - explicit cli setting will override default,
 	 * - explicit file setting will override default
 	 * - explicit file setting will not override explicit cli setting
+	 * - explicit dynamic setting will override using value,
+	 *   "dlm_tool dump_config" will show which option is using dynamic setting.
 	 */
 
 	set_opt_defaults();
-- 
2.32.0


