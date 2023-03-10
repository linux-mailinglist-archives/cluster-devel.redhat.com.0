Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D316B3641
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Mar 2023 06:49:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678427398;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Mqe/nY7bU4oLdLOUQaimT/ZHTUm/pbHcvV64wpFGdFM=;
	b=GL4j26JcfN6xsDL5ECrVghuPRdK7z7NON91YTZ6NKvf21B6r/cUJ6cRJca0SnoO9x9YB94
	gTRFZDb8RtRiDK/s2yJ262F6j6nQN7GCBiC/KNfz/wxlrhkGJtfsKSrQUld9G79tqHme73
	0rmy6gAFflmO1FMvHWg7zdTXObdL8uA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576--Mha3TLLOsK6_4kNPskPqw-1; Fri, 10 Mar 2023 00:49:53 -0500
X-MC-Unique: -Mha3TLLOsK6_4kNPskPqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1381811E6E;
	Fri, 10 Mar 2023 05:49:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E4DA2112132D;
	Fri, 10 Mar 2023 05:49:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C67641946A49;
	Fri, 10 Mar 2023 05:49:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A2C401946597 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 10 Mar 2023 05:49:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 78E2D14171B6; Fri, 10 Mar 2023 05:49:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 700B514171C5
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 05:49:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44159380406B
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 05:49:51 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2104.outbound.protection.outlook.com [40.107.117.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-fB1wN-nHPGKMmhZGVl8pIQ-3; Fri, 10 Mar 2023 00:49:47 -0500
X-MC-Unique: fB1wN-nHPGKMmhZGVl8pIQ-3
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB6023.apcprd06.prod.outlook.com (2603:1096:400:341::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Fri, 10 Mar
 2023 05:49:17 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 05:49:17 +0000
From: Yangtao Li <frank.li@vivo.com>
To: xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 rpeterso@redhat.com, agruenba@redhat.com, mark@fasheh.com,
 jlbec@evilplan.org, joseph.qi@linux.alibaba.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org
Date: Fri, 10 Mar 2023 13:48:28 +0800
Message-ID: <20230310054829.4241-4-frank.li@vivo.com>
In-Reply-To: <20230310054829.4241-1-frank.li@vivo.com>
References: <20230310054829.4241-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: 711f6969-e97f-406d-ad7b-08db212b2fa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: xqbFJAQdmbHdWPhF3vfFZyWdBFBAKXTfjT6gH4vIZr6t5PQH0TpVRMOSbJcEbHGABSmslD5ZBlO2LAhbBLVhuCAoW6fLBWNpL6oaaPd3bN4bbS8RsEsKyMgfIv3M9ZcNKQsOSEfUoLNoumwXpjatuT8Lrs50Sv0fEEkV1yQdMKTWiHc/bLTlmIbPMxVKa59ujtN85GutND5MWCQEOT4SsFvvFfei2eKkY6nwpwMMIx1LtlXRAu1yDLGcqouDO6MRZmRtJysVbP1dEzmjUED61nSnbs8bWK0zgMMm8Cmk78T6UMq/G0ckBsZpUVZKwUir2oLRSfDGIF732g8ad0SmocNJ1Tv8MOHuc1zxq2WtN/zv68wLFaf3xQPlR1xw77VU95ds2sYh9aQzqKE9kvo3Kinqg/dohrf/LEOi42ge1NFox/WlqrXA6keAZi/AvrYgOWODFlzwcFMzXr7DWkGiOOojPpY2AdA9qJlYc4mJgSG7W/9H8tlHKzqbLu7hZm7V2hFgzjH6zWIsZXvwN2hlMCkRZ5m05hhg+SRDaVsBXW48NAlveyOWcuk5TB4PebP6Rif22m+G+IuqMGdOVacnCTX+L9nHZQsi8GJU5aUlI6M0s14gPzlcAP5Ul97L5s8K8jGZYFbjU6HnWy3V5N19Tb7Ey6e2Gfepj7J6IPGP5eDXUg9BUB1Lrd0mkPExX5yP4uvmDTV7XgQZBynR/CZ3qWT/Qs52LxxW5moWuuuJFJ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(39850400004)(136003)(396003)(366004)(451199018)(52116002)(6486002)(1076003)(26005)(6506007)(6666004)(6512007)(107886003)(186003)(41300700001)(66946007)(66476007)(66556008)(4326008)(8676002)(7416002)(8936002)(5660300002)(86362001)(2906002)(36756003)(316002)(478600001)(921005)(83380400001)(38100700002)(38350700002)(2616005);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dmrTeRSbA5k/Xj/W5NeL1fjGQXm8oyg0+YcTsyotISkdrDHOAB0w0Gf8TQtn?=
 =?us-ascii?Q?+lMy1upUl/8depZTc8mrABlrtVIRUxez9JJvGZIWu0GQF+k7VYkJ4xlWURce?=
 =?us-ascii?Q?eOCJovN2Cs6ybWwp+WrpiwbQS+U+01Xyc7XMAdNq2zhNEzmRJHQ63AKV+X+c?=
 =?us-ascii?Q?H2mE+IjRnEOEVe82AoGls5H3jmU25/5e/IH7AL94rOhHv7fITGYE00UKT4Gd?=
 =?us-ascii?Q?7RKE0TYEwG4eQVNMANQFlIWgft8zLrzvOhCs8Xm7fCZftYWlPp5rdjZ7eRNx?=
 =?us-ascii?Q?yOEFwGQotteNGWKfOOiahf9lRZA/T5bX5H7cpCOeGRicTpGuUqGoE/jcv9A/?=
 =?us-ascii?Q?7vIQ6qMy7W9k3XH8WRw3Xi+XXmOUEJh+vr1/d9sjOyy8mc9nKs9AcXFypv8x?=
 =?us-ascii?Q?PDuTPHPK2RqZeqG7D83254IUNVZIfufoFDX63pQXGAj1vNo2g0P4HbMXQzEr?=
 =?us-ascii?Q?MfKDXFaIxUsl0htGHDhns1j4WWw37dCfLbP8kgdPaDTKnNnk36lSdutX1FZy?=
 =?us-ascii?Q?ec60TZgw/GDxXVlLg5pm5GNbWwq82YLy428S/RzX0AlpelWWpUnrKROg90s3?=
 =?us-ascii?Q?fLR1ACXl64SWyeq0BWmgu3eZzifwaY4r8rwcdCEgw5fg8pTxw0vMrNNAZn5Q?=
 =?us-ascii?Q?eD0r66rK784Djne3tyeZ45IwhWPsnXnpB8a/pBje7Yd7xq84t6mDfy8Bfeu1?=
 =?us-ascii?Q?4FY4OyB4MvSMW26wttS5EEdS10i4zPcv4Vl3wJ1x0v4mRpdObvaoWRtCGD/E?=
 =?us-ascii?Q?L+m0vOZFtBHS3AQTE8CwNy9bxSvBTgO26hs0a+otIR577lxMl4IfGW8K79FC?=
 =?us-ascii?Q?67UliUF/nKi20mvR6RVXbfSYz5Ctd36h12hUidyH/Lvlx/vyoNymKvs+Hypm?=
 =?us-ascii?Q?PPQN5g3qnPHc/uDBWg69XcXfWBULY7YVXVulRddT1Lwm+SxL2VHKpFea7/YG?=
 =?us-ascii?Q?3wcgb1aw+JfuiW0o8Qv1+J45JF0sJxc++X0x28VBgu0PiN5/C4oKP/CUgzKU?=
 =?us-ascii?Q?TEZVF7i6/6IoAxpMpnoCIOxMYUrbwtf2bmtMe462YFe2HC/4x1xvMbSx2ka4?=
 =?us-ascii?Q?xPeVFpbxV8wGJIYX65A2VVPVtATxnAacHPpsU93FvzS91qx/3axkecvmSLZi?=
 =?us-ascii?Q?Y4xFbNFDcy1u5Ww2jeWnIUH21CG8m7FN8sb4MgX7y/wMpQjfkmcgtvQPxpZ7?=
 =?us-ascii?Q?9bufpzPMR0ib/1k2ec7vxXAzr8C3siPtRrUFwIu+UN+de9xAwnPIMTAHrxwK?=
 =?us-ascii?Q?Sw3Xknnyr2v8SSZKUz/5hRGN3xuFkjXm1uAn+qxoOQ4LBoz2a6KjUIoXjEBT?=
 =?us-ascii?Q?vlQhQuhhn8f3/V7GoP4XNz3YWZHc2dsSVoc6SF+vVoODEZFpCFtQWwkR3yW4?=
 =?us-ascii?Q?VWPN2DXkcTXZv2tuxdPbXlpbRmAlmUjf9eAnGNlTNmcFBtKvYyduMFMwMjkH?=
 =?us-ascii?Q?TMcAfbY54mngO0kecn3Gr7HaJhM6AJ25T/zg6hmYz48MMyIKe/meEfm313Wu?=
 =?us-ascii?Q?7pG33krISktsQ4QLN3379CbeJb+NLzyiHrdjgWTwGZ3eNaRThDPdmcne1rQI?=
 =?us-ascii?Q?PxKz2AOkdbmIMUdv8FnXPziIIdAMyr8/oS1+YwOh?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 711f6969-e97f-406d-ad7b-08db212b2fa8
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 05:49:17.1994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2MhJP/TVakp22HmT7xiQqB8u3NGWSEmzp61q3tg3wd+upwIzOd45eoqYpNGisZd1RLmmBp1M6djG3cH5tmUCyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6023
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH v4 4/5] ocfs2: convert to use i_blockmask()
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
to return bool type and the fact that the value will be the same
(i.e. that ->i_blkbits is never changed by ocfs2).

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/ocfs2/file.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
index efb09de4343d..7fd06a4d27d4 100644
--- a/fs/ocfs2/file.c
+++ b/fs/ocfs2/file.c
@@ -2159,14 +2159,9 @@ int ocfs2_check_range_for_refcount(struct inode *ino=
de, loff_t pos,
 =09return ret;
 }
=20
-static int ocfs2_is_io_unaligned(struct inode *inode, size_t count, loff_t=
 pos)
+static bool ocfs2_is_io_unaligned(struct inode *inode, size_t count, loff_=
t pos)
 {
-=09int blockmask =3D inode->i_sb->s_blocksize - 1;
-=09loff_t final_size =3D pos + count;
-
-=09if ((pos & blockmask) || (final_size & blockmask))
-=09=09return 1;
-=09return 0;
+=09return ((pos | count) & i_blockmask(inode)) !=3D 0;
 }
=20
 static int ocfs2_inode_lock_for_extent_tree(struct inode *inode,
--=20
2.25.1

