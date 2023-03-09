Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D84386B2462
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Mar 2023 13:41:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678365713;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CBZ4BH3LoRraua4oWyfEo0g0LW22/3ezJnbgNV7NgBw=;
	b=FoCQwWd5VG+dsbclpO7PaQFxQo7ancHQltds1XFvjmjbJDW0bA8qPzQxV+GaptL43eQzZf
	BwiPE9kzQH1apZ2dfk94p+9vk67wpe+nJTmKOUoDLFKAnu+ziseepj0VuG+Q02vq1tjqDy
	3HybHPVZUBRr57xqGavLbZnbLftE5EI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-JJ76JyGTNXiZGPQ4bFUKRA-1; Thu, 09 Mar 2023 07:41:47 -0500
X-MC-Unique: JJ76JyGTNXiZGPQ4bFUKRA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88ECF858F09;
	Thu,  9 Mar 2023 12:41:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C3DA492C3E;
	Thu,  9 Mar 2023 12:41:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5BC9519465B5;
	Thu,  9 Mar 2023 12:41:46 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 48E251946597 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  9 Mar 2023 12:41:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EB7342026D76; Thu,  9 Mar 2023 12:41:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B20A22026D68
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 12:41:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 965B51C06ED2
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 12:41:44 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2121.outbound.protection.outlook.com [40.107.215.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-OZB6ryi8O5eks3eAgwzV_w-2; Thu, 09 Mar 2023 07:41:40 -0500
X-MC-Unique: OZB6ryi8O5eks3eAgwzV_w-2
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR06MB6259.apcprd06.prod.outlook.com (2603:1096:820:d9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 9 Mar
 2023 12:41:37 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 12:41:37 +0000
From: Yangtao Li <frank.li@vivo.com>
To: xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 rpeterso@redhat.com, agruenba@redhat.com, mark@fasheh.com,
 jlbec@evilplan.org, joseph.qi@linux.alibaba.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org
Date: Thu,  9 Mar 2023 20:40:34 +0800
Message-ID: <20230309124035.15820-4-frank.li@vivo.com>
In-Reply-To: <20230309124035.15820-1-frank.li@vivo.com>
References: <20230309124035.15820-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::14) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR06MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: f57bed93-7152-467c-dc4b-08db209b9fbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: E28tnN0AujbpmRZCk6r838sx8XzdR4QOnZsbXrmykSp75UD0A/y6Xm5/d1Ij6fV5gqqK1fM5Ekm8uo4q9tyermXalqW8exywaZz9u84vs7iCAzxGkSyj9PtnlY2cUDRFyFf0hIUI72uhsAM4dZU0+svfl0xLcAyEkWF8WRH7n8igQD6+1HQELI7qKJSK6YnXKhLvlMEofu8hvRAQ4hy04oKbyrz/13Vymu57P9Ug7wZCdkaBWJTgAIZ8HNtDWFyFEDQiAtTJH2icaH57ug9SjLUALU0QoHPT835TGfBqFLVTZGynRgLgA69eSIwby3BRHljMFP4Mbq8GDQ0Ofa40kx88YKyDRS9ZUeiPwCrLkqia07KxJvBBGcmJ/xpZj7kbBaDoOv4FCJ+N+GyG0VUp1Y1AHT7NgWzwAP95LfiV/ye9dZwA/tdM1UDPmm3BiXR073VQpy1vQcn3us6VcFIZm5r1SiK461i1Aj3lShlFlcg1UqxSC2NPd23+FhS8g1R6k5KMyt2v7Cr0voq2BMgFjZBhr+fI0WbotS1JzEmM6urQMgV25THqSRF5u+XkSKvzW7Rsv9WPTFqmBpBeBcAwM1IKmUaz07UWa9ODGif03lnzt1Fw9P8yNM3q5UEKAo401R1egvamSqc3mdR/OpbuhZaCkTsJwcAmEhG2/an81pmQ0VfvGBudEB1htMym3VEJr/3vlvsE4eeAWGD4C3cntAXt96KoIZucnq7+mXXEa7M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199018)(36756003)(186003)(38350700002)(38100700002)(86362001)(1076003)(6512007)(6506007)(26005)(83380400001)(6666004)(921005)(2616005)(316002)(5660300002)(52116002)(7416002)(478600001)(6486002)(107886003)(4326008)(41300700001)(2906002)(8936002)(66946007)(4744005)(66556008)(8676002)(66476007);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZgLxxfX4t1McWSOmo8olL9zhL7a+yo63tKZgLEGPM+bFjj1dBBDPgqMRTNYr?=
 =?us-ascii?Q?BdNh+bcEBs60dG1kBA1T8LqDM2DBpmriz8QVdQ8I5YRldTo/o0LA4YmRFQIE?=
 =?us-ascii?Q?wCXmlTxZ9T1VixePb+TUTweGwczPXYu6Nclr35lrviR4qPBrR5+9jqNCK3i4?=
 =?us-ascii?Q?dJ65DOgTl5UpWXZnOKz2IAUOFJ+zFjsIujWf0QJkwI6PrC6AlYUbwISfAwHC?=
 =?us-ascii?Q?qv1Kug2wkxDx+gQbGlmTaNXf13ctN1hy9cVeWJCmfibRdWOXtd7hlqmRvxqb?=
 =?us-ascii?Q?GCf8Rg1aOtowXDdD6hXEyBd4UtAF4EnC5Wc5uBeJkUckL7B4wmqlrdxpTtHu?=
 =?us-ascii?Q?wXhbnLUXEF+VZ0wxfL34qbS1hglNwPC3BCoUfCV8lS3hTMQV2keqty2HWZF6?=
 =?us-ascii?Q?uKKTJ4lqYMfWycqedrniZA8JcqMAWz0WTOl6/SAPlpk+zUqVfSjyCf2MSax2?=
 =?us-ascii?Q?GRHX+GHdeh+FShO6d/BOdSyp/+IRpMACzUHjwaof9itmgu+f2mSOWkRqmocJ?=
 =?us-ascii?Q?tjxDGwZCmJIa9aqU+Z6lKd2xF91EMuSorqtUNRedXaF/LK7ALBGPWtAi3BLP?=
 =?us-ascii?Q?h+lkurzDb0WUQDgRqnysv5d/COtRXH05I3mM66bozQLd1mXkXoFYC7U5AIMj?=
 =?us-ascii?Q?exs/wgEBcf6dJI6PZ1WoDqR+0sWa5ywRiqnsW3gpKNARmaRrm4406eKYqBRX?=
 =?us-ascii?Q?S77jqkPxhCbv7hA5j6Pql8fD9kK24AgBpkLqKcaHPK5UxSrXhEg6P5qQLwWv?=
 =?us-ascii?Q?YjgcYGzuAKbTl3BiBVMZQf8zOdMcpaccIlxzTDZoXw9P38m0p9X1Z9oukxmW?=
 =?us-ascii?Q?9M2l8RkIJWhi513JMNzHLQJHYNPohSqZ5jRc2xXGKranwyox7Lzuo1yip4NX?=
 =?us-ascii?Q?ZwPVxEQTJMxTDETm3Cbl3jubdEuUPrqUtqayzUrbPf2x9Mjh2elkySCbw1W+?=
 =?us-ascii?Q?6SDF8HHE4DDj5rolI3PVZSZWRidhigHkDXhSfPAaLY6kxnNv4H61bNASph4i?=
 =?us-ascii?Q?DMVn2VzhIkWX5UmYrh2KZ5UdKic1EHB5I4Wpnc24yahLnC9lcwqii790St9v?=
 =?us-ascii?Q?dihSvgB7cq8I3T636aCs4nLu5qveMGVPoiffRqhCeb2slcz9rrxMZCJfmLr8?=
 =?us-ascii?Q?SoFdCPQlH4Gpc7hjQzxqsMtPRpY/unsSgY05CLAaSbwoUql6sY2qi7xerVnz?=
 =?us-ascii?Q?J+CVfv0nLJGPOvNcGLYaDlcK2+rgzc+TAY2Uc0nIiDyTSwVUwRF7DxB4sLmg?=
 =?us-ascii?Q?GDDZuM+U8VZDMhE7+B+0Pz/lKF3vb/10W9h+7lh78fxVUZsKr35Hro9vcoC7?=
 =?us-ascii?Q?oFLLXiuIUKdLS9kPIsgCsQbjGDvksOX439gN7RNXRsoalHG4mo90TeSjY0ip?=
 =?us-ascii?Q?NOslqK3EeE1XK4NeHXtMcBUV+Yn30bgkYAUbmh0BRAyQ5V+Wcu01YEa4e+mz?=
 =?us-ascii?Q?/xC7dvzkBbTYyMGnVzWcYSHuHEsyfTERq8r1jky+K/eokdE3nU9CZvzqa/AK?=
 =?us-ascii?Q?YigYmMsAhbEipJNkqVjr6NCFBV0YIiIey43i4gSFjSAfuv+c+73bFArtWwhQ?=
 =?us-ascii?Q?LIYXU3Gvwf5DzvbRR13H1DRwVgktRb/byIy68c6l?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f57bed93-7152-467c-dc4b-08db209b9fbc
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 12:41:37.6749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +dlKu3pch/ixyeDj8WZgn90xdOKVnn/PxaOGafWNX4R/lfto4+glIrZ4a8O+iuorfDlSeTgLt506p+3lDGMYdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6259
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCH v2 4/5] ext4: convert to use i_blockmask()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Use i_blockmask() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
-convert to i_blockmask()
 fs/ext4/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index d251d705c276..eec36520e5e9 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -2218,7 +2218,7 @@ static int mpage_process_page_bufs(struct mpage_da_da=
ta *mpd,
 {
 =09struct inode *inode =3D mpd->inode;
 =09int err;
-=09ext4_lblk_t blocks =3D (i_size_read(inode) + i_blocksize(inode) - 1)
+=09ext4_lblk_t blocks =3D (i_size_read(inode) + i_blockmask(inode))
 =09=09=09=09=09=09=09>> inode->i_blkbits;
=20
 =09if (ext4_verity_in_progress(inode))
--=20
2.25.1

