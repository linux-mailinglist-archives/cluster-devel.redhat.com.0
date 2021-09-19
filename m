Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AC2FC410A78
	for <lists+cluster-devel@lfdr.de>; Sun, 19 Sep 2021 08:47:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-LbmM2ZcJMMOgPYqaeWp0eQ-1; Sun, 19 Sep 2021 02:47:05 -0400
X-MC-Unique: LbmM2ZcJMMOgPYqaeWp0eQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86B5E824FAE;
	Sun, 19 Sep 2021 06:47:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53A0119723;
	Sun, 19 Sep 2021 06:47:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3FD6E1800B8B;
	Sun, 19 Sep 2021 06:47:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18J6iB5P030437 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 19 Sep 2021 02:44:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 25F1A63AF6; Sun, 19 Sep 2021 06:44:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F53263AFC
	for <cluster-devel@redhat.com>; Sun, 19 Sep 2021 06:44:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06790800B29
	for <cluster-devel@redhat.com>; Sun, 19 Sep 2021 06:44:11 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-145-K820YrNiPUuHz7qNmNCFxw-1;
	Sun, 19 Sep 2021 02:44:07 -0400
X-MC-Unique: K820YrNiPUuHz7qNmNCFxw-1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-35-gNslcYhrOIK05qq-XLzkCg-1; Sun, 19 Sep 2021 08:44:05 +0200
X-MC-Unique: gNslcYhrOIK05qq-XLzkCg-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB7PR04MB5113.eurprd04.prod.outlook.com (2603:10a6:10:14::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4523.14; Sun, 19 Sep 2021 06:44:04 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d]) by DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d%6]) with mapi id 15.20.4523.018;
	Sun, 19 Sep 2021 06:44:04 +0000
From: Heming Zhao <heming.zhao@suse.com>
To: teigland@redhat.com, aahringo@redhat.com, cluster-devel@redhat.com
Date: Sun, 19 Sep 2021 14:43:17 +0800
Message-ID: <20210919064322.1670-6-heming.zhao@suse.com>
In-Reply-To: <20210919064322.1670-1-heming.zhao@suse.com>
References: <20210919064322.1670-1-heming.zhao@suse.com>
X-ClientProxiedBy: HK2PR02CA0186.apcprd02.prod.outlook.com
	(2603:1096:201:21::22) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (123.123.135.184) by
	HK2PR02CA0186.apcprd02.prod.outlook.com (2603:1096:201:21::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14
	via Frontend Transport; Sun, 19 Sep 2021 06:44:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5ce509d-723f-48a6-65a9-08d97b38df16
X-MS-TrafficTypeDiagnostic: DB7PR04MB5113:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB511344A0C5537BDFF7CFBEF297DF9@DB7PR04MB5113.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: SqHJqFLidcf6rpixLr4/bcjpbztoMqRutnvMTHJKdEqW0EOjP4IJIUFEIkcg0GaQ6djQeiGgshZTePFl2GGApbuZYup8qZUqmdoZ3sfhGfQuTowsubrCk3AVZ7mC/NijiaLI1/SYDDe8Xk5DHYT7TvcTVvTCvih4XudF3g5k7JdBGytf2c+CNiYapSwSh+8QwV4lzABjFNJCD6MGpKElA4LK1eIi0eiI5JUcCao8H19EeiQ2fxrygVLo1rnZ19813dQHhgugRyrrCr2lHowCQH1/+Q++ZrhKbClkPqmfV0EjkZt6SHIvgq8JCT19Kq6Zu8wT2i+dlmLrzZsuYkZ7uJkguWehcgiry6/uSE4lMbLYZMoJnyJINaOTzf9qHwwDnP4VV1GkcSj4wwlnBMib0PM2OnhItH1U6xOglfHnJMQ+E2UoQn7+vGL/fvd6bUp+zS3N9MpyNSoW+bE6QESAIBss9Hp5GGMzYqnBqtBnOiA29Q3uT2HpPNoTI8q3/hEe4WpfO1FzDE4VH1VEoLz4a85FGpF7cDWdFAmVbFiEa1CxNRVjPSoDcfHaxIgm5K8yQXULN+pBaWaCqkXjaLvi8pSh17bppE1N1peGC1w+1PGq9Te3VNpisSoAmfEa92caMQVusB03MzxnnQ3Zx7yvavy0EE4GWkdJa+HZ1bdTeZ1FKajcdZfBNy2hrOBUetg0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(136003)(366004)(39850400004)(396003)(346002)(376002)(66476007)(8676002)(8936002)(86362001)(6486002)(2906002)(478600001)(36756003)(5660300002)(66556008)(66946007)(6496006)(956004)(2616005)(450100002)(1076003)(26005)(4744005)(107886003)(38100700002)(316002)(186003)(44832011)(4326008)(6666004)(9126006);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FE4uT/GEd+/VIY+LgEWHES5LhuCVrMolcdBquBAGgnIbSoh8Z7AGoT/W0pKg?=
	=?us-ascii?Q?FROzoxg/O4Y7Cw/ZCaLKt/gN35pGZ/QsAKjQdo37v5Ib+vSK5qUuFgaEujc1?=
	=?us-ascii?Q?/mkeGIvvprddaI7no7z5xXQQRm5UvlNbSzMyWEMuHA6KnYG2exjZUtLNo5IF?=
	=?us-ascii?Q?+vKYLhvxOP4S6z876D4tHZLg2RQZl0RUFRCNpNtHEy2rCsW2WTLvQA97+0PA?=
	=?us-ascii?Q?nBv3ZJYxlJUQ+B0BF+6X1xgnO7YuXmjl5suBIiqxDszScn7N0EoqEbi80C/i?=
	=?us-ascii?Q?/I2T3swxvwtYvdT/7ghlSTymborHEqP0nl2jgJjozrdYvCC6V3dMWm9f+VGA?=
	=?us-ascii?Q?MOTp44TveUBz4wbiIANG3hEvUnjj1EhvqCUbI6QcPQVNX/0Tpch8gpLVRLXX?=
	=?us-ascii?Q?/0RkNB2tPPMSYifzY3tcYtB5a5k3mdnljBD/4vzdW4MfFseLe0jZbNAeIzqY?=
	=?us-ascii?Q?yD4dzUH8uzZKKUIi8Jzqm+sfH2Ci43JfrYJFi+Ku87rKP7KLzSU1mKbmnq7y?=
	=?us-ascii?Q?byNaBAfzw6/HSgvOAa929hZUYUGIngYOakwLgQ5eE3flF9ooakcSGSgwcBvW?=
	=?us-ascii?Q?HoRmyAD/IZ93qYAttGzZQ1DTRq1iE7ZntN6mjY8yMRL/orkfagdtlSW2yZub?=
	=?us-ascii?Q?23akDd3MXVDnR25f4NTbu4A9s0nfhNTCRydj64HiD7hjapl/ersfQqoIdqd6?=
	=?us-ascii?Q?v56YLXe7tJh3JO/+4stqrE8CEenULAmj8+Wc9SXwUWIXQC8jCmQ1a8qBUGDF?=
	=?us-ascii?Q?6PbcLssOTJYUiPqD0Uu9LLU76k/FclFd3X/FTCyYKRDR6TeAie/2qGdLHjq5?=
	=?us-ascii?Q?tMCwUWaAmu+VggxWr7b2MVSBmD8nIZVueDuQRDf2VLoNo4l7dDSAm4Y1PGFX?=
	=?us-ascii?Q?CzZnLRHiFqYSPRg/My6hyeMjyapbN1vUqrS//LvGcgfOpbPp/qAKjaXkYpKn?=
	=?us-ascii?Q?voD2Tye+z6St+M6vvPOYu1Vn2cIdLm44Yyv027oiQRpBzgUiQQu53CAkCZB6?=
	=?us-ascii?Q?UFP8GKJljMyCAToxdEdKeaenPMpyZjNM3gYxGlH/jclSSSM+0Et2l68E5W3A?=
	=?us-ascii?Q?I+EQLASgXt4MH2huYwhCu6pic2M8ckEa/tIAu993wP5hSVxl7qDG469tpuON?=
	=?us-ascii?Q?6ssaZf4jw2ZxJw1hRblnUOfeKRrhiQm+DMJhLxszFDnwbXoyIZakZU0wt2w5?=
	=?us-ascii?Q?xaA4oamMfVsxQDHOE6U4LiZoKs483tKqgQyaZZn6Vhx85aPD9Xw1xwgNAiCy?=
	=?us-ascii?Q?mW44w359mJWlMu5/TBWtxJ/7d0elHhj6h+edn5H+4P3DBEimHHrqR/KhMiD1?=
	=?us-ascii?Q?rK0dt24lUB9tTfJGN0GxxmaM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ce509d-723f-48a6-65a9-08d97b38df16
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2021 06:44:04.1581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jI+0M3iM6QurQSQuH5Jf2NnQTcwGSoHj0v/ZqllTrCxrBMkSQH3hVAk389d1DGnyeK1TpDPrYfMV9WnrQjH3Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5113
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18J6iB5P030437
X-loop: cluster-devel@redhat.com
Cc: zzhou@suse.com
Subject: [Cluster-devel] [PATCH 05/10] dlm_controld: add dynamic setting
	items in "struct dlm_option"
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Signed-off-by: Heming Zhao <heming.zhao@suse.com>
---
 dlm_controld/dlm_daemon.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index eae17a28c749..76f5f4d082a5 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -132,6 +132,7 @@ struct dlm_option {
 	const char *name;
 	char letter;
 	int req_arg;
+	int dynamic;
 	const char *desc;
 
 	int use_int;
@@ -151,6 +152,11 @@ struct dlm_option {
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
-- 
2.32.0


