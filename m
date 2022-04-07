Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B744F7398
	for <lists+cluster-devel@lfdr.de>; Thu,  7 Apr 2022 05:28:11 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-xQ-Zn5e7P0e9futB-saqug-1; Wed, 06 Apr 2022 23:28:09 -0400
X-MC-Unique: xQ-Zn5e7P0e9futB-saqug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A42C811E75;
	Thu,  7 Apr 2022 03:28:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AB8FE2167D65;
	Thu,  7 Apr 2022 03:27:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0D5AC194036B;
	Thu,  7 Apr 2022 03:27:51 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 07F90194034B for <cluster-devel@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 03:27:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0AA12145B96C; Thu,  7 Apr 2022 03:27:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05812145B971
 for <cluster-devel@redhat.com>; Thu,  7 Apr 2022 03:27:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7EE4A803E2E
 for <cluster-devel@redhat.com>; Thu,  7 Apr 2022 03:27:48 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-xp0lbzr9NKCUNf26ax29dw-1; Wed, 06 Apr 2022 23:27:44 -0400
X-MC-Unique: xp0lbzr9NKCUNf26ax29dw-1
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 236LsrRt004892; 
 Thu, 7 Apr 2022 03:22:19 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6d932mqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:22:19 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2373GhBh035403; Thu, 7 Apr 2022 03:22:18 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3f97y72nm7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:22:18 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by SA2PR10MB4748.namprd10.prod.outlook.com (2603:10b6:806:112::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Thu, 7 Apr
 2022 03:22:16 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed%4]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 03:22:15 +0000
