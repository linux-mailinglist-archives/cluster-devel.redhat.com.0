Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB70788EBB
	for <lists+cluster-devel@lfdr.de>; Fri, 25 Aug 2023 20:32:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692988351;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=FrntrZGXR0VBLBGOlgVqBCQd4ehNLHVKAWdZ7D7+irc=;
	b=DkHi1PNHamyjDD7nLowffPQ5CXWqqq419sNVo2bK0WxI8hkwBwnSh+swsh6vk8UU+dWh9m
	9dwM8U4QhQYR7z0zlpJHpvMegezsOpFDl5ykG1fmNKPR++1urJ98a90Nm9uPnksACe7n1T
	6BnnyvTF/i2UsaPIj6GDGFOhYEPkdqE=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-_QCjWJULNSGou38fr0geSA-1; Fri, 25 Aug 2023 14:32:27 -0400
X-MC-Unique: _QCjWJULNSGou38fr0geSA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 348F13803512;
	Fri, 25 Aug 2023 18:32:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9599F2026D68;
	Fri, 25 Aug 2023 18:32:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6060719465B5;
	Fri, 25 Aug 2023 18:32:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6E18C19465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 18:32:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 583956B59A; Fri, 25 Aug 2023 18:32:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F9C3568FF
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 18:32:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E3558D40A1
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 18:32:24 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-owW_1exKP-Kmav3KfjHQbw-1; Fri, 25 Aug 2023 14:32:20 -0400
X-MC-Unique: owW_1exKP-Kmav3KfjHQbw-1
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37PGKSGD027266; Fri, 25 Aug 2023 17:36:03 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3sn1ytxvyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Aug 2023 17:36:03 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 37PH17ac002047; Fri, 25 Aug 2023 17:36:02 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3sn1yyd2v8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Aug 2023 17:36:02 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by IA0PR10MB7160.namprd10.prod.outlook.com (2603:10b6:208:409::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 17:36:01 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::2990:c166:9436:40e]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::2990:c166:9436:40e%6]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 17:36:00 +0000
Date: Fri, 25 Aug 2023 13:35:57 -0400
From: Chuck Lever <chuck.lever@oracle.com>
To: Alexander Aring <aahringo@redhat.com>
Message-ID: <ZOjmfaFeRP8Xv4db@tissot.1015granger.net>
References: <20230823213352.1971009-1-aahringo@redhat.com>
 <20230823213352.1971009-4-aahringo@redhat.com>
In-Reply-To: <20230823213352.1971009-4-aahringo@redhat.com>
X-ClientProxiedBy: CH0PR03CA0211.namprd03.prod.outlook.com
 (2603:10b6:610:e7::6) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|IA0PR10MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b7c7869-7786-4485-f4bc-08dba591bfa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: JrEH6e2TB/P1wdrN0eYceQmvX4xNxPEUeYSPGPV3vPpcde+ldJisZjzHERA4+15LllJb3xwYgPqNa+1iYh+aN0HWUXOb3iXt5ykiPgn2EwWmne36rtw34csK0DCI7e4jtcmJ+FvWmKkt7jKIRhIMvqUP70223SRX+UTLjbLk0BT3tx+gxvX0kFUVYKa9VGVLILKuyue69w9FWNWrtq66TYT5O8UmpfbekacbWIXrwqF52C6Mt2bqsb+X/uQu9WsHH6DzthdXlVp7QWvauW4ePmet3qWZpbbdJtP+WZw5tKKXmQ0IkmK5LmMI/D5vQbOIsPY/tdpEDeDEMYzuV5e+a2fblUPAg0ZWoG2zJPbJWBM43Qbq4rTiRaiIT0kT1/5sdDZ8ikichUpLW91JMQcVndms50lQZnkaceQXSztfSGMmD1/gpSqvqvEfetMIvXxfK5NMS+TqZob5q8j5YzPUELyLcqOQ0qC6kGxVEy/tAHSff9JwML77LjAbFbGG7r7tIBwuSM4FRBam94jSG8LbWoUs1To7VAG6y3eBg8CKw0PquryiE4Ngv3m710maBLWt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5128.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(136003)(366004)(39860400002)(1800799009)(451199024)(186009)(6486002)(66946007)(83380400001)(6512007)(9686003)(41300700001)(66556008)(7416002)(66476007)(316002)(6916009)(8676002)(2906002)(5660300002)(4326008)(44832011)(8936002)(478600001)(6506007)(6666004)(26005)(86362001)(38100700002);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x3nvMLtbBgl1UHDfH/O1bY3yQduZHh0ImDhKyJB0gdagxLcf2uTUZd+9RMIv?=
 =?us-ascii?Q?Q3RVcA4QCbdfd3tPM3uqtVW7Dz8ZvP9Hq7fp86yGJbZD2nQdgJAIeoubjZlv?=
 =?us-ascii?Q?ukjOt3I9qWk3KEIAGtf5FGB3c7Cd4eLLbjjUCFCFRLxqCZuFKIBXfvssFRtz?=
 =?us-ascii?Q?7+0V4xMsuTe1cGtG5jY3syOELccFRkIVNtHenZItAAChx+oF1RN3y3jEN9w/?=
 =?us-ascii?Q?2nwqze6mMofOtf6ecubAn4VMjSDvZlbX0QBrDT7yK8YPtGJrPhkkv6fcbuO8?=
 =?us-ascii?Q?kiHrISsvDkJuXL4ngtk47RXEkUHLZKlo9tlBS50zC+/GW3qXprGewRVAtOol?=
 =?us-ascii?Q?1h+zUbGPIPLqmkPoYYMN85DuwDvrTI782fkKNgA9GCNpwEy9XGT5JppSFDHa?=
 =?us-ascii?Q?BR7HoeOQcgBDf8oLxRpcw/7Xx6wiUX2eRhRxTXxFjH6/ZTe2Tnl9Vs1K8mxe?=
 =?us-ascii?Q?hEEQ4NqBeskwDpWCygD6gBQ1QrvY2mp9zrWCnKHflj97MMPwEkwFQOn9b9Z7?=
 =?us-ascii?Q?yQw0cJMqOWt9ay4wfADqcyh4HKpyCXooU0tIMGd4E+EmZIPTYenbUXwx+zPB?=
 =?us-ascii?Q?qtmvw8rwNe2kHgX8SCqhWTHsykq1RBY3p3Enq+v81M5s0SDD4s9VVm8ascd4?=
 =?us-ascii?Q?GC9zrTN//Zv9W8fmbhX/szJW9UjgCBiKbxyGADHp7Yn3Rt6a6p9AgmHTGOyb?=
 =?us-ascii?Q?E+2t6WLMhZy4qfxgNnezGdEGEKfIMtxhVfglEWcaAhGNZU/WJSijhFR2rM6i?=
 =?us-ascii?Q?Kq4JAzvB3oIV/JeCJz61sS3sgWoKij59d3W6DjP3B5/f3v5qwHdQ4h8FgBX8?=
 =?us-ascii?Q?mhLpjYy0EYqsM3iWXsu17k0FADdKmjD5LoKdZ5DZrMWjDLgsJxBrp6Prbwc9?=
 =?us-ascii?Q?F6nSGacH/anBB3ocSj1u4ZpwQfYtwq3/heBfgckMw8ViLDn08bDVZ0QbVs0I?=
 =?us-ascii?Q?/hbmwGXr4SPh5nsu6FRL764+Wkljllc+AcWO7MzrEZFS/dRjODI/wvO6cAcq?=
 =?us-ascii?Q?DAZMq84lfIaF6/jsJloVv/RRAVsiZF6o5BLEwQ7pyEKDPc7Ghq1MbZrt2IUD?=
 =?us-ascii?Q?4k8h/TZfX6ivyWuEohBfYTZ7+TMF/33j/xY/IsPi3RMmDJzToj1Vcvf3UPQf?=
 =?us-ascii?Q?gmJOGKmq7biXY3sQaYy+zzBJCpFUisnjJdfr9PFFvWUvy65obj+WmzK6n4cL?=
 =?us-ascii?Q?OroFoTuj/icJQOweZiW9njVzb/HFk1c9J/85PDu9sD6f13pDfLQqhYgVJDKD?=
 =?us-ascii?Q?93X1TBjM7pjqaqL4IP0yP9IIhiKZ2x91wtllEY1nM1c5s1Mp3kwblNDUqp3o?=
 =?us-ascii?Q?s6eyZ/EAu9OaZk887JpB3WSEFqvw5EZm1Ga3C9NWQeDCVDtPkr6w5w0zjF9k?=
 =?us-ascii?Q?cRW6YLVSC4zwcpvGwsFpqyr2iRphM2oHxKdFPA1hnrIwdfEvAL8vKW5uixqR?=
 =?us-ascii?Q?PyWZJ1ZGcDA5ik+x8srd1UORFCxT5FXBcpMT5+XVHRATnthE7Kcb5ks6r3CX?=
 =?us-ascii?Q?LuXRpT2MjzHWpOWrSpAWyhvheR5EzrSicRDyFiqAECCA/WUM1eo/MDnJlTZx?=
 =?us-ascii?Q?uj8MarK3NxQ0z8jdzj2sYZjHpf7crtau32deQCrAKTjuEOmO6WGaO9b17WFR?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 5E5jn3Q7rsj9d56hE+G6M3tVv8v00PNang4gPc3+Hj20yRj0RxV4EAMLJeyi+TWC8vaNtB/07IHq1wbmbzYCGQsV0VUbCb2oOjFhbOUi8riZJKT0g4B1smdxLtC5aV9BB13e2mjsgV+W+7FCT7KiIz4cXn4xLritWtRP6oL6l6+yDDLyQLxBxW6NM5tijak/V744qQ55lmMBnZYP4XeoAp1MxuwucNfrbI+iarWIaAqKEZm49hAKCdF3bLcU8IYzdPi6zP/MEW5t2NkWhaAB7c5SuRftTBtR8QhJEXYrHiog3/pgYa2YLtt1OpPHQ0jzqvaD83cV8pecyum/MdtlMml1gbjTnyNeLFhfQ4dCoGctiZJzR5Qu33e4GW8cTs3w/GOSJeG+fzWp4YHplREF7pQ5pouVPdzejGjEdYDRL1042NXSUDLOxiPUObqgQ720yWtPW5Kl+qB+erBHd1lfPQ3hLKG1XaznD3KmuzET6dN83JJWzhpsbpiGjA8Mr8AJoKTvbMNF36ltmwT6A8ItQJhQeQnDUCnGcbFapCqs5sRDYYO7xUJVYpKL2WP1UkVm/pQZMVhq3zEi8Lxt4AM7Ih74OxU/Qnh5tgwhh0n7AKW4tme29AycI49ZlOwHeofGxVJIAzh3kxGtYwHKstZ7pSvPR/mg40kF7uD+XthDOucP18LYbP7sl1rbFp14nZIr6W/P9AHTXsft95htB1Ne2dja+O5lA9ucuBM7tuKO+4z+uHKUbH/H8fH+ZNagf1UAGKYRq161Ex0mnJi6k6AAJ5tBaHZ+DeJFsbBt1UjPpIh9GHWbqa3B7leCfHfNJ80UpxtR3si0mybowE3gEs4N1B94xl7zVCbulPIWzUngx/BieNhFmGNqsVAUnlZsQel442PshV4Y4m28RqYz35UnnQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7c7869-7786-4485-f4bc-08dba591bfa0
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 17:36:00.8202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NDpZQXPnGQ7MauswZsjTLbMpn4wrmzkdzheavUAvYsbhZpQ0v4bv/T2FhYqTpabyb/RvCOveyepwN3nRiMiGmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7160
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_16,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2308250158
X-Proofpoint-ORIG-GUID: d7e1FP_8eg7pBY7Pnbeqa8Eb4QJ_VC2U
X-Proofpoint-GUID: d7e1FP_8eg7pBY7Pnbeqa8Eb4QJ_VC2U
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH 3/7] lockd: fix race in async lock
 request handling
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
Cc: linux-nfs@vger.kernel.org, jlayton@kernel.org, cluster-devel@redhat.com,
 ocfs2-devel@lists.linux.dev, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 trond.myklebust@hammerspace.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: oracle.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 23, 2023 at 05:33:48PM -0400, Alexander Aring wrote:
