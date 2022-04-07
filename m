Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 792FD4F747D
	for <lists+cluster-devel@lfdr.de>; Thu,  7 Apr 2022 06:19:26 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-hZrlyf7EOoOIEz34kycgLA-1; Thu, 07 Apr 2022 00:19:21 -0400
X-MC-Unique: hZrlyf7EOoOIEz34kycgLA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 783E11C01724;
	Thu,  7 Apr 2022 04:19:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F41E145B971;
	Thu,  7 Apr 2022 04:19:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C9A19194034E;
	Thu,  7 Apr 2022 04:19:01 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D80931949763 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 04:18:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A5A7242B924; Thu,  7 Apr 2022 04:18:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0CB1428F1F
 for <cluster-devel@redhat.com>; Thu,  7 Apr 2022 04:18:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45905833964
 for <cluster-devel@redhat.com>; Thu,  7 Apr 2022 04:18:58 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-E1L-JAgTO5mxWLo7IU4T6A-1; Thu, 07 Apr 2022 00:18:48 -0400
X-MC-Unique: E1L-JAgTO5mxWLo7IU4T6A-1
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 236LpIFL004895; 
 Thu, 7 Apr 2022 03:05:19 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6d932m5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:05:19 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23730Wj4013140; Thu, 7 Apr 2022 03:05:19 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f9803h1d3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:05:18 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by CY4PR1001MB2152.namprd10.prod.outlook.com (2603:10b6:910:4a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Thu, 7 Apr
 2022 03:05:16 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed%4]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 03:05:16 +0000
To: Christoph Hellwig <hch@lst.de>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1wng1k2zn.fsf@ca-mkp.ca.oracle.com>
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-2-hch@lst.de>
Date: Wed, 06 Apr 2022 23:05:13 -0400
In-Reply-To: <20220406060516.409838-2-hch@lst.de> (Christoph Hellwig's message
 of "Wed, 6 Apr 2022 08:04:50 +0200")
