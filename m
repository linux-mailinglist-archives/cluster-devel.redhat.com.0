Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1DEAB410A76
	for <lists+cluster-devel@lfdr.de>; Sun, 19 Sep 2021 08:47:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-wPGVUXHNN_G0hBOHMUzEPg-1; Sun, 19 Sep 2021 02:47:05 -0400
X-MC-Unique: wPGVUXHNN_G0hBOHMUzEPg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 103B5802935;
	Sun, 19 Sep 2021 06:47:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F26FE5F706;
	Sun, 19 Sep 2021 06:47:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D76D74EA30;
	Sun, 19 Sep 2021 06:47:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18J6hwpC030413 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 19 Sep 2021 02:43:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6E9E763AF6; Sun, 19 Sep 2021 06:43:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 681C863F2A
	for <cluster-devel@redhat.com>; Sun, 19 Sep 2021 06:43:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82C10185A7A4
	for <cluster-devel@redhat.com>; Sun, 19 Sep 2021 06:43:55 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-3-wJaBgW7JOu-KqVcgmIk9Wg-1;
	Sun, 19 Sep 2021 02:43:53 -0400
X-MC-Unique: wJaBgW7JOu-KqVcgmIk9Wg-1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-16-HTChynC8PvSJhaWOoD163A-1; Sun, 19 Sep 2021 08:43:51 +0200
X-MC-Unique: HTChynC8PvSJhaWOoD163A-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB7PR04MB5113.eurprd04.prod.outlook.com (2603:10a6:10:14::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4523.14; Sun, 19 Sep 2021 06:43:50 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d]) by DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d%6]) with mapi id 15.20.4523.018;
	Sun, 19 Sep 2021 06:43:50 +0000
From: Heming Zhao <heming.zhao@suse.com>
To: teigland@redhat.com, aahringo@redhat.com, cluster-devel@redhat.com
Date: Sun, 19 Sep 2021 14:43:15 +0800
Message-ID: <20210919064322.1670-4-heming.zhao@suse.com>
In-Reply-To: <20210919064322.1670-1-heming.zhao@suse.com>
References: <20210919064322.1670-1-heming.zhao@suse.com>
X-ClientProxiedBy: HK2PR0302CA0019.apcprd03.prod.outlook.com
	(2603:1096:202::29) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (123.123.135.184) by
	HK2PR0302CA0019.apcprd03.prod.outlook.com (2603:1096:202::29)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.6
	via Frontend Transport; Sun, 19 Sep 2021 06:43:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c170da32-4d8e-44c7-4b2f-08d97b38d6d9
