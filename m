Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1371A6B2095
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Mar 2023 10:49:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678355345;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iFjSaUaMoVwQ4q8rzmeEVQANsypn+HsKb6a9C53J2Jk=;
	b=fwPLld3USWcCVRzUPMgtd5ebNas09uUkfgtrhX9QJ9vrkXn47TSBQBe3E90Xt7JzEBd+eU
	ErCFSIPcll2vyab1ijOUDSoDl04PBvXWpmKdnv7UbpBIhe9WNneNgpInX3x71zUCgu4fKU
	Jl9GzvqCRXvSJmvYhQQeoWLLGFobawM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-KR6BRmr8PJmd_eRO9UK3jA-1; Thu, 09 Mar 2023 04:49:02 -0500
X-MC-Unique: KR6BRmr8PJmd_eRO9UK3jA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7ECA3C0F234;
	Thu,  9 Mar 2023 09:49:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 77F731121314;
	Thu,  9 Mar 2023 09:48:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CAD071946A54;
	Thu,  9 Mar 2023 09:48:58 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 810F919465B5 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  9 Mar 2023 09:43:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 743C3112132D; Thu,  9 Mar 2023 09:43:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C63C1121314
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 09:43:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D6823810B1F
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 09:43:43 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2099.outbound.protection.outlook.com [40.107.117.99]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-tEP4QeoGN3iGZB20FEmUiQ-2; Thu, 09 Mar 2023 04:43:41 -0500
X-MC-Unique: tEP4QeoGN3iGZB20FEmUiQ-2
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by SI2PR06MB5412.apcprd06.prod.outlook.com (2603:1096:4:1ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 9 Mar
 2023 09:43:34 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190%2]) with mapi id 15.20.6156.028; Thu, 9 Mar 2023
 09:43:34 +0000
From: Yangtao Li <frank.li@vivo.com>
To: xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 rpeterso@redhat.com, agruenba@redhat.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org
Date: Thu,  9 Mar 2023 17:43:15 +0800
Message-ID: <20230309094317.69773-2-frank.li@vivo.com>
In-Reply-To: <20230309094317.69773-1-frank.li@vivo.com>
References: <20230309094317.69773-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2P153CA0035.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::22)
 To TYZPR06MB5275.apcprd06.prod.outlook.com
 (2603:1096:400:1f5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|SI2PR06MB5412:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c373218-d5a8-4d07-1956-08db2082bfe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: 16pRo38/+tVOacbF9caxW9PZ1Aw17Ijt/trfca9jzTAsn9vS7f8lgqVIh0pya1rV+B/24JHxmuu2Lj1tbWgW0yxtPEstwUu0zrfudpJapOwhFaUrNCy9eNqxlygyK1sFh8LcyKuS/5MHKqdHsaaAk2e8smjmJVtknNkWWxYspvCmC0Nv60FoLSf0HAMmC4xWeayoCip2QDEPiMvvPUMVh+WbaVMzTnlgwa+w5mvjCMFrgxcanoa+zE/Lyp+UT+xR+4aGsx+8o7W2/qppScZkU+MzA3sybJGD0iHEWEQIrhHIEq1q6Ty/Tl3aRL+qqNbmF8J0/WmT9fbP8iPxLIqskTKlHiIqq/iYnzOdJA1EizyQf+H6lYmyK7puix4k/TXBSObOoy10PVrTMRlt2i64r5WCxNYV7Gk666MNgd5CkZwwIJ0QPUX+r/NlaSkSNE0So7COtbdLi13+CLXNeImalhaFyeFWxfQG9QuLc+AxwKWJ1Ey7PWin8V9Y3WjvDL2eyPMMFPNwUPO2Geu4nROqUw0vRgT79OKsUle+jj+O1gQtjre0esiJF8PetCB+Hk8yYPzUYo9ZSwRjMH5Wb7zYIOVgAcrU73M9l1Tm8YHqprsyWH9GwHj5meVU7YZE1TWO9BN8urCGaWcPm8jeMJ01PUqkIrUbWzy8ISYwhLgnd5UmLnurpQYUKBb9pEKy/fjELaMyP231YmXeqWO3iO5zH9Dg/6cl+E1VexLs2LtCFSY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB5275.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199018)(107886003)(6666004)(83380400001)(36756003)(478600001)(921005)(38350700002)(316002)(38100700002)(6486002)(2616005)(6512007)(52116002)(6506007)(186003)(26005)(1076003)(5660300002)(4744005)(7416002)(66476007)(66556008)(2906002)(8936002)(41300700001)(8676002)(4326008)(86362001)(66946007);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E4OaB+8+rZATElPiI8iRz2tPxJC46eXgVcrwdYk39vUghhE2ixVIzANvfIMk?=
 =?us-ascii?Q?DVcJhHZ2dpib+KOA9LQffMvEonK/Y5b3NYHKlDjAuwyoq/BrrSpFPaSRJDQ/?=
 =?us-ascii?Q?yV9B4/BGl0p8msunkhJSIxCago0Lwcz7gY/yj04JwBbjggYIRPDt/ZuaD9aO?=
 =?us-ascii?Q?/gp/+oaQ0yyxeXYtVy44LwHEV+Bnk3u6F5vqXngH/gqbxKZb1wIkzWa6TCBM?=
 =?us-ascii?Q?T3TMAiw/yg+o59WTui4Le/rPCMwpbfhYRIYk5CzETmhcT9HdPSqmG/vT2JA0?=
 =?us-ascii?Q?InWkURk0+F7/ge/nh6qXj40fupMbkAgo2vTlyisgJPWih80lxXLcCftEyzfe?=
 =?us-ascii?Q?PwvGAxFBURh7/aORkqh2P9TAUjAB1IVOhfHODY+m2V47sowPocekQbbpiTLF?=
 =?us-ascii?Q?pdI5omg8HNa1ZkNlm1Yv4FfjKZhq1hmLvuiWeyDubmi3XWU2ZRPlqskVDC6I?=
 =?us-ascii?Q?+RPVUfKeq/apKHCYO566MroFfKi4AFL7h2SxjjimDI+ATyGTpZQu3kXAUmh/?=
 =?us-ascii?Q?Gg1QjKFx5C676+Bw2CS6VSprCKUs3bkxYcLSLdTriKTFvtSVXLSOFxhT/d4K?=
 =?us-ascii?Q?2+XSweHKUE8pMvVCfENVVqSHiQxJRDC8TS8zonAR3kb/LmRBvsz/kgk8Awow?=
 =?us-ascii?Q?mNK5O//nYyRQd8FxYPtvVrEwngDdPS07+FQzcxhdFYboP1XSmQHrxOJnP2hY?=
 =?us-ascii?Q?2owjMXgeuub8UcmU6otJZiFx9Nbm3ovhHXiP0j6v+Mra7y80FM7CgeyJ4mvO?=
 =?us-ascii?Q?TJHIOLtile98kGtvzIlh6LWWEVg1mTf++ug5uZPYxVQprFcK996VEHvSjXof?=
 =?us-ascii?Q?497VXKNzi5i+iqixdANUHRLBe/tmuYsg+HNA3YdmUG8QY1hyvI79TgAv9zqT?=
 =?us-ascii?Q?o90xYdBXMQlhP2k2OqYdhjWzif+328sTIIeYT4lwGd2YH7ejyZHy4ZFo2BW5?=
 =?us-ascii?Q?b2XQaMRXUEd22edWYU7bIrNf3fGzCbaGm/xOkmuvBG3fltukIP1khMXWOMEf?=
 =?us-ascii?Q?CmtvQaJAj1MRhlOxNTFvtMSbUa3Vq4EkRL4lghPP0NCDJhmL6rffAbwtwp9b?=
 =?us-ascii?Q?uRCdhFyDWEnxcqZ0OJoOQLrzWMnymdaQhVxb9gDsC9gMBwk4ZIK/FFX01GZU?=
 =?us-ascii?Q?61vrYlolBJklEOhMp+egm0sgWrqOKrbqzfKJhvO+fn/8Rzj6ovv4OHun4ReP?=
 =?us-ascii?Q?fUb+bJXOb10/GvhS30qhUquDEN+Oc27wpBLrXqHQtxiqcqhtBPqFqf5ZrDN9?=
 =?us-ascii?Q?CH88J7d540C551eTvOzYK0P8YDo1V+3QCAyOKgJovZPkyWoxkX3GX0N4sjeD?=
 =?us-ascii?Q?1KD4fze5PBCz9NQ10QX1Ip1AfRUL7BZrtvoUSqMdoJG6lPRGR5NWXedEepgV?=
 =?us-ascii?Q?cB0qrTY1FzXqp1vkLIYux891xVco2CJJvHvOsHDFVytwqQm8otApHfrmRXp/?=
 =?us-ascii?Q?7KnsGFHa8QIdeFF6bVDjce6bCqy570iCu3Sm9do8C8sGqqBXvEf3eVMvs0nJ?=
 =?us-ascii?Q?Z1j2JW4SFiguC60d4Maq2YgxD9nuH34sSBpRU8YXIzrlApGEumLFIDjOoMAz?=
 =?us-ascii?Q?qJpOQcuVve1pmw2Cr1Rw+TbzO95gEPo2bqYQGEqS?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c373218-d5a8-4d07-1956-08db2082bfe6
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 09:43:34.2154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: goZPO6iBPFWvLNTRXm1fIYJDPeusaXWOMYytJH9OJImHzVn+GB6MHvTpkBBpG2YXjbsbouhZG7AJZG/CS90N9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5412
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Thu, 09 Mar 2023 09:48:58 +0000
Subject: [Cluster-devel] [PATCH 2/4] erofs: convert to use i_blocksize_mask()
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
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Use i_blocksize_mask() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/erofs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index 7e8baf56faa5..234ca4dd5053 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -380,7 +380,7 @@ static ssize_t erofs_file_read_iter(struct kiocb *iocb,=
 struct iov_iter *to)
 =09=09if (bdev)
 =09=09=09blksize_mask =3D bdev_logical_block_size(bdev) - 1;
 =09=09else
-=09=09=09blksize_mask =3D i_blocksize(inode) - 1;
+=09=09=09blksize_mask =3D i_blocksize_mask(inode);
=20
 =09=09if ((iocb->ki_pos | iov_iter_count(to) |
 =09=09     iov_iter_alignment(to)) & blksize_mask)
--=20
2.25.1