X-ClientProxiedBy: DM5PR07CA0068.namprd07.prod.outlook.com
 (2603:10b6:4:ad::33) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 446c5253-2f86-4e5c-b24c-08da184370bf
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2152:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1001MB2152E05222F1BBC5E98158F98EE69@CY4PR1001MB2152.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: /nK5r/MuRnz8ktLCSFU22KjRIztZG5J+F4JDyOjXsdc31ie4LJRCbfsRVHM01SOjoWooWtF/OnruYEf2sJXIEJue+piPjYr79bmJhLuQxBTBaQMOegKNCL9P2RvPOPpM8gfjxEr2yp80dF71knzsUCiBPN97PDjwemHuidm0+ofeUYw32YiEMBOy+1Iswc5HiqLGRnNF0e3b6Kc4eUmHS5wX2i2DpHYidv4jAIaSRvP/UhzP3/8X+TMW52/5lz7HRoqyi+sOrCXAsCpWuXfg/E5nkUNHBjyV4ftC4ywCqRzk3NtYhWbzdvu0h+jV5tT9PvegMNvV8rz9qOzTy/mZcIGQ8D0GMCS3y0XjDGIJnAO1ORk75BbzU928Z1XBN6iT1tS/rKgnjO9Ql8iLGFulJ/lh7kVVnbOazr4/rqcL+YEoNsRgPBL02Y95X/uBSe7ksFXUETPP6a93DCohbGGlDToepS4lrXNrU4ROpdJoK55bybd5iNINiXPe3iivRayOLl6+iGGxfChhwp9ku/zix51NXgP9T4nGMBQ6OTYoMYhKm5hcti/urkEGQOejQc8TFc2MKf0a5e/IusjLKxQksMTYESwPmzNuRnrIgR0MIGkNtfxCCxtk3G2DtlJNoyCblF0gBziHq5pkVPTHzLnkyYZSvfhYWtCtSxeacZo2xalKWfaSiplfVJx53owNYdHAAejIzZINATBpKhooZ+F4Vw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38350700002)(38100700002)(26005)(6916009)(316002)(186003)(52116002)(2906002)(6506007)(6666004)(66556008)(86362001)(7416002)(508600001)(66946007)(8676002)(8936002)(66476007)(5660300002)(6486002)(4326008)(4744005)(36916002)(6512007)(83380400001);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qY1nBGMXTuj8DG81dMRc1M9V4GVzuBIJ9qlOqc0uEdupd1bv+wCC59Ok6bo6?=
 =?us-ascii?Q?xybN22YVd/YDX8pGkxRCTpNSAXeh7lEoIdjnKlD4FPDjd1Q/zUsgbz5nMYM8?=
 =?us-ascii?Q?ITgNiQBp3NFaZGQCH225g0rN4jvLRSrMbzrlQ1xNMKU/mw2v54+/JIO8KuXG?=
 =?us-ascii?Q?Ivbo2zsRUjQQ4GiFmEtFh3YswKW7gJqMaRHsb9UcYsfregBwGVUrDiqZxBM2?=
 =?us-ascii?Q?ZSTlD0veR8ee7l0+5ApD/bKF/A/9kyzPsB3OusFL8ArYkHJfgCBJFqbfUuvr?=
 =?us-ascii?Q?t2lClIH4fAcA/eivwaSfLdMv7MEccMoyc2BbqUCvwG1DmCVjdjclfmwAkipO?=
 =?us-ascii?Q?3cVkfQRz8YKcbBcMV1KRP/DTMct+zBYnFNpfNy1Qmu27R8foSFqOKBVouGru?=
 =?us-ascii?Q?ydHGK86lkXLIYlfgwAtlU54MpAwHPpbVGHexsYhVbhXFm/jv1Rox725aNt8Z?=
 =?us-ascii?Q?KWzLwwQMSFGclLUtjLxxwuk3VjPY5HQPq02436NzC6gE5QTAUJH7PAVReXyp?=
 =?us-ascii?Q?d7iS93ChD8r2pGPAW2Q7cV8HeCT3GZR8cP9/5sLujMHhYrIwuJ0JyRWQs2AA?=
 =?us-ascii?Q?S7WO1oE7n00OGyZxnzbPhh86u4clsYw7nu+zWEccbvkd3H73a+s55DBdhBsX?=
 =?us-ascii?Q?EOSm3vUpPdWqd/NFB6Buav//MlAsh1j0ZetHi6J7XNmG3MCK2Ypd/KLkWxAQ?=
 =?us-ascii?Q?a9JJtEKXaG44jB8I6cCApuB5Evi/JP6sDm1C2LHDGy5MPg1jOeU1NpYahRbs?=
 =?us-ascii?Q?BZaDVmD3jyJ6H+SXWlW6MyKUScTXOMH/E8C02jCKsizLJbM5dOaJXCtJjp0t?=
 =?us-ascii?Q?ocGw9J1Eb7HZ+X3pYDM0/GO2ev238mT65vcSA0MrvfeeTKVuByoBoqy+7GJT?=
 =?us-ascii?Q?9I+REuB5mK3DT7ngexEU0TSy/hk6IDvbjLBPBEV8ak75ftSp40C5v14WbuvC?=
 =?us-ascii?Q?p9XcjGOhncF8nf1NCaLAY7wO9zgOnk+DzCaUG9pnt2iKGS+x12y3tFeqyupG?=
 =?us-ascii?Q?rlNVlp41NrsO2WD0Dj38OPI/CmJX+a/V3QxYrZs2pzCxwUxBkaS16BYJ19gs?=
 =?us-ascii?Q?utAJkPO9UcbMD1+p215yuOrF92OGRwnXIWUhWR0j1jnarPXh8Rx1g6WU5kIw?=
 =?us-ascii?Q?o6D5qM6yCgzqQS4ti8CR3a7YAUU+5K+Lur1IQbZ0jZ0UNcYqVAiRb0j1EDB9?=
 =?us-ascii?Q?snHxE2XKWTJ2Mc9tza3YxNjH+GoOVSmXsYmD/HLDjJ2rIDVtDmwZIuKlFStA?=
 =?us-ascii?Q?omkqKxn9xz8TAkZMov+tIAv3gSUfwB5k0yQH/9rv/TBeVR4K2/YqKhDBQffa?=
 =?us-ascii?Q?HgYYBLKVuV6ceja2TdZ/CiHIWMujNH3OPXFFfldRfkuoslxSbRk+AFl/0nul?=
 =?us-ascii?Q?bEYpvSqdZTuzCkhL/2DBp/sbtQHmJ1NkWMfGzA61MWF1wKm83Y36Nsrkqf9E?=
 =?us-ascii?Q?o+E8ycTJrFoj0R5DpHdN6kYroViJ50Gz89cLuSVSSDfXQc10hX06ize9gyU+?=
 =?us-ascii?Q?/ZOQYRwRDYL3DvU4idJibgI/zufed0BUnXDaI40FReyrrjtz8aMUU5sjQQEy?=
 =?us-ascii?Q?iUXFTa/BX37Lp80KVcYTfRZjxe1N/PeHsQwdyGpPuGOQjqHIVhWZPyD+I1ld?=
 =?us-ascii?Q?8qv1/Uxosiz61rt1qgrjx2Rcvox57kV9ZCsNKzW9mdJtSBiSCDurcEV+OILv?=
 =?us-ascii?Q?wHo9IC8tCyj7fQ3lZr3yKFe+94f5EPtGJDq5xbOz2yiALz4f+quYstOYI+gE?=
 =?us-ascii?Q?JTt78DP66djTrkit7F/PPtKpGwvCvXA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 446c5253-2f86-4e5c-b24c-08da184370bf
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 03:05:16.1549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8wd1AdPWpIjcCjxsi2pbd+ciWqzHOAajRxs38iCvhynb2Xri9DgaS4+iigUZuPE6wN79jbNBsZ1lsFi5zU6X0feZ+MmPZxgDmebjEXCo6PI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2152
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-06_13:2022-04-06,
 2022-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxlogscore=953 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204070015
X-Proofpoint-ORIG-GUID: z327C3w_lmDACCGlZXgN11Rpzh40Eu0h
X-Proofpoint-GUID: z327C3w_lmDACCGlZXgN11Rpzh40Eu0h
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Cluster-devel] [dm-devel] [PATCH 01/27] target: remove an
 incorrect unmap zeroes data deduction
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
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 linux-um@lists.infradead.org, nbd@other.debian.org, linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org, ceph-devel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 ocfs2-devel@oss.oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain


Christoph,

> For block devices the target code implements UNMAP as calls to
> blkdev_issue_discard, which does not guarantee zeroing just because
> Write Zeroes is supported.
>
> Note that this does not affect the file backed path which uses
> fallocate to punch holes.
>
> Fixes: 2237498f0b5c ("target/iblock: Convert WRITE_SAME to blkdev_issue_zeroout")
> Signed-off-by: Christoph Hellwig <hch@lst.de>



-- 
Martin K. Petersen	Oracle Linux Engineering