To: Christoph Hellwig via Ocfs2-devel <ocfs2-devel@oss.oracle.com>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1tub5h92g.fsf@ca-mkp.ca.oracle.com>
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-21-hch@lst.de>
Date: Wed, 06 Apr 2022 23:22:13 -0400
In-Reply-To: <20220406060516.409838-21-hch@lst.de> (Christoph Hellwig via
 Ocfs2-devel's message of "Wed, 6 Apr 2022 08:05:09 +0200")
X-ClientProxiedBy: DM6PR08CA0027.namprd08.prod.outlook.com
 (2603:10b6:5:80::40) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48dfe498-a030-4603-882a-08da1845d094
X-MS-TrafficTypeDiagnostic: SA2PR10MB4748:EE_
X-Microsoft-Antispam-PRVS: <SA2PR10MB47487EA3A8AE47C7ED7289758EE69@SA2PR10MB4748.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: ph7TJz13ybahhFzUjKzZz6hoi9EjoSE4dHQMnFWDfV18h+5KagqOADbAnIVWpAvozVEycMdYYa8zzCg252RO80zRbpNyi9T7tc+92ezusUxorrNXJ18kwYLL2sVdMfNTVGBN7kpBqAV0CvQvMwuUGSMaAfantVV3LpC90npPuGwNQTSDxEjJFIrbcAiO7eeUE/UbnOEkK0XyuNUrc/lM45zIMm+FF7KsB0oCUbZoq5uNwuKI/0usdEuC4DRkeNDzO8c5VWp4NXr9qKG0yxYMh3QyRGvQ30zCJyLsi0360gV7sb/Fx4lhM8+CCLd17P5YAGQXW5RaCpVErImRZf30K67W8cpMbjfpP49BqPyG3rMGRtVUlP8wsBobWI/A7+dI2JU0oxgJV5Vmmxd766Qv5twJNVgCsKgjOY92Yfm4U8TLhuPrE/Ut+u5+aqDvZIR07d6+kv0sjvuzm+hCvr0gabjG/QYmzAQ2zTU3czU5W+Z4PbMnec8vOSjI5xzLEYUg1eDZBGO80yfoTs5gGhELT3Wz/oPD5mPsiTazRBjnJtPnq+NArdeqSNJRAylw3IaqEhyUB7PM+mxpVEuCOp+RpV54qAlwUf1gyuObDXCCYjc1h9rL/5L6Kf4E3gf9K3BIcemjNmTWiBI5nYL1JFETX/q/OAD24cNAuJqG/lPMYMK1TU0DQYreYJPiTSc79UWqq1q1p9AqzmKgHlsUO2ayJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(38100700002)(38350700002)(508600001)(7416002)(8936002)(5660300002)(2906002)(6862004)(66556008)(4326008)(316002)(86362001)(54906003)(36916002)(52116002)(26005)(6512007)(558084003)(66946007)(66476007)(186003)(8676002)(6506007);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?smfdKzkzzQC5MfcTkNTRJx6MrcqktBYibTu1WZRM33ZRHVagZq6Fx6eYeOgA?=
 =?us-ascii?Q?bXhKM/v75VXxhdovlGb5kKYuZsDFnCsuzbjo1SPQqI2sJbBbNg8GrAxuF/NP?=
 =?us-ascii?Q?KBuFCvyY/eilUlZ8CYLCvM9NwInI2Lk8kbxHG0qBMc1LSgNYxyzVqYIgkjjS?=
 =?us-ascii?Q?9wZUzpuyXmw/OHBcStedtnal8ZjvXj/3wm4s/H6FFjq6ACg5F3L5U0BnTTFc?=
 =?us-ascii?Q?/QzbRcjS/COrxILp2Z+g9zeg+unT6+51ZgERIwnXfurOr5SmtKITtugPt7S+?=
 =?us-ascii?Q?p0DO6V/ZO2Dt+o9D+62WHFFgA7yNiDyvVp/6axGTkkicWOCDAzQJ3pMf7Zin?=
 =?us-ascii?Q?qQVobFt6aEFOSM0+HYW9SpnTJ73qr9nJmliGWuclbBgvKH4CEmpvvaOhenDc?=
 =?us-ascii?Q?K9Gnx5cKNJ2jqJoD3iB1apRQoMPZv3wpW4MMQPMtS5PIjpOHDWdC9pXu+fBP?=
 =?us-ascii?Q?JT5Q/9Qua+91p5DrGd0WYIoxSj/F7XY1AqEWCS+eNXIt40BG9G7kbEu6O6Wi?=
 =?us-ascii?Q?XHd8EoCPLBwM1NiHvOUgAk+zZZzpyI2jJYTS6FXl6aWaY3EH5cX7iEDtmqtU?=
 =?us-ascii?Q?2R9y1El0peGOfhITCq5E8JEYhBGObk3SEfu4I7aa/OdO9JoEfuPRmkMiyTBy?=
 =?us-ascii?Q?jdfhAF/ijlwNMUceopzBXyYZi7pVDMdLrco1QqUkIL1Osct6Jhe3StjwwsmU?=
 =?us-ascii?Q?NHNu1OU0QEp82EqTdt+ZYtheKExOPOD8UsUptsGAABNON4HF7mE77a/0U89a?=
 =?us-ascii?Q?LM2IbqhI09DwxhTllDEqqhdklhZEhWlfUSxHoPP1oFd74IVJyAY+u3MEnF74?=
 =?us-ascii?Q?KMLw458R6hnzdGcXlsJBo7p46V01v84gHfVbMmWiyiEca8+N3PoepN5Nn9kw?=
 =?us-ascii?Q?ZdDCvKCeeFVhMLVNL6axV2tmUk0iFv4m1m0dZ6FVmRX3NaNhkVHPoZrptmjr?=
 =?us-ascii?Q?VBt2+33iKm8BghK6TD1bM9N539nCQ59YjiSv9TNwGxhzMjVuW9dSFMbeffyv?=
 =?us-ascii?Q?3igRst9ERRUAQrxVHRoA9UHcf3JPUTgc1ksnDFl4JtBYfZPUpfkTvJRfAMAH?=
 =?us-ascii?Q?A5z+VnH8Dt1orSNOo+bGXRJ9n2+xJHjLLTM3m7vl9iw8br+p5zoAW45+K9X7?=
 =?us-ascii?Q?jn6GqoV66kRS2PzB1GvyqKfsPoBH5KpBgTW0UFURoch/eCByKNKprXuzWT7w?=
 =?us-ascii?Q?wS27Lysj+Hm5mBt8OHvd7tRb10WBkfvDMEjeCdx6nO4LzOV/H45v3Jf1cNp2?=
 =?us-ascii?Q?AslMP+FWldX/mh6V3bdglSLt+YcPjUWBsp7YGf6w2JPWhWZFwd7z2SZGhNJG?=
 =?us-ascii?Q?6cNzBaAj0626t36i5I7bLET9wdAubKkmiwsBsWB1/rfEd+9jv4TjUAf2bGsv?=
 =?us-ascii?Q?C7+zUgXuk/SIYFjzokPsd8rD0Cxy1/CDsI4OUdsLpJ0y7G1vHeLX3wFHl8Pl?=
 =?us-ascii?Q?6xiUhb8itUQ0jrl/eLZJYv48WUiz7Vkc0HhWr/UKedQSm+HpsfmqBu6zXPbQ?=
 =?us-ascii?Q?JWOjmtXfOD/l3OG0FERkZjIORLQGTDmMed7dEoL8U6PsQcrNeGfEvX+7S+4d?=
 =?us-ascii?Q?B9EpcQdO0FUNi8+JE3n+rkNJDvvH/DLnCRCx+5ljkK5wk35aMOUUIVk1gPVV?=
 =?us-ascii?Q?JS80ZhhdfoMiqI1rG2Llu7fUx5VR9pWFenqE3jOFUo9jr5L8BR2Gev+wYfwR?=
 =?us-ascii?Q?3KzWO19pjJGdmeCAgZMEZKABjvl2X4GzNxOk4IAwLd74ROSZenPf9AfA05Vs?=
 =?us-ascii?Q?J+jC/LDaTYy1byqBokxGIhJ4DXvKE98=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48dfe498-a030-4603-882a-08da1845d094
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 03:22:15.8957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mouFQTiGIB3sqIlUkexWTCexFzQ2PEHssCgeJ4E6Wra5R4KAPVyvJyuCB6zCHxahDwRdbWgEroHmtjXA5lGtLWj+q7jaev1O8w8EMd3wEKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4748
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-06_13:2022-04-06,
 2022-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=920 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204070017
X-Proofpoint-ORIG-GUID: qEU8oo0GXgxRhC2NABzBkCtpoPeQvZDd
X-Proofpoint-GUID: qEU8oo0GXgxRhC2NABzBkCtpoPeQvZDd
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Cluster-devel] [Ocfs2-devel] [PATCH 20/27] block: use
 bdev_discard_alignment in part_discard_alignment_show
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
 linux-mtd@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
 ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain


Christoph,

> Use the bdev based alignment helper instead of open coding it.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering

