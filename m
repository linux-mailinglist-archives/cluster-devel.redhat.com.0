Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2E76B245B
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Mar 2023 13:41:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678365693;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=B1EsI+DpZDVWTGuYdsfXY/2VG8ejVdVCAU93tGcZA2k=;
	b=UCJ7YyQuNoBeqndGuanM7bwU4bOmzaaWbdyjHfbfNj+XVLa6eOXnaI056+RJwws6T13Iy9
	xR/ZXWYAqdy0K8jgj+PwTlm2lk4AatyESlsPLW9iufKe2AZt+PLKGE+BQN3OnGJj/4Q8XW
	ft0Ajfva09SbEyfKK9KWK6xkoqOXj8o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-eWDK1V1XO22aQzHch_XQzQ-1; Thu, 09 Mar 2023 07:41:26 -0500
X-MC-Unique: eWDK1V1XO22aQzHch_XQzQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91D4185A588;
	Thu,  9 Mar 2023 12:41:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8617A440DD;
	Thu,  9 Mar 2023 12:41:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4AF0819465B5;
	Thu,  9 Mar 2023 12:41:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ECE1B1946597 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  9 Mar 2023 12:41:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D045E2026D68; Thu,  9 Mar 2023 12:41:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6FC72026D4B
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 12:41:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7287800B23
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 12:41:23 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2132.outbound.protection.outlook.com [40.107.117.132]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-4Lyl_nVDNGeuK6ue1RgE2g-1; Thu, 09 Mar 2023 07:41:21 -0500
X-MC-Unique: 4Lyl_nVDNGeuK6ue1RgE2g-1
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PUZPR06MB6054.apcprd06.prod.outlook.com (2603:1096:301:104::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 12:41:18 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 12:41:18 +0000
From: Yangtao Li <frank.li@vivo.com>
To: xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 rpeterso@redhat.com, agruenba@redhat.com, mark@fasheh.com,
 jlbec@evilplan.org, joseph.qi@linux.alibaba.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org
Date: Thu,  9 Mar 2023 20:40:32 +0800
Message-ID: <20230309124035.15820-2-frank.li@vivo.com>
In-Reply-To: <20230309124035.15820-1-frank.li@vivo.com>
References: <20230309124035.15820-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::14) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PUZPR06MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: a09f7129-6fd4-4738-6fa9-08db209b941a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: uOqsWdLTmFre0ldLWcpc4R2o56DkeN59ug2DWaUD/Au9L37DSbR52beOhPm6Nw4Dxb4wPtI/ggiji/8/H+cG4GTWs56N9z3haesOT7gxru3gqn/zFIZ1hSKA9JHgAo2GAtCtBT8pozB6h5kg67BzezK4eobH+BYaIHLzOsFv/10VSLDBH+o3ERIclkfVdjIiO/dOldwPjITSpcKX5JhTjbhp6AX8xiQBelNGrT+IVeWfxNDAxQ/mfdgE1b3mKaltYuUjRlOOpYXgRoYEk1KrzFuUyEDd568XH/zbWMrcsGRF6RQn+k9+31/3ym8IkWZMbOTGlXDQVhHXn5Ac+AfiCAg3p1bduS/KUaUKOCiMihY1f+LhkCmjRVZ4rMIs1uVyx4DLayBg7F7yTiNvzhmBZ3GLwk0ZxFt+y8xd/5QP0T2znm92H6iyU+ZlmX/GM9gLIWxLPo0bd/Y2zNWa69e3nbAtIxVjsRL2hCKi5ZE2CJ7rFzmnZAkERqj/2E9g6MUUTYDDVFqOWwB3IQ2DC6IIogOlJSTudgIJh37SXEBtQcTaELtAEaZ4VuXnGwxfopFo641YrxQQbX0Bk0NUrPpjw4LiYIKf4CPUcFW37ztotNckt4fw05GMPN4tunPr0sBlt+diWbdjWyCi1TMF7WHy1UUYN1TO1d2oMDZiK/YfME/KJoUvb26E7Jicf/Uw107l6NQMP4Tgd1YBTlG3SkMPbqOVkfmBZkXsWJ7YbKRhuDk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199018)(4744005)(36756003)(5660300002)(7416002)(83380400001)(107886003)(6666004)(26005)(1076003)(6486002)(2616005)(52116002)(6506007)(6512007)(186003)(66476007)(478600001)(921005)(4326008)(8676002)(66946007)(66556008)(8936002)(41300700001)(86362001)(316002)(38350700002)(38100700002)(2906002);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oqYbHCV5OUKh62SXwdkXr7Q3HdSwdiShQ7hp7AfNvqdsnmFdAjeCYm5aEzNj?=
 =?us-ascii?Q?maqiD1Ul6sQTc2TDZRVDyElYOsBikoYh0FTsJHIdxr9XmVWgIYcxGS/2Zxfi?=
 =?us-ascii?Q?hQd1waeQtLC0tQ2T0cBnzHEQUBsbF48qmgaNuvjTHqk9Xdu5uSR0ao+nLNRP?=
 =?us-ascii?Q?OKD7ZxLIcBWiGlHG0rzcFqTauhdfddnC5ZWdawjTAvS2sjFapCKvSKbryiPu?=
 =?us-ascii?Q?fss7ZBBv+mulFoYPz61XYQD3xZO5OdD64wRqdMlNhyppQVD0tyA9oNTuIFKP?=
 =?us-ascii?Q?b7FMBQ7QGXJ65QFRw6hr9Ieyf38ir4dWAQAx+iwjihJhhIagNPGBSbk3+Z1c?=
 =?us-ascii?Q?YjJAHNOGHpi9635YsGv9VV3+0BZgM/vIQ0QZzTbw5rlNEGmWh8NEiCi+JDt4?=
 =?us-ascii?Q?PQowsiZYxhi8WvGTpYcyFSLzeMt6Y+sFIN/QJcKZC9xGHyJciCHA2rshNx0D?=
 =?us-ascii?Q?IWuSkBP9tQVPnSqLhwohL2zj81UDqNFC0XD1L4q+8brzJLfJ5XY3oSeJutRT?=
 =?us-ascii?Q?y+y7YRK9Td3SnUTq6PxkjLP1xfGGKbTGT4fgW2RIN53bd8BE/cj1dl0ccIFc?=
 =?us-ascii?Q?hLF6scWMx72lJ5MCCEAkpKkr+mmWjgJtM1tqeSpyjknKvqllmL6KUEm2gADL?=
 =?us-ascii?Q?N4sHXT7s5MclgKNPRrh9DC4prbASuiWQrLrP58FG+qJJfFyRfQCeYzZ0d0+j?=
 =?us-ascii?Q?tqR3feuVR9WSv/0ys1wP6PnoO3M9DpXLCYdpfdkb45WFAvOFJ5JwthjA9a1F?=
 =?us-ascii?Q?Djfa4yCJRu7qYvDCQIt03yaN5OjirdFfSBpZXrIGjClVAT34cjCxCrHIEDsI?=
 =?us-ascii?Q?3FGATfH9DEYoN1lwRG7batwX7GKs75BchSwOPzBu4wv/HKLSh94gVJ39VU4g?=
 =?us-ascii?Q?3A1i5nKGpQa5a2s3AcLeu40G7x/wtJYPdupznRAZMAl9Q5getnHVAcDkzFKa?=
 =?us-ascii?Q?+hg8CC9LjYmPFlTwhZ1nlWFVnrmhTkrKZo2qaumKkDfkDwQ1hSzk2P+BmaQx?=
 =?us-ascii?Q?gxI+Pg0GpRQWjYH5pIf9YRwyyPD8hoXnCfMV1ap8Qto/00k9Tx2I8GYffonB?=
 =?us-ascii?Q?ew4SNbhoQygyrIfibUwm4s4B0iIyGBkKnXJ2rYwO3CiN0P7imUoDK4mWmn3Z?=
 =?us-ascii?Q?rwoNpgl781u1QkiigkPaK4ZqzvmZTl0HINRmgtDslfh8f4vee3mUhZS1NFR2?=
 =?us-ascii?Q?Y1RKp79OMTcWUDqOaIy5IQuEaLP3t7YIB1cGMUgNJ3XwFIk8nEHkT7lHd+L5?=
 =?us-ascii?Q?s0r0C9/cfa2Sz7oHQZfXfwcwjYYktI/haja4lXzkTLHfZAA8Iu6QZ1rlRQeY?=
 =?us-ascii?Q?hyOMTEM7YWgeRS5/3UitNKAFxTIDZVj9x3RIajpBMo81niS7bGivTkL9UAKa?=
 =?us-ascii?Q?OO8qPKqwStVihQNZ0acfo9aTX8kQlCv19PgIaYINZCM+iMMrY00+mywMJeJw?=
 =?us-ascii?Q?c8jW4j9eRPybb6pqvsQNOe4aG13wPAEkbky16unEKqoddxWA3RPdVBVls0M+?=
 =?us-ascii?Q?ilReBBEh3/P4Bw7xWsp9S9TZ2fcJa3RBW4+J6DKSpKNm12QDaF48wSTYJMWf?=
 =?us-ascii?Q?V6yYuoA6FMFuCBaZ7ruynVuGOE8YYgepa+J6RV3h?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a09f7129-6fd4-4738-6fa9-08db209b941a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 12:41:18.1849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BUURUGHeQDg11Thh+MoMMKA1ajppisEJBoN7569mUMWPFKwwQp198r0P000kDVVxGbsiosGku2qqbTBFYN1qbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6054
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCH v2 2/5] erofs: convert to use i_blockmask()
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
v2:
-convert to i_blockmask()
 fs/erofs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index 7e8baf56faa5..e9d1869cd4b3 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -380,7 +380,7 @@ static ssize_t erofs_file_read_iter(struct kiocb *iocb,=
 struct iov_iter *to)
 =09=09if (bdev)
 =09=09=09blksize_mask =3D bdev_logical_block_size(bdev) - 1;
 =09=09else
-=09=09=09blksize_mask =3D i_blocksize(inode) - 1;
+=09=09=09blksize_mask =3D i_blockmask(inode);
=20
 =09=09if ((iocb->ki_pos | iov_iter_count(to) |
 =09=09     iov_iter_alignment(to)) & blksize_mask)
--=20
2.25.1