> This patch fixes a race in async lock request handling between adding
> the relevant struct nlm_block to nlm_blocked list after the request was
> sent by vfs_lock_file() and nlmsvc_grant_deferred() does a lookup of the
> nlm_block in the nlm_blocked list. It could be that the async request is
> completed before the nlm_block was added to the list. This would end
> in a -ENOENT and a kernel log message of "lockd: grant for unknown
> block".
> 
> To solve this issue we add the nlm_block before the vfs_lock_file() call
> to be sure it has been added when a possible nlmsvc_grant_deferred() is
> called. If the vfs_lock_file() results in an case when it wouldn't be
> added to nlm_blocked list, the nlm_block struct will be removed from
> this list again.
> 
> The introducing of the new B_PENDING_CALLBACK nlm_block flag will handle
> async lock requests on a pending lock requests as a retry on the caller
> level to hit the -EAGAIN case.

This last paragraph might be obsolete? I don't see a
B_PENDING_CALLBACK flag in the kernel or in this patch series.


> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/lockd/svclock.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
> index aa4174fbaf5b..3b158446203b 100644
> --- a/fs/lockd/svclock.c
> +++ b/fs/lockd/svclock.c
> @@ -546,6 +546,9 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *file,
>  		ret = nlm_lck_blocked;
>  		goto out;
>  	}
> +
> +	/* Append to list of blocked */
> +	nlmsvc_insert_block_locked(block, NLM_NEVER);
>  	spin_unlock(&nlm_blocked_lock);
>  
>  	if (!wait)
> @@ -557,9 +560,12 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *file,
>  	dprintk("lockd: vfs_lock_file returned %d\n", error);
>  	switch (error) {
>  		case 0:
> +			nlmsvc_remove_block(block);
>  			ret = nlm_granted;
>  			goto out;
>  		case -EAGAIN:
> +			if (!wait)
> +				nlmsvc_remove_block(block);
>  			ret = async_block ? nlm_lck_blocked : nlm_lck_denied;
>  			goto out;
>  		case FILE_LOCK_DEFERRED:
> @@ -570,17 +576,16 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *file,
>  			ret = nlmsvc_defer_lock_rqst(rqstp, block);
>  			goto out;
>  		case -EDEADLK:
> +			nlmsvc_remove_block(block);
>  			ret = nlm_deadlock;
>  			goto out;
>  		default:			/* includes ENOLCK */
> +			nlmsvc_remove_block(block);
>  			ret = nlm_lck_denied_nolocks;
>  			goto out;
>  	}
>  
>  	ret = nlm_lck_blocked;
> -
> -	/* Append to list of blocked */
> -	nlmsvc_insert_block(block, NLM_NEVER);
>  out:
>  	mutex_unlock(&file->f_mutex);
>  	nlmsvc_release_block(block);
> -- 
> 2.31.1
> 

-- 
Chuck Lever

