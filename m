Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F044F6B3642
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Mar 2023 06:49:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678427399;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ABdlfFKTz8tsHt7W1qoxIUIRTGDXM4d17eYJUf0eVtg=;
	b=Gy7YlXpXm0ksGftNQGCPQ1Gu8bz0ah+vmkDgf3eorNqzjYKihKVDHunFpJ16BZI9vVMCH+
	Rwx37rRVY3/LalfAOQBetOukIcilWq7J/jdyIvb/rY3y0LcOfYKufTLpMan8Cr1lmmEAi3
	Lc1UwIOs6O0XOuSh9TV1vs5zijo0YtA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-ATVQP69LOU6ZbNBbBXU0Vw-1; Fri, 10 Mar 2023 00:49:57 -0500
X-MC-Unique: ATVQP69LOU6ZbNBbBXU0Vw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 145CE85CBE0;
	Fri, 10 Mar 2023 05:49:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 08307C15BA0;
	Fri, 10 Mar 2023 05:49:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D4D551946A49;
	Fri, 10 Mar 2023 05:49:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6AB151946597 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 10 Mar 2023 05:49:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4EF6F2166B2A; Fri, 10 Mar 2023 05:49:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A63B2166B26
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 05:49:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A5433C0E458
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 05:49:55 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2104.outbound.protection.outlook.com [40.107.117.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-isM3ecrlMYKaiuU5iJm2VA-4; Fri, 10 Mar 2023 00:49:49 -0500
X-MC-Unique: isM3ecrlMYKaiuU5iJm2VA-4
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB6023.apcprd06.prod.outlook.com (2603:1096:400:341::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Fri, 10 Mar
 2023 05:49:20 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 05:49:20 +0000
From: Yangtao Li <frank.li@vivo.com>
To: xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 rpeterso@redhat.com, agruenba@redhat.com, mark@fasheh.com,
 jlbec@evilplan.org, joseph.qi@linux.alibaba.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org
Date: Fri, 10 Mar 2023 13:48:29 +0800
Message-ID: <20230310054829.4241-5-frank.li@vivo.com>
In-Reply-To: <20230310054829.4241-1-frank.li@vivo.com>
References: <20230310054829.4241-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: e5ebba1a-19b4-4abb-2515-08db212b31d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: vmRIrTsdgNJOnv5mVw2IF7UBVhRCnXl+hUMJNlrvYSzjQ8VEi+it7z4kFy88i5XoTmTkRzfqiQUCXtTdHcnNN+qJ3JaJr7uL05YgA74UjsWH8BXCPlvfFtIo3o+CwXkdoU0P38ZVlBMOdTfiWNRRbcBSUCztVbfuQXUMmvy53tVzh9LNbkItLyqZwtEAE6RbA6PoBFLneqFw623EOMI4vs4ix75wapMVZLFc4RENEkzfB/0mtD+iR6HxD5Z8b3ttg1YVAjhHscjanrVGOSk61q0yCKGhDIkT6SyWF1pQ0W4zKURwWMF0dUJXhrhZQ1pDJNHFrbHPhsOVZH+ibj1BaU6IhtUp8pNmY5akE3byJJ6gVW29X5o4Mk42ENDBXWJU8p8uU7w25OguRk8J0owdS8JWgx++Lx6sQ9pRi43nIm9PXvIRgDR3cMb/4rK+hCJ4MLYBBf0WhvtTiRT+T+71xIj/KZ3GFME51Pkgg+f0d6B4QkYGXYhogTCyuwVZjbvjOImpfsBove6ppg2CzFcBOpV2wQpIMgcQSk48emJA+3Aw25YNeTIY5Q5YSq8n15xx2ep00q3fmRCPC5ZVZR+fxaoMTLWouzcBcPyeiHlPQUDG+RaSgOxCBA1fgOGVV9Qs68yaEddhSvEUTZE7b4CtVjqwXHiZx2KokXi9CsbEAF2EL4Au15MaAIjU/eSlUgfFVERcXs91ZEq6cXybLIREPyQzSZS83i5bog72qnGJbKY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(39850400004)(136003)(396003)(366004)(451199018)(52116002)(6486002)(1076003)(26005)(6506007)(6512007)(107886003)(186003)(4744005)(41300700001)(66946007)(66476007)(66556008)(4326008)(8676002)(7416002)(8936002)(5660300002)(86362001)(2906002)(36756003)(316002)(478600001)(921005)(83380400001)(38100700002)(38350700002)(2616005);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hyrA2BzWy4XVaNurQ1LelnavYpstiVxqkOiPaiSJzaJfaUWaJ+VOKhLol/qs?=
 =?us-ascii?Q?Ct0lEIcZo7RSdeMDO129jUnFTawpQmjaPB9A1Ec/QyvtjLBwHJcReinsNyH0?=
 =?us-ascii?Q?F/AtgTMKk6la59HwJSFBI1TsmPeD/ywtO0y03+hQ65tYYtWLWMgpx49mXjdx?=
 =?us-ascii?Q?6h5/ik1V14N6GT8tf6ys+V7MBKIWqkXUB6MQ1tSJA/T/g9sv32yJho5q5X8M?=
 =?us-ascii?Q?PRuEjk2ZUsStBtw+v++dFlINpc5bfK8AMQkfeIwvJ2KDkdmbu5L26MV7FzU0?=
 =?us-ascii?Q?2iF7F8iER95h3+KHzfkSFN5dwYuXfA0rqBjUI2gMKQiUO/gHUt7rhdvOf3pP?=
 =?us-ascii?Q?UgF+o4jXdQbyjOrfUGAMbwwbmdOZHFA4dfOYp1Dhg1hNerFWDG4iPuzGErBd?=
 =?us-ascii?Q?uIIWtxBKYkVbTqHcduxOOKG5L+kOsGGn4PHcAa7mOm3C9LBaqlvDDcDoKbDm?=
 =?us-ascii?Q?Iq3/jY98jNR+Q+koTg6V6UoTcLo4/gpuXwQSV2r90q1aV9pq3hPjdXNha1gZ?=
 =?us-ascii?Q?GFYUH8Fw4jwuVQb9+0vl8fCVVewbb/P4nLEhtn3x2cfRY3Gz92kTn5KeG7Jm?=
 =?us-ascii?Q?llHqO9CJ0XDplMMyAEJPpH4ynHhA7EFE30B+jxxr3gGVMkA7D5fZPajs1er+?=
 =?us-ascii?Q?KrfcXyKWnYyeGigrRHtTMDXn7YSrCTxGDU+g6GBAoTFDsvJWUeeJc6+ORJdB?=
 =?us-ascii?Q?GQDCeej2xNHDKsxLnWwFYZLNVp7BWhINKYN4hhDd3Xte8DJGxsdpVEPeeUY6?=
 =?us-ascii?Q?lqqTKakcdoLf8wFfszRZCPabdM3Hd2OQxeqIxdFfQmVGaRiHedjxINp5IucQ?=
 =?us-ascii?Q?npDGR6fbBmo4SW4HNO0j4/i4rnheCuF5qX13D8gXI19ORBWiujRq77io0vSw?=
 =?us-ascii?Q?6JQ5CVZerBJTmp3+Uyx9grPZ1B3X6HvgIUUbcouVE91sQOG26wy5XPd1UYPD?=
 =?us-ascii?Q?7Qsa58UDkjJbRVeUdFip2RXGH5f7EOI3pZALe/FXAp0nRaYBI/fEwD+4kkdN?=
 =?us-ascii?Q?yBB+zfaY/bCsHD8c+GYwMNXqWmIAM5yJYx8dLPycjsHSpPveTszZHmukuLaD?=
 =?us-ascii?Q?tVEm6bxEH60N/+t+DFh0aBtcZtlnZHEgpy/JToE6634duhobof//OLCugL1P?=
 =?us-ascii?Q?dwe2mszM685QfMcTk8TZwVIaeglDyeek444mNltYonV2o0Mkbn0u0fFB0e4G?=
 =?us-ascii?Q?OHMGxMeBcTq0rtMCXEkvEcSVqLGoF5HSOXq//4CKecM6e6dnrftFdVnb2xbw?=
 =?us-ascii?Q?pTOWZg02XBJEBAKjVB9b8qgcN/m/jAxILZ6e4mqq33r1xwV4WG6QesZbGHeo?=
 =?us-ascii?Q?gFWZ1axSGGo+h589W/DR4+pksC3EN+r4vppPS8+nwpRDuz/rdK17FkDcnT1Q?=
 =?us-ascii?Q?uz2wnWnOr6gwZf3ZWRFEOsdvwgyorsV5PXzjormopI4+WWfqBzHG20rCKF0o?=
 =?us-ascii?Q?KA++6tCiBUpl8lRvdnLLRz2Ap96paB29XrjCoNuMflGYZVC2jtd2L3y9dvnA?=
 =?us-ascii?Q?Ki9xgF8lAW3QV/PZzq85nvMVJHJ/6Tr1lok1E3VXM9VE3d4QbahjIId1Bx73?=
 =?us-ascii?Q?IocA4f7MxcJGIr6zLs07mds1rjDaithpXeE4V6Nb?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ebba1a-19b4-4abb-2515-08db212b31d9
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 05:49:20.8712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKizUUXD/PnoWJx1I+aESm8SLdwYYhBhPV69laPZaD6rM+/iSpNXIgeiSRn/DRUBnQh/W6cHvJhumEt8zADWdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6023
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH v4 5/5] fs/remap_range: convert to use
 i_blockmask()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Use i_blockmask() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/remap_range.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/remap_range.c b/fs/remap_range.c
index 1331a890f2f2..7a524b620e7d 100644
--- a/fs/remap_range.c
+++ b/fs/remap_range.c
@@ -127,7 +127,7 @@ static int generic_remap_check_len(struct inode *inode_=
in,
 =09=09=09=09   loff_t *len,
 =09=09=09=09   unsigned int remap_flags)
 {
-=09u64 blkmask =3D i_blocksize(inode_in) - 1;
+=09u64 blkmask =3D i_blockmask(inode_in);
 =09loff_t new_len =3D *len;
=20
 =09if ((*len & blkmask) =3D=3D 0)
--=20
2.25.1