X-MS-TrafficTypeDiagnostic: DB7PR04MB5113:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5113DC49F700383BE3DC497397DF9@DB7PR04MB5113.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: +SYSAxFIxogT5SycYJBBi+wxqIdSHDMjg5u7vugS87RKoQrP3oEWhRmCEShzC+wbsNiOyYVEIZWquEn+2yhXSwn+38E4H557Sgpt2CqV2w6Se3VQESzIMSbpHae6cYld/x4RdzJ0i1mTNX8pDZZjwWMilMNVUu2aMZEdlV0l536sE5rH0UUjI7eRNW1XRsvCmmQgmrXift2JsOiHxWUetuv+9FydYYF23pPQSgAtj7ipxMcjsJFI8seWL+lbI2avCZ9egF3sXEL0X+Grlk8grZiEIzaTAa1Z62YPwmHXcorP8RA21+38iZ721fsFOXnCvg74ZD49d+yQv06+dxiNo1TuWRf7PBuNUQcQAzi827t4ZZa5pXSDHQkWBkMeRv7n622MJU2dJh5Cy/R6FrEfGGmz/Wq+baIeRvu8pbbJnnAfL80QXpeDfqWPYt4T3SQKDPcY3paw7iNacFNfNbN+b8b+O7uQO7g0SFn0X9EE6Ioddr5gTDiCp1vip1mE7AtF/Mmdfu4cHECxJ4uiUeWVaTvM+ViHghIC2YtXQRD3LNUJjigDskeUsD3wY8IJJS0a/db3CF/kFI4ulhYd2TEYakVskyCJzImu24TZIJ4Z2XXwrYEzm/Db1vVog7kW4vIYVEU8o/G4hIZExlaISKlnp+3JKhAy+7AhHrU9AuPHNREmFDNXuGrpLixqaolF7pO097IJSGAw5tns1JmLLqo/Tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(136003)(366004)(39850400004)(396003)(346002)(376002)(66476007)(8676002)(8936002)(86362001)(6486002)(2906002)(478600001)(36756003)(5660300002)(66556008)(66946007)(6496006)(956004)(2616005)(450100002)(1076003)(26005)(107886003)(38100700002)(316002)(83380400001)(186003)(44832011)(4326008)(6666004)(9126006)(21314003);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0asyrYhRW+j8XFNlPRHL7FAIqCL2UY3e+t8jr2CLFq1AhEpYAPwtIbSqkVLa?=
	=?us-ascii?Q?WtbEMxPasvhq+4XDc0GnIxpMAJzj1PmzV3WVB1QjUc7D4NDYmbyqYXRf1Eo5?=
	=?us-ascii?Q?9iJwBWAeuwq5TCyFVRO0Uu4Gx+aJrFMg+JBGGuEUpIf8IMjb2hvVHWFy5KSe?=
	=?us-ascii?Q?2OEgRFC5KgzrdHzrXoosmr6RD6YQMGyvZj5QMmm/TLBnjkh4x2uQabKj4cw3?=
	=?us-ascii?Q?SLiJswRiqfc9YORQBwDFeA1Q8JiCq+lLfhzujh3rHA3JcXcvIvvahYgDRw/t?=
	=?us-ascii?Q?i0kucRsKti1F53Ud1z89rxoAPFxHoSkNSZjDhwbsGwIP0qzE3fsVBwbN+4pY?=
	=?us-ascii?Q?X0iZr4gI9jb3FM7ciu8+WxXNowihai9l7KbJODO6EEAVlawsZ0Yj4M9UrV0y?=
	=?us-ascii?Q?DL+HEX1m1dSl0a99xa4UnCohTxpQ4YNjY6tQV5orvWCV5pB0nhTYtNeC7NNC?=
	=?us-ascii?Q?hHBUoTod0BH7pcRlEDlliU5POr8gy2aDmrXm6QgCHxMolvQ1OPlb+58gb8vV?=
	=?us-ascii?Q?gvcU5fvI8G4Ce/4DLr+sBZLkVRT0ZUw4LtWfoBYbbXCVHBVPSJ3E5XrGj7Td?=
	=?us-ascii?Q?uJqY2KiQ1OGHmRqcHlQ4G4gCt+5PAdMxFdJe7xhnyyTmBVJ2nKVB6jxQMZIT?=
	=?us-ascii?Q?nEQgNF7w155kL2NqrOkY1TDHWXlvJqN5vFSqW20idPNxS/0r9L6ED3cS5fY7?=
	=?us-ascii?Q?Ray9xvux7lkbqX/1V3gG8gNpM9uFL67PNoF3S9dRMr0Zagi35WlfsdlhclqD?=
	=?us-ascii?Q?GeWsgQnVBJkvT+i4VI7akCOJV/0WuDEfqFbAkC03+X+XNjhC+jdNuGRz1x3S?=
	=?us-ascii?Q?g4PnW1tPMuuaiUhDq8M2tRVjDs68cYlf/YnpOWEDsUMCdng9FHpJGUdIv0cs?=
	=?us-ascii?Q?T4h3eUiyzCefb5A4FBROneH/SB52do9B/HTM3k9Ut1+J3NN/oiWoVy3F/6qq?=
	=?us-ascii?Q?XSkctDQKu3outo/RQq1PXoFxB8D60W0QO+DlMwtkK/MXH+4lRMAgvvcZi4Uk?=
	=?us-ascii?Q?/tTgNTykxj0LeU7g2FQL+gEqyYZQsNz26SutAwToCdNkpmbTMfUBZXJm/0k4?=
	=?us-ascii?Q?m+XTzF6r3acm2JFFcP7Kp1P6j3gJL+BVrgOVgFgbXBr61iRFwCV9z289ScDs?=
	=?us-ascii?Q?f0vPa9tO4ZqBwOohLRFOS67W8nsITiAgVMQJb1HG+RMtqortOygt5U9Su6//?=
	=?us-ascii?Q?cNdgaxrS1Z6UbP5WhaIdYESfvCP0XZe4Jdx+1wM1fG6gfQgwosEmpTZu1Zpg?=
	=?us-ascii?Q?9crhmugxVK0I0HfOyEaMXuI7kd7bvolFdGp063rRB5Fv1Zd72SG0sUWmSnYA?=
	=?us-ascii?Q?D7nEmLFDCvIq2dKwV2qjcNpD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c170da32-4d8e-44c7-4b2f-08d97b38d6d9
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2021 06:43:50.5155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: osf5f/z/m9E+0/pJwAEY1A3mwByrdQSDa90jkZwW5BwwE9WHFpw7lBEtNtZP81u16saIEaif2qQV5pRHZjQOcg==
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18J6hwpC030413
X-loop: cluster-devel@redhat.com
Cc: zzhou@suse.com
Subject: [Cluster-devel] [PATCH 03/10] dlm_tool man: add dynamic setting and
	examples
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

