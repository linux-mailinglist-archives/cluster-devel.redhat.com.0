Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 933C96B28C1
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Mar 2023 16:23:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678375429;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5dhtR4A5GGTIrMR51g8nDrgiO0qQ2gyq2GnDwSMXz00=;
	b=QkU8zb2RZ4chjVS02Z5Y/pV5pQtLk4u9YM71wbHOeGC+eetUW0n+vIQpxq4uwXtfqdXQMi
	UZL14m92cNmUC3UdgirFafIqFRWIhbJbPA/9N4ozhCZek2jwUX9FCx/1qnvNbVRyHmcjjN
	GxGZjNOX7kqH7HTXgl6bplqDT1Xd+5E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-WX7d5Mj7MUSfyTg3c16YQA-1; Thu, 09 Mar 2023 10:23:47 -0500
X-MC-Unique: WX7d5Mj7MUSfyTg3c16YQA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 583C110580CA;
	Thu,  9 Mar 2023 15:23:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C4E2440DD;
	Thu,  9 Mar 2023 15:23:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1298219465BB;
	Thu,  9 Mar 2023 15:23:26 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D358E1946597 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  9 Mar 2023 15:23:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C185414171B6; Thu,  9 Mar 2023 15:23:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B985C140EBF4
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 15:23:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0CB982DFD3
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 15:22:47 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2124.outbound.protection.outlook.com [40.107.255.124]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-syYZlIqmN8awM1jS0vRqhA-3; Thu, 09 Mar 2023 10:22:39 -0500
X-MC-Unique: syYZlIqmN8awM1jS0vRqhA-3
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4073.apcprd06.prod.outlook.com (2603:1096:4:f5::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19; Thu, 9 Mar 2023 15:22:13 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 15:22:13 +0000
From: Yangtao Li <frank.li@vivo.com>
To: xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 rpeterso@redhat.com, agruenba@redhat.com, mark@fasheh.com,
 jlbec@evilplan.org, joseph.qi@linux.alibaba.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org
Date: Thu,  9 Mar 2023 23:21:24 +0800
Message-ID: <20230309152127.41427-3-frank.li@vivo.com>
In-Reply-To: <20230309152127.41427-1-frank.li@vivo.com>
References: <20230309152127.41427-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4073:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a9c6312-19bb-4ca1-342f-08db20b20ee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: 9zw4iYeFkgTHMTIZeNkJQD6Ts/vtKZyF060qehqrCBZt1Gok3wu/rHoVurBt9d3xFwtq6mygGzq0NZN8BemSVoOgfcujo+OY07p+6TXy0W+DdnrM6Vnym2YcXhYv51U2/9IXugNs/hZCV7piJbF02H6POkCBsVokTW4Js473fKVpNlZH5hhLIDPZ7wAHoNWRGrg95yTu61qbzMlKA6JPXzpOP/zp136bq4M/LpUhMqDMUauavqgS+rmAVxGSUUmr77X3q0JvSOsbUU0Luba74tDMa+O115DjgP2QRXo+2mrQP8Jqq5LDJ6unI/ZIfnOO+QeI2uxIm6uob9icCqtn6A1J1cXsZyzFvHTkowEne1JPTCTUpWx3iJ7duBkS2Tr7bUl0z87E8+khMM7O+vZdVUulh1W2zLoBi7m47ZH4sUBOiVGiR2+2z6AO4afxqhJtbsNht6Td/WtKUjhJZAnP0UAWvzvTxGnXEjZcyVJy4PdW5zPmJzx9Yv3icjm4Rooo9vUVfBceHMR/Y7Gks2NBlsGeNLZhkqJfUIa7e9ihw35/3mtPZgyHideRhddlxEqqG2vhemQFMoDhdJwjvfLAZgun1yFyhoEE8r01CKoFlxoTWkYZEDzm6sfy3ZYXTXaR3TU3sZSYkfmjnnf80QMN4wWTIz37hF9pq/FVjScK6qTOnqGeFH/O3w9EKVIno4hDpIITGKinL/M1G8CGPe4XtuvAF/qmJP6i7WHMCso83BI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199018)(316002)(36756003)(921005)(86362001)(38350700002)(38100700002)(1076003)(6506007)(26005)(107886003)(6512007)(83380400001)(6666004)(186003)(2616005)(8936002)(5660300002)(6486002)(478600001)(7416002)(52116002)(41300700001)(4744005)(66946007)(2906002)(66556008)(8676002)(4326008)(66476007);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FdlOoEXvsQSiXX57b9tinHs6OggfuNN8FYqn7UcnWWb9ANcQEYafcJ6eeYtI?=
 =?us-ascii?Q?uihc0DCNa4zgy+cs6MvaY4UjfNE+gADkXhHYoy7z/QK6WyGwLJqWOE3E0Mlf?=
 =?us-ascii?Q?d/BKNy7+Y5FRanoktcqLoXnvz1o0Lne+bP8q0NIAXv0tV+2faEwW4vLXbw+n?=
 =?us-ascii?Q?cfNFClaDIz3NV/YQpobmnRN6YG7RO9GMhGyfMmgHmdtoXqvHRTr4U3D8CXm/?=
 =?us-ascii?Q?jK2CsZcfuW2iQhYosPjhb/oYCU62l2lcSeprzHFHeoP7IEzto6XoFXNNNQrh?=
 =?us-ascii?Q?zXXLsUTmZZkLEExEgHjHmVU/mLNa6RmUkVLmUUgAuoQEHILaJm0sQHZot6kT?=
 =?us-ascii?Q?FwQDubqJLx8rJNR4xKePsQRMgWsbIOzUrBCPYlVO7ROJBeSfiHiSX/MIfCfx?=
 =?us-ascii?Q?UVCdwhtzIWHPE3rG8cabQUhJ/zK/U9jdUybEtAMpWk3L0hFfxX7V3z5Ip0uy?=
 =?us-ascii?Q?6RBNYZ0+/C9Be2dr4S8OXjxxrq5Xz644wgFGrfOUd0nEaf4NuTCOe8KdIUUO?=
 =?us-ascii?Q?fm+932ZZxT8SFbO0rMYZxKoRtep7vIB7NBLKThzDRIloWb8Ax6FFmceEf8Bt?=
 =?us-ascii?Q?+EMopz+/6gkMCVgQ4OKFqC5OFjba9KMAUY5OgIJuLrRY+BwH7/OPV0QI/k6A?=
 =?us-ascii?Q?M8aN1Zdej5FEoSCuuzo05Tb8J6vUUyBIhvDCLJ0WS/ykZzSblE8rYUdvsBfS?=
 =?us-ascii?Q?Qdm5LXTd9Ce4dP7TRf7W9zNMAQAYc78xwr7a8ITFEZSvHbcua1x2fvXZejUN?=
 =?us-ascii?Q?EVgNYSwfGNMBcJ9MDsJ9SUWKrgJx6lB+Jw6muJMmFWZWksNgd38F4uVWdsZA?=
 =?us-ascii?Q?lOgksyHRiGwNjQy5fwxJpI45oFqpA5wwrNGobYcO6m4Rif6o4n4VwWoXbi93?=
 =?us-ascii?Q?Nd5cO1HOjb4bP318SuM00PVObrK3Gon2nbw5umMy3NSfvtXgVU2SZnuBNebV?=
 =?us-ascii?Q?Zfk4oVJS2cYCVPP8wL/MTlBJROunMtShYqAUpcjam+D3X7gtVJOHI5OpsSma?=
 =?us-ascii?Q?sXt+yGWdkqVCoCE9GvyiUWILJESOCgbrErRvTTn50ri5M9pTawGKJ+QoeyaV?=
 =?us-ascii?Q?dFQ8VGy+H+OJr64A2CuBdG+VmqfsX21XUdXByzSWQRU7HWYUg9T0lOZF8mOh?=
 =?us-ascii?Q?TNM0aZQKS5aMCL3nnVcaocxBRoNTuQglgC/yqp+LDzVQHqWUTr0XysE0AbPc?=
 =?us-ascii?Q?u8z7Ym32Bq4FvMqHgADf4bW/58Vg+51HVd5C/er3wEtzfs/Tui9xghtAT06G?=
 =?us-ascii?Q?mTp7ovMGqOhh53lhm/hq80AxBkcbe4UkovLmsNCi8g9JR29vi9he1cu3Cx42?=
 =?us-ascii?Q?TZBqrnNLBabxl21uxaxhmHiVyiGaAkD8lGwZi5/r5n+4HvtTieX+jQeBHNcy?=
 =?us-ascii?Q?SZuap9NNtG7pqgzGUmXvFSD895rwmJJcGVxVAoyXIKwKWugUUsRQdE4MaZTo?=
 =?us-ascii?Q?fEnPr06YthGoexPatzVeo4o8V5yxPvtjqaF2vHqe4bjbYfzH38nTFjG6mSu5?=
 =?us-ascii?Q?HF5nWEXFVNHt1wzyzufr4cIbQ0HjMgvIv4iPCcL2VJp5IxZJmET3KuHwCwxl?=
 =?us-ascii?Q?oliUT3wMXoaRsj1xo/8j4i/sN/+iJrDzoX011Odm?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9c6312-19bb-4ca1-342f-08db20b20ee5
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 15:22:13.1549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGe9vUdPVyn6A7qlLYid3EacqnHwDSvXb5oWXoeWdaBo/XkJYg4ytVLp5Zq8VCxfh7SMnYzeeqxVDXMo06KMRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4073
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH v3 3/6] gfs2: convert to use i_blockmask()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Use i_blockmask() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v3:
-none
v2:
-convert to i_blockmask()
 fs/gfs2/bmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index eedf6926c652..1c6874b3851a 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -960,7 +960,7 @@ static struct folio *
 gfs2_iomap_get_folio(struct iomap_iter *iter, loff_t pos, unsigned len)
 {
 =09struct inode *inode =3D iter->inode;
-=09unsigned int blockmask =3D i_blocksize(inode) - 1;
+=09unsigned int blockmask =3D i_blockmask(inode);
 =09struct gfs2_sbd *sdp =3D GFS2_SB(inode);
 =09unsigned int blocks;
 =09struct folio *folio;
--=20
2.25.1

