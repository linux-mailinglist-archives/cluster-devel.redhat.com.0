Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE6A6B28BF
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Mar 2023 16:23:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678375426;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2EXGMkyJ407Fx0nkTjuSz8GO+VwvA6l9pOAQhFOju8U=;
	b=Fyt6nJgA/Lu7Rx0QdmrfrwkO2J4K0R54xyQMq05CeCLXc++nYhUV78fMDn5dRrCUOscEGn
	/UfRlKKFlEhCRfTl+0b448yhQ7Z88nCEpj7EKs6c9vnlITTCeFa21lgMFBtUt/eYqPTSkr
	cNu2p8zPDKHpxnHz5GXCvqnVpYE0SQw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-QTpG6__aPAmy7KwkGPwNMw-1; Thu, 09 Mar 2023 10:23:41 -0500
X-MC-Unique: QTpG6__aPAmy7KwkGPwNMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74C331066147;
	Thu,  9 Mar 2023 15:23:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 658981400E71;
	Thu,  9 Mar 2023 15:23:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1E1C019465BC;
	Thu,  9 Mar 2023 15:23:29 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 032FF1946597 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  9 Mar 2023 15:23:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EA6DEC15BAD; Thu,  9 Mar 2023 15:23:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1FB0C15BA0
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 15:23:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCF208061F3
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 15:22:45 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2124.outbound.protection.outlook.com [40.107.255.124]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-a3d0u8ZHMeWskI9tdOmnQw-2; Thu, 09 Mar 2023 10:22:31 -0500
X-MC-Unique: a3d0u8ZHMeWskI9tdOmnQw-2
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4073.apcprd06.prod.outlook.com (2603:1096:4:f5::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19; Thu, 9 Mar 2023 15:22:08 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 15:22:08 +0000
From: Yangtao Li <frank.li@vivo.com>
To: xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 rpeterso@redhat.com, agruenba@redhat.com, mark@fasheh.com,
 jlbec@evilplan.org, joseph.qi@linux.alibaba.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org
Date: Thu,  9 Mar 2023 23:21:23 +0800
Message-ID: <20230309152127.41427-2-frank.li@vivo.com>
In-Reply-To: <20230309152127.41427-1-frank.li@vivo.com>
References: <20230309152127.41427-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4073:EE_
X-MS-Office365-Filtering-Correlation-Id: d461e413-0f51-4f1d-d76d-08db20b20c3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: E0GSNzAaXPcAcRhkThhiuonbAkvDbLW6KQzMnphafn2WlZNyifcGrYNJ5CLxRycHYcGCAitOJdWkvBu5RpNcp/hxdd8+7rOkPk5TOH84OFo90L4u+fFoz2uNrI6G/nXvHeAsONCYWfXzRDdiRHWWnlfmSFPOPqr8M9OA/Ifp+AYEX6QNxbfXSSUwqN7oBufMCCXhFFnzSxNt/dk6E6MxktDNNae7lQBbsBvMxhYCSafvoui5v3Cy2ykWR9RnuQHiZUIHo+/+hA6R/3Wi50PJZWDaKEeidMzfimsvGg0cihtete2tQGtMSfo3zm6tUXW/5WZUeBSMvxKeUdcluoXNqh1fY2dRn3bi7zr6crBtgVd+GKJV5AaWBMN8UHPJ4MIFzjRFhDez0333sUMioK+J7WEvO9zgjkd7cKA6wzB5+0gDmnmp5DGgH5eInrptD/QfgmWO6By/dhHsPsWAc51hs7p1zv0L4HiruGPMpsmgCLTOL1KCUOLk7hOJFH6YfA5uExgeI7f72KI/KwjoIrZ04zpm+DCzUJasrdn+SbGes/Z5FDjgPscLGOtQubsp1ANle3JB05n6flipJuZhHcFug+/jAw8RWvCKC/tpbJok2JiiGGilsweajTvv/oKnwH9Qk0kDvkHj5mZlQDDCoUBkJ3+5yLlmzd8133DdYy559natBwyIB51Fb82itgKQ1dEeFDlup3S1dC2Gq9xxPVcbZL32CfEvTBFkWvujX1kG0tU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199018)(316002)(36756003)(921005)(86362001)(38350700002)(38100700002)(1076003)(6506007)(26005)(107886003)(6512007)(83380400001)(6666004)(186003)(2616005)(8936002)(5660300002)(6486002)(478600001)(7416002)(52116002)(41300700001)(4744005)(66946007)(2906002)(66556008)(8676002)(4326008)(66476007);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8yK9O2+P0NeBAmWglWmVMSrjQ0UvgthaZl4gA8Rta59Rps+AP4shb22ftqpc?=
 =?us-ascii?Q?UdkZhicPc+pLg+Oiv/CW4nd7HI/CtsxIbreZZv2KG8XTGF+sXHjTBC0Fnr7N?=
 =?us-ascii?Q?d7RAqp70Yovq88zt9ztINEvpucBpE+l3UPhSRIMrvIlBgMiXKKH6u0soyCGC?=
 =?us-ascii?Q?blxt+slfWlPjzVVSq+Jevg1vn6VGB/v+HcPwXZT555yTwDJkeldwKMa3wYwH?=
 =?us-ascii?Q?zM7MoTSn/iSI07K66NpmFlmkdMlj0vrT++OifJp71BEgBifY3zvD8b7OiTXK?=
 =?us-ascii?Q?rAmLstFNspMA7NiljWXx+hR1ezn0DUEVo34hcZkZ4ZnWw1C7WrCPtjzDMI6Z?=
 =?us-ascii?Q?bUsAtPmdzZhkNVbgiR840bZX+JmMi5jGuFc0O/zBYfNROvM5KBt/gC/lCD4w?=
 =?us-ascii?Q?DAAlRowkarFZWJaG2WrcKHFxyGn7jsRZuN74jLNn6lUNFBAduIwzeMF74QfG?=
 =?us-ascii?Q?BlHEsJ06pvrk52dSdiDNc8dykeAlY+D99HlQ1235Z7JCNyyf516ihBHopMjQ?=
 =?us-ascii?Q?ohh3aoMPbZWm6P6mK5Rg63DAIf5MzrDCdQvu81+rOMPOZaOesljZW8f+R5hY?=
 =?us-ascii?Q?IR7rUiVtP1VIYt8IZbmMdyUIyKPVi0e38LUf3rtjNaR/oBunEOwh6r2VJCYo?=
 =?us-ascii?Q?ZEXJJs3tbBl3b5EubU/RjmGbAKqSA2UybNfvdQ8Zrl06Gom+/vJoWNh4a4vz?=
 =?us-ascii?Q?eCwj+UP6wRA37H63qEeO3qZn4DVEeqSot4y8XNs9vpH3NrOXxpK6r0RCaMR6?=
 =?us-ascii?Q?2GEQUreeqyQg/1n1lrX6PnwgntIHiegZaEkZh+GZoPwAfuHkyCGlKIxpCbl+?=
 =?us-ascii?Q?hS+/IONU2CFC1Qx3nyJHa668fTf2PUUEPlLUTH3/JPdHowBV50DotF2tMxFZ?=
 =?us-ascii?Q?BpmigM76a0ANxnB9zelg9i/HMbIwClbA7TAX8WyMI2G8S2PEUHbOPLjzWEWv?=
 =?us-ascii?Q?JIkMxkN7ISy/XMCFnnvnFEPWG2nkYp5jo8NY0Jn/4Lii6U1ouWrINX98qVKP?=
 =?us-ascii?Q?qahibKPUA36uG8Sda8zI8YyqPCKuk4YUmRj2fJolaONMdX7bOin5PCzJgpWK?=
 =?us-ascii?Q?NO85zH7MqFKVuxno8E/N/UQGhRdQ0qum/jvhi8SzV0p8rTEkUWr08FCwP4tV?=
 =?us-ascii?Q?nmjyb/Hu6u+emQ54JOILNvOTQKvV3piWUKMPYhbHfWuryMKmMx/wpHtXzM/U?=
 =?us-ascii?Q?0L7fQCaZP40/x5E8fAEcniu1nNd657MU9r/MS1xPdZr5pNTgfYY4t4NhI1y3?=
 =?us-ascii?Q?o/6Sah34rSQE0TknMgm01Bk14JFtsaE0KdAAwsVOruQRigq8wL3XR/XgRqrJ?=
 =?us-ascii?Q?HUwfKCkqDpoodFeZKzyQ8YDtrkEMOOOhBMtVgp7qg+OXAnsItqgrCiv6kcGa?=
 =?us-ascii?Q?+K0kgwxreAjL24CzNh4ssiYLUfvVQSj9tKE6dgbTV45eXpGZfSOSeAruMrO0?=
 =?us-ascii?Q?9UNkpClNfJ++bEbmCMnrKeHvBiM1mtJlSCSp/7jw2nHQZxJgcrxMDvPdf4bS?=
 =?us-ascii?Q?k57PtMQDaXEYWrH86/9tp3mfPx8Kpt4bHpgZI8DhiZH69AJwE2c+9QCGDHBn?=
 =?us-ascii?Q?SoyWvhF7ktVMD8JPEHC8+DDMN/D4YiE8vStb7r+h?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d461e413-0f51-4f1d-d76d-08db20b20c3f
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 15:22:08.7178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQpvvq5B7tilzUfzChSBYPrsS+VXR56S8jADb84bY9ha6sfWsC99ngdEXpgUYI0kUG3WSnesGUAPO0kYQ1244g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4073
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH v3 2/6] erofs: convert to use i_blockmask()
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

Use i_blockmask() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v3:
-none
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