Signed-off-by: Heming Zhao <heming.zhao@suse.com>
---
 dlm_tool/dlm_tool.8 | 57 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/dlm_tool/dlm_tool.8 b/dlm_tool/dlm_tool.8
index 086596c67dbf..cdfe948815bf 100644
--- a/dlm_tool/dlm_tool.8
+++ b/dlm_tool/dlm_tool.8
@@ -176,6 +176,8 @@ dlm_tool run|run_start [-n] \fIcommand\fP
 "lvm lvchange --refresh"
 .br
 "lvm lvs"
+.br
+"opt dlm_controld-config-item=x"  (see below \fBEXAMPLES\fP section)
 .RE
 
 -
@@ -194,6 +196,61 @@ dlm_tool -h
 
 dlm_tool -V
 
+.SH EXAMPLES
+
+command \fIdlm_tool run "opt xxx"\fP can do the dynamic config job. It makes possible to debug, or to do flexible operations on the fly.
+
+If the line of "dlm_tool dump_config" output leading with "(*)", the START symbol, it means this item supports dynamic config. i.e.
+
+.RS 4
+.EX
+# dlm_tool dump_config | grep log_debug
+(*-) log_debug=1
+.EE
+
+The "log_debug" supports dynamic setting.
+.br
+The '-' (minus) means dynamic config doesn't take effect on this item.
+.br
+If "(*-)" becomes "(*+)", it means this item is dynamically changed on the fly.
+.RE
+
+
+Below show options: restore, restore_all
+
+.RS 4
+.EX
+# dlm_tool dump_config | grep log_debug
+(*-) log_debug=1
+# dlm_tool run "opt log_debug=0"
+# dlm_tool dump_config | grep log_debug
+(*+) log_debug=0
+
+# dlm_tool run "opt log_debug=1"
+# dlm_tool dump_config | grep log_debug
+(*+) log_debug=1
+
+# dlm_tool run "opt log_debug=restore"
+# dlm_tool dump_config | grep log_debug
+(*-) log_debug=1
+
+# dlm_tool dump_config | grep _debug
+(*-) daemon_debug=0
+(*-) log_debug=1
+(*-) plock_debug=0
+# dlm_tool run "opt daemon_debug=1 log_debug=0"
+# dlm_tool dump_config | grep _debug
+(*+) daemon_debug=1
+(*+) log_debug=0
+(*-) plock_debug=0
+# dlm_tool run "opt restore_all"
+# dlm_tool dump_config | grep _debug
+(*-) daemon_debug=0
+(*-) log_debug=1
+(*-) plock_debug=0
+.EE
+.RE
+
 .SH SEE ALSO
 .BR dlm_controld (8),
 .BR dlm.conf (5)
-- 
2.32.0


