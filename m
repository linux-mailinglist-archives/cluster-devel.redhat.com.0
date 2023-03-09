Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C9A6B2464
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Mar 2023 13:42:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678365720;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ex17/gZXoctCzYe19gNS06gxN3bf/Qb+Jww0J40YoSE=;
	b=SmxbvWQue+dp5q1IM/049erL0+wj7kR9goOfNFe8TIKEF6xx+6rsZkYiqw+hFQF6otbBUv
	m8YuctzEhqlWjoYqThApnFZi6eXD1aPIjmUheroe+7kXm+ICWGOBFt2+vxAUfdNXrVPkqT
	k4H/66ham4uK9+a7zH4GD9PtZB2fC+k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-IeqSa2gLOsW87WuR_Ul6hQ-1; Thu, 09 Mar 2023 07:41:58 -0500
X-MC-Unique: IeqSa2gLOsW87WuR_Ul6hQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32A8A85D073;
	Thu,  9 Mar 2023 12:41:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 248A3140EBF4;
	Thu,  9 Mar 2023 12:41:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 08E9819465B5;
	Thu,  9 Mar 2023 12:41:57 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A2E0B1946597 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  9 Mar 2023 12:41:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4CC26440E0; Thu,  9 Mar 2023 12:41:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43139440DE
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 12:41:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2290E857F46
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 12:41:56 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2124.outbound.protection.outlook.com [40.107.215.124]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-GYbkyX5fNWydK9Ml_Kh2dA-1; Thu, 09 Mar 2023 07:41:51 -0500
X-MC-Unique: GYbkyX5fNWydK9Ml_Kh2dA-1
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR06MB6259.apcprd06.prod.outlook.com (2603:1096:820:d9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 9 Mar
 2023 12:41:45 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 12:41:45 +0000
From: Yangtao Li <frank.li@vivo.com>
To: xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 rpeterso@redhat.com, agruenba@redhat.com, mark@fasheh.com,
 jlbec@evilplan.org, joseph.qi@linux.alibaba.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org
Date: Thu,  9 Mar 2023 20:40:35 +0800
Message-ID: <20230309124035.15820-5-frank.li@vivo.com>
In-Reply-To: <20230309124035.15820-1-frank.li@vivo.com>
References: <20230309124035.15820-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::14) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR06MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bdc6c20-59a4-497f-eb99-08db209ba468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: /9VgcMIo2XZSLx9n+63QodaSkZMcfSnK1zAiby6GGlf5cz9awbp+rj8OcpKLKq+bM3lYB48C2b4K/HSi1v1/VmZetp2vDydqNEZjtcq3L138BczYXPandBWcDb6aM3YtrV+atL9US08QWvFmCLaV+Q9YO4oKVMgcvP1WTmNuAec2//G3fYl8daQ9QFzEd2EgkvkjMGRaDQ+1MDbutBeR03AgjAhwgDiU7fduiaCo5KA0u/jysw5cQ2WX4WvyK1U8FpcjDngkKj/0p9rkT5ob1n4uNoKMfUkYKiwaqwK7ikWKsMcz3l1/kRRRsXnIJoN6JVsRad5mh1SI7phpkXLkDU5YzYvirboie1nqBFe33udS73tPPSoatipJNOuCadDmmefqfCPVDi0xr4Jliice6j+Vu5wq682msJFawltFzoWpOGMruYN4Yb5ibzNh5hom1hhZlenSArcVQVgD48wzELO7TE0JRC7b4J4+GgTsxxCx3Ont+Aau82GUbHUvoeu8AjW557OGM+jNUDwVvWn6T78I+7dbR555BlnAAR6QI9VEaDRnwsRsSfhi4eCCrmevcBb0/MPLz2CFCZF8Wtku87H9S7GfIaMRbFjWjARblMPsndqCaGOo7TL2HN5rCmJrcSE6jBqUw5lF82b/OiXr+BSwZ+jRSTizmO5VK8s7GPAOJDAUkdade2GA0arR2TD6IKGj1nd8TBsC7LL18c+CWzAibiHi6prbyzMPneeF0KM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199018)(36756003)(186003)(38350700002)(38100700002)(86362001)(1076003)(6512007)(6506007)(26005)(83380400001)(6666004)(921005)(2616005)(316002)(5660300002)(52116002)(7416002)(478600001)(6486002)(107886003)(4326008)(41300700001)(2906002)(8936002)(66946007)(4744005)(66556008)(8676002)(66476007);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1J/QAn3VEwBO+3y1Jyd7huHzVmxpdJVLFGT0EC3kXaMX9gclQxiqvd3E9gV5?=
 =?us-ascii?Q?dPGM2hNGBRHR5fcviZ/u6awpK71ddv86TjKp5ApHjP/Q8UYZaUcGm3XVcKX5?=
 =?us-ascii?Q?a4UR8QWaMXikNymgUm4hZ3ajnookOA+ZcemVbAF3aZJqamwNhj9QaF7m61sS?=
 =?us-ascii?Q?ZZHOqCmSJddYuasY3hC5st1t4mzmD34bUwtLR8rq8i27kkVqrLWTuR/Ty2rE?=
 =?us-ascii?Q?NsiYryjCxVwLZMZSKAu6CUgIurdG2uVejI7PvcDAPPVDKDBg8ZoGDyWcI4y+?=
 =?us-ascii?Q?3Jh96ROgxLMrcFxuvQqlizB4WolEeSa5YCYyrJesSMBHz68pQfDbhXvu+t1T?=
 =?us-ascii?Q?EAKkzKPNxahctrsfrm2MkwapXXJzW/KuRf92/SkP2sltepl+mdacjdD4s6Ou?=
 =?us-ascii?Q?KNhei5ADvq+a5+k28TcEplp8fX60rmkTinLf28ryYETuB5v6bLNsL4VVo+eg?=
 =?us-ascii?Q?roGlVt1KkYN/1pZqML8AS7+yLtVurHOnt6HCD3TtLLO1nKpTI+CKRrkZj4kV?=
 =?us-ascii?Q?CJl6jDFrnbbGWxbJciFDZyyJJqKonOiBrjsWszEXJUtlSg7lqm1FaMifv+Zq?=
 =?us-ascii?Q?B868t1y0+TdFUxepHf19/3OcPyneP3G28dZvwVO/sydeR4MjQQGpcJsKZAfY?=
 =?us-ascii?Q?juwDNOIqHzN/Q87zgqaaElaZE4PVHf1FVngo9jhIZJtOOaJAi1pU38f6Ur7K?=
 =?us-ascii?Q?cQHM5D6jQxn+PKpuYNXoPK23jHzwkIvooLMukwOZtgp9xyJ/BEwZPJyk6xaV?=
 =?us-ascii?Q?PyJKLD/Z0hWf+BD4TUZxqspf704kYP1VL7bowWZtyT6dhnOrZX4s7Wd2dzGP?=
 =?us-ascii?Q?W9S16gTVuXryCcs1tWbRXtxaeTZJlfFNJskJZVwKVglz0XwubuJF5jghf+sZ?=
 =?us-ascii?Q?DzMd+XpZZ1N7LofcY9PO2yaQVJjPe9HTA189o/P/+nMjAoQYmFF7RXTr6tXj?=
 =?us-ascii?Q?Ufmcv6OCNix6R9oA8uuxX7NloIyA9KZ/x5XFGZ9OQWe0q7IenXvNvMu2Uh54?=
 =?us-ascii?Q?I6y2598dqTjp6oY2So5X16ETT7BPn4dEt/375hlmGdlrAcSubOIAEL+U0G3K?=
 =?us-ascii?Q?q6IUd3OVB5UFYudx5jI9rdGQuSmMRFIgrOsMG4CKibMOsPqM+Vuxtik3SfeI?=
 =?us-ascii?Q?fUoJZIom9+KL+qbV8VsI5rGwhv5M/G1zagM1l4378RvqHNOvjH3BRi5As5rH?=
 =?us-ascii?Q?b9yejqc9+PCK3CPIPpHDqAm3LkPKqF7DRjR1M6MiLzlI/CiMhYcocylW5BPS?=
 =?us-ascii?Q?4C/47wt7RO+4pl4p+FUL/3hgrhiKeJO5rwOcMLIw32YU4fArEw6VlWzemN/v?=
 =?us-ascii?Q?IB8UR7b1bxNL6huaL74HhKxPWhPIR/n2VM556DF4MEA8ayd7CKBv2zXg0UAJ?=
 =?us-ascii?Q?Z1mE5QN2W8Red4zUmy5hkopf81jtKMV3PCZAdx5QHsq60q/hW6ZsiQfblIop?=
 =?us-ascii?Q?kyjbBHli6MXNGd0ON5ydfTnFmb7CNAPdvrOpnuY7QzEGo6NbDRDbWId7Ie3s?=
 =?us-ascii?Q?pladYM6IJpn12JWQX+fFPfcXqXiIot3qKDzlBYNaXbe5+Eq/Mwk5mM5blgn6?=
 =?us-ascii?Q?0y0srKHwWGYPWphx3nd4mx+Z53HmFlNHYXKRl7H9?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bdc6c20-59a4-497f-eb99-08db209ba468
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 12:41:45.5447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 069NZGzxhTPlg+X44XPS7qEWqIOlrvYZxF66H4bSU/VtWXymK9WtKd/hbTJLhLBwfdmQYZEIXtmcU5ae+DyFDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6259
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v2 5/5] ocfs2: convert to use i_blockmask()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Use i_blockmask() to simplify code. BTW convert ocfs2_is_io_unaligned
to return bool type.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
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

