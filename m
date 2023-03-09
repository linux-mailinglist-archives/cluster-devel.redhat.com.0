Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 531C96B28C3
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Mar 2023 16:23:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678375432;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7OSDnmgcz9JvS1tVCwQoCQNbQfOJfhN/XirWfopCAvo=;
	b=fN4SG+HxgU/1tfF6LnBORCA+mSgiDl/i6YzZKELYODcx1elxkOJbHQ8iiicn0KKO9b2nN9
	lZVneM4nr+PJNN3OI+vPSMalAfLNbTSzEpjCX2VAALicSNk/135axHJ1jj+zO3+Slk6ETV
	/Q23nShabd4CLWIIM2s2Hnn7tg/JjUw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-PtH-P4tVN_a1cY_jw18lrg-1; Thu, 09 Mar 2023 10:23:48 -0500
X-MC-Unique: PtH-P4tVN_a1cY_jw18lrg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A9ED3C0F1AA;
	Thu,  9 Mar 2023 15:23:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F8E01121314;
	Thu,  9 Mar 2023 15:23:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2EB7119465BB;
	Thu,  9 Mar 2023 15:23:31 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6E6231946597 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  9 Mar 2023 15:23:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 53AB040CF8ED; Thu,  9 Mar 2023 15:23:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B4E24010E7B
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 15:23:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 337573822E03
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 15:23:02 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2124.outbound.protection.outlook.com [40.107.255.124]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-dq1-v3kTNE-DdTsQmPAuvA-5; Thu, 09 Mar 2023 10:22:57 -0500
X-MC-Unique: dq1-v3kTNE-DdTsQmPAuvA-5
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4073.apcprd06.prod.outlook.com (2603:1096:4:f5::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19; Thu, 9 Mar 2023 15:22:20 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 15:22:20 +0000
From: Yangtao Li <frank.li@vivo.com>
To: xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 rpeterso@redhat.com, agruenba@redhat.com, mark@fasheh.com,
 jlbec@evilplan.org, joseph.qi@linux.alibaba.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org
Date: Thu,  9 Mar 2023 23:21:26 +0800
Message-ID: <20230309152127.41427-5-frank.li@vivo.com>
In-Reply-To: <20230309152127.41427-1-frank.li@vivo.com>
References: <20230309152127.41427-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4073:EE_
X-MS-Office365-Filtering-Correlation-Id: 043794d5-fc6b-4b0d-6678-08db20b21307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: zB6/i5Ksh0zI4+rKooh0sNe8ZJMxEIXigfwrfaHKXGYw3SMk4fYCEsAZL2Bp12KI+OGb0Nsdj8NoG/yMPwQNKFRcH61xAs1uzNXblxvrITFrXsawQ0KCdWJ+8Zgk029xSWpJHxZX0BYMHPWmYAL4cjvXtTqby4Z+klBDWi46zIsBPu496JZ1YAv8OCdpj9MG6Wb3fValyFPKszrvAzLQ/hpJ9RZ2SKmAdcUui4mo3J/oU+QlZZxlGfMZodV23sHvbVLSo7DY4G9GSe/JGGOAJXwkvVs59Q5xEW70SCjN9ZM8Wn7xdJkWAalhxwhsfqCvLoPFgckVqfOezReBBCy5htpc7bpANdQyLvqkb/6F5Qf2CP5uxRKcTkhC/YYNykDclzLkLUx1zHtrWLPqNJJxUbhtOT5Mk9O8YxMimDq/bIGNOROjFZEz0yo7Pd1Bl8QiJ1HCFQ5nS8nuCQ/axzKq4BzK3PElS0mDN6CQXwVXQdIl9AuV3/A4+lwi8XpLGiAden8LtOMeGAOgBPWxsHVI0TgQqpimoM/ip9384jW8FljpOz+2i0CoH1glB6eXSsw9YoC+Soqe4L9MLmstKaoPbyJSvR8JjoKcYGY5PZoOZ3FPye2ZKEFVJI3fKhr5fpndk8mdxkxAqOd1vGudejoY+m6aelXr5KNmvz9HgqJxR1A/b5002TPJN+pryQTLLSbkj9KBKdpFjjPcwBK17xhkF0mDmCskl+moOI1yIA21iVk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199018)(316002)(36756003)(921005)(86362001)(38350700002)(38100700002)(1076003)(6506007)(26005)(107886003)(6512007)(83380400001)(186003)(2616005)(8936002)(5660300002)(6486002)(478600001)(7416002)(52116002)(41300700001)(4744005)(66946007)(2906002)(66556008)(8676002)(4326008)(66476007);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yv89NdnJEGQz80CUDNL6sJlMcrOXMyDVM7q+K9YCYddUmo3yTghzHnj5MkxA?=
 =?us-ascii?Q?nY0SWK60PtgzsnQQQI94q+4AH4EYnhL7Cg0Ed817s/6AH2m19TRdh2YyBEdW?=
 =?us-ascii?Q?VoJgHQXMvPQL6wejwlkgN11BTIuPq7e1S7DMjGuWUXUTxZVlWV8VwOgA0lQ/?=
 =?us-ascii?Q?iMWbF2A7fymKvlSUFIJbEPT/GPAkzWAL8D4ji9B9WqXXNdxyrUcW73cUTUfz?=
 =?us-ascii?Q?GUg2BwgHmydurYuMHwdPT57OCwNJj/grfuK58O7zN3Id698/FsmCKcQnZJVv?=
 =?us-ascii?Q?clvkhPKNln017OgN/gd6tfjoHbMDqSm8omWLmOe6/kuXzWvYpySQHYBQFf8p?=
 =?us-ascii?Q?fc+deExZVdnTXEVL8rTHB5TiZQ28MIz5ccejAxwm8fXGEq/VA09tUX5Ntbpd?=
 =?us-ascii?Q?G4+aEPmBopJdFsycyhItLZQZ5REWuyN6Ylf7EkMllqhjqCwzZTMnPlcOFl9k?=
 =?us-ascii?Q?MB0tLukNdHZlsKYvBT9mdmeE0TcF/6MqoYen8SExDcMmmQ0ANO6hJudCtDQ6?=
 =?us-ascii?Q?EHVfi8Jt3CxTyriWAfA13PdSvWPsHNvQ8maKOtlwPVym3G9rnwDaB+k2y4KS?=
 =?us-ascii?Q?wkBKDgty6XBgmjAuOku8J7aUUGAQn1v/pxFifiumrnX9AkZSsyiLj6G6PcPA?=
 =?us-ascii?Q?JlupYlUKN1CwphLbE83dU1lFdP5Bugcqqixjx0yC1a/rO7wHJOg+BN58sYKt?=
 =?us-ascii?Q?ZPiZ5wPRd8FjhjEcqaq5XUBGyCwo6AZHS88TqR+jgt7LULRaJG8ssRRIOv6Q?=
 =?us-ascii?Q?Js4aT++tgpQde6zpnT+FQfUl4EwSDkrS+0l4cB8YjU30mw6B6IWUgcQuKZho?=
 =?us-ascii?Q?d3gpB5J8680mDhPNPWfn6rRNWRWucKC40yvOapjqPZm7Xzy2hUxOcm+hPLvt?=
 =?us-ascii?Q?FlNg6vJK+JoQyshCbvqRfbpCm6NlPPoq6UEHeZKQUg1BDNERCQVILQvgA+OJ?=
 =?us-ascii?Q?ekuTE88TCzOQrFDtiHFB8MgL2AL1Ajib1leGP6QwkVMmugdK00ChzaFyXN76?=
 =?us-ascii?Q?UYioC6akZHv+FeFhgwcUhi0FezEzcx+9qVGq/0wFPrro0gryaR+3OCQ5ulsw?=
 =?us-ascii?Q?UWyxgmOfuK1CH8qGyGIH2RPgcOTWxLf91rbnz4es3n3vOFe55QEeL3gYTM64?=
 =?us-ascii?Q?6o+OhGth6NZhwdEtuxLRiFnanSogrJWatH9Y7dXl1PXwO8Q2BWWjR+Tzjyuw?=
 =?us-ascii?Q?2dJOX/yBQhUj6sZ+iMWJEWzf9u1OefvZarWkhZ7paZzLUDpR+DWZ6XMYDpe5?=
 =?us-ascii?Q?qmPV9i4Qv1SL9jE1EaidjdiktRETQg586sQn9595SVgKNRVmrmUIPj2s5R0h?=
 =?us-ascii?Q?W6hbQGfr42azSW1st0wK6QqYFiDWi7IxqlKVbL5BBLXGVN6E4lheg3JyQfuZ?=
 =?us-ascii?Q?/B3kw0KuGIKVN3P2+GKaesnJCMEQWlphW2btB3H7M7DmTIgDY8dNhPZo9rz4?=
 =?us-ascii?Q?ti8kPMo5Vt1cHxgj9L8Xa00ebNIdnyIeEl2goN1eE9bpf/pa3ueQE9GIJ0o5?=
 =?us-ascii?Q?kWF7QRjcU41d6Wb52Ye6KoltoWs5YDHOHu+2D2w+fCnQ/vSLLwMCVCToZceA?=
 =?us-ascii?Q?dEL89bzT6XhutE4O4KImJZULq/y9MxnxOIalVVpk?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 043794d5-fc6b-4b0d-6678-08db20b21307
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 15:22:20.0920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sthvx/GZxh7zB21B6xH2rrvnX4bQ2COITDPfDBEiKOHe2U5sxTv4WudiIMztiuh8W/BSZFLKqj3eikuhQTlw8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4073
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH v3 5/6] ocfs2: convert to use i_blockmask()
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Use i_blockmask() to simplify code. BTW convert ocfs2_is_io_unaligned
to return bool type.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v3:
-none
 fs/ocfs2/file.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
index efb09de4343d..baefab3b12c9 100644
--- a/fs/ocfs2/file.c
+++ b/fs/ocfs2/file.c
@@ -2159,14 +2159,14 @@ int ocfs2_check_range_for_refcount(struct inode *in=
ode, loff_t pos,
 =09return ret;
 }
=20
-static int ocfs2_is_io_unaligned(struct inode *inode, size_t count, loff_t=
 pos)
+static bool ocfs2_is_io_unaligned(struct inode *inode, size_t count, loff_=
t pos)
 {
-=09int blockmask =3D inode->i_sb->s_blocksize - 1;
+=09int blockmask =3D i_blockmask(inode);
 =09loff_t final_size =3D pos + count;
=20
 =09if ((pos & blockmask) || (final_size & blockmask))
-=09=09return 1;
-=09return 0;
+=09=09return true;
+=09return false;
 }
=20
 static int ocfs2_inode_lock_for_extent_tree(struct inode *inode,
--=20
2.25.1

