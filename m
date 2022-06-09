Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2715461C3
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Jun 2022 11:23:16 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-nYGsS0X6Mzi2r8QGE891yQ-1; Fri, 10 Jun 2022 05:23:07 -0400
X-MC-Unique: nYGsS0X6Mzi2r8QGE891yQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D9063C025D8;
	Fri, 10 Jun 2022 09:23:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C37D32026985;
	Fri, 10 Jun 2022 09:23:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4CC961947042;
	Fri, 10 Jun 2022 09:23:03 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 324031947040 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  9 Jun 2022 21:55:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C7A8740CFD0A; Thu,  9 Jun 2022 21:55:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C285740CF8E2
 for <cluster-devel@redhat.com>; Thu,  9 Jun 2022 21:55:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A69B3811E76
 for <cluster-devel@redhat.com>; Thu,  9 Jun 2022 21:55:52 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-f5lFCexRMAeHjw92qvKLNQ-1; Thu, 09 Jun 2022 17:55:51 -0400
X-MC-Unique: f5lFCexRMAeHjw92qvKLNQ-1
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 259J4EKT015600;
 Thu, 9 Jun 2022 20:51:32 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gfydqv4fa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Jun 2022 20:51:31 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 259KeeLe001402; Thu, 9 Jun 2022 20:51:31 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gfwu534g6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Jun 2022 20:51:31 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by PH7PR10MB5699.namprd10.prod.outlook.com (2603:10b6:510:127::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Thu, 9 Jun
 2022 20:51:28 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::2125:9bb7:bfeb:81f9]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::2125:9bb7:bfeb:81f9%8]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 20:51:28 +0000
Message-ID: <f05f20c9-9738-bc31-591e-743e0382f44c@oracle.com>
Date: Thu, 9 Jun 2022 13:51:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-17-willy@infradead.org>
From: Mike Kravetz <mike.kravetz@oracle.com>
In-Reply-To: <20220608150249.3033815-17-willy@infradead.org>
X-ClientProxiedBy: MW4PR04CA0047.namprd04.prod.outlook.com
 (2603:10b6:303:6a::22) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 075de71e-0c62-46d6-7522-08da4a59d369
X-MS-TrafficTypeDiagnostic: PH7PR10MB5699:EE_
X-Microsoft-Antispam-PRVS: <PH7PR10MB569989B5AF6555E18FDADC39E2A79@PH7PR10MB5699.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: ATu+kf6i3a8YOA+mbilpFf0sCSF3j6w3rNeZPbaoPg5XhPBki80zBNdaWhucYF3BTgtbToaYXlZUx7sKnRNMZKrODgbnmOSUUtYZIXhD78EQo1kVagRJ7JMBsZhm32ipUWR15O6voq/oDt4XsTdgLJ9QS4ivMGHJ1bwUEjv0vF3gNfEVJaKtJIRypm0E3ZKphzfW48KBYAnz05XwW3q1BxAzS/O0l+QQyjZrx1ROrQC6MC9bfbXNY8lSqAWR42rgofcgQ9x4xkIDqmWE7YYtxhpa3NCJDxoylxjb/y/VKBYd754lNJX+7e2qe/gvOks90EF9DDkw5+tE7uKoTdFzSDC3vGF+YVPb28JVhL7OkCQUSs8Nc/GkVwECqbc9zVJpE2RoccP59jkLbcp/b95L6fzYR3cP4RP8lveitwfrFZmPkdlIso6e7bIbbL4RXVNoBFVGYmaM8FWjKgDtH/1b7Ey7XYe+uJZV5vO0UGYH6tyODnsW2Qy/bM8BA+JS7dCeGrvalCeWNnc3Pb8SQ+z5R/YYn3GMZl5mF2azJgKXunuYU+RY1Czgqicq4Nz34lhb9MegT78NZ7AJRUhx9tNoJJtu84hP8qp1tLwBpiKU5WfixYLHme+R2fTu9ikNGo4pvii6GcaIB30OgLU9pCdkfueD7WJdzzJbU6S7MWRR5JJyPo+3XzUU+yKbjh7Dw2/Lk+Z5qiZ4lqJFnv3ze9Z8lfyqxJUAO7MEZeRcnFwhLeE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR10MB4196.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(44832011)(6666004)(66476007)(8676002)(66946007)(316002)(83380400001)(5660300002)(66556008)(4326008)(7416002)(86362001)(31696002)(2906002)(6512007)(26005)(8936002)(53546011)(2616005)(38100700002)(186003)(508600001)(6486002)(36756003)(31686004)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkNrU1JWa0IyOHhNVWhoUDhMUXN0am1IbTNQNmZHc2lrUTRKdG1hVjBMWGVS?=
 =?utf-8?B?a0l2MGU3UktvOW9vQjRCZmN1OW43YUYxaXE3dnR1R3h3clcrc3pFeTB4b003?=
 =?utf-8?B?ZXdUYi9SL2dGdGJtM3AwQk9DaWsxclBzVVBFOENsWlBJeXJUbWVJeE5lWGJo?=
 =?utf-8?B?cWRKYjN3Uklpd0dWMkxTSzJ6cXcxVFlnbitkYWdudlFZdWlOZmVORjBtWXhQ?=
 =?utf-8?B?MkdoOW1FRkpRNGlPdUQ5NkEzb090eUliK2lYRnV0Y1laWi9LRGR3citUekF5?=
 =?utf-8?B?c2g3LytMUW1FZXBqekhORFdFU0p2dnVvdHUxMHZaZWdMNFl4VVRQVUd1WExC?=
 =?utf-8?B?WXVNMlZUWWV3VGthUXoxUEZrNFdaSnJacm44aGMxczhIUHlobFlGVFYrWlFu?=
 =?utf-8?B?d2ZITkE4QnpJYXV4QmVlcjhUbFRxdFB0cy9YOGRyNkRaUlRBR1VTVU8zSXNp?=
 =?utf-8?B?WDRGcno5YWxBTDhKSW5pczNmN0FrOGdCYnArdFJxZmdIQXI4blk5aE1oQkZ0?=
 =?utf-8?B?S1NoVzkydFZJWE53TjF4QWg3dDJ1M3F0d1piZzA1ZnJzVkNsN0ovR2JOcEUv?=
 =?utf-8?B?OHNMbURzZUt5aFhDUzB1NmZCd0FRRnhHdTQvcXZSYzBsdFVhRnVGOXE1T3Q0?=
 =?utf-8?B?eGl6YzRFOEpWcXMxMU5ZNkdYWHFaOFl0eWpkZGhoUXFVZXAvSTJ6UEpkeEM0?=
 =?utf-8?B?cDVEUHB6UEpyYjEyelhtaDFKVUhwT0kvcTEzMHRJbS80OUF4OE15aGJTb1Rv?=
 =?utf-8?B?WXhEQTZ2c05mYmNQMWdIRXlya3l3SmFOdjhCM0Y1WVEzeHUyOU5kWGlBV05z?=
 =?utf-8?B?aWdISUhNMmo1cFpDc0wvNDl3YU1NTlE5WkdUVXNVek9vLzVKb1R0ZE05NVd1?=
 =?utf-8?B?UUs4SW5lVWdoQzlDWHduR0xWSUdvT0huZGNTcjFsS2dYWW8vbnRHQ0dPU3pM?=
 =?utf-8?B?ZmNUaEFYRDFKNEdXbWRIRWhpYkh0WWE0Q0pXUk5RMWNQT2ljckpxWjlVV1B2?=
 =?utf-8?B?bk8zQWdZeVdNd253NHMwUXZrMUxYcGZGRGc3Z0pNOEZUQnRiY3pyaDVDTjBt?=
 =?utf-8?B?Q2luck42U1lUS09aUExJN3N3SnNRdTRqd0R1WXczekFvbTNBd3k3dUJITVhT?=
 =?utf-8?B?aVYxaHdJQ2xjTEtvWjhSY21JeGhGZXdQWGZSZXR5U1lqWDZxdVNqOFk2VWR2?=
 =?utf-8?B?WU1KeENLM3FDdVFOdU9QTW00ck1yOTZINnFyK0lwa1hPZkJpVWJNT3ZCbXM3?=
 =?utf-8?B?R0FTRDB2US84TU56WS9rdGh4RzVTTGpERlBNS2pXODVVaStDSUJIc0Q1eTFY?=
 =?utf-8?B?dWJUSGNjcWVCTDV2MjZjTGlWNDhZclFYN05uQVF1UDkrNERLcGtKMnRVVTFI?=
 =?utf-8?B?RU5PS25mRlpMQWRjNG12azROK1liNkZSK0pyYnBTb1pUbUxxVFJwVS94VnBY?=
 =?utf-8?B?QkhCMG9xWWtGRS9HdjZvbk9BeVVIeHBzYituckYvbkRaRDFWMWlCYUMxb3U1?=
 =?utf-8?B?bG0yREdvT0NQUzlzNGgyWDE3N0hKVDgySEpmMWx0VFVqYUIwWXVvajdsUkNW?=
 =?utf-8?B?anZOZGlxWXpUV0lvK204UE5EOTB0WkRQTWF0bC9vRFJ0cTdwSTRQa3ZkUXdq?=
 =?utf-8?B?cElIV2pzdWVXWC9Leis1M2theC9MaDFqSXErNTcrUGdxRnhMb2V4U2dtcW9P?=
 =?utf-8?B?QUhNYW5sNWJxQk14SFNTZmYyU2lWV2sxd1VIOHJSU1hEUFlFQkJUa0tkaDFJ?=
 =?utf-8?B?WlVBdDBEN2Q1MGFmQVhoT0xtZERYOG1uc1dYeHpIMCtUdTFqL2UyNTd3citY?=
 =?utf-8?B?NExJYlFtN1NZVFhab1FjM0xLc1BxMmxMNFduenM0YnNPNGZEOUdHNmZXUnBG?=
 =?utf-8?B?WHh2VmxRWXBiSHFSSGcybEdLL2VUbW9aTmUrSjdXaXordVVMTkRpSUszMXly?=
 =?utf-8?B?NXd0aUhnQW9BZ0RmdVFxSUt4U0VrUzFFM2V3ejhFNGh0clhyQTNHVExFdWcz?=
 =?utf-8?B?QzZnZzhjeDRFaURVWkdGRXoxd1BrSXIzZDY0VW1lRkRZU3ZRUEUxazNQR0hl?=
 =?utf-8?B?TldEeFJMUUM5c3pvZjNoTnZzcVZKVmM3VVJBdkJudTRJdXhzL0dPZnFXSFFE?=
 =?utf-8?B?aFllL2tSMlF6TEdvSHppLzd1SWovWUltVWlkMGJQdDNkVmhaR3B2TWJHNlZ5?=
 =?utf-8?B?OVNEOWNCRzZCWDRTZGdkOUI0K0tmV2tJd0JVUFpiTC85dDVYMGVEakNEWmZ0?=
 =?utf-8?B?L1NsWU5BVUU5Uy9Oa3lKY2c0QURzU1B4RWVBOWNpQWJxZVpLdTRUcjRKSzdN?=
 =?utf-8?B?MFc3MkZUSTgyK2gxVjR0Q0hNYkpIQlNoanNlVWhFcGkvTG5NK3R6c0NaZ3dF?=
 =?utf-8?Q?BnKBw1SW4mmlvZXg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 075de71e-0c62-46d6-7522-08da4a59d369
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 20:51:28.7513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2u1pmY5xWxrnPy21ETxQek0CpzFh1IXmm0vUk1Ji4SBaVjLPlBG/RrtGx9HMPIOCAu176Y5z6ha2508o2xlNTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5699
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-09_15:2022-06-09,
 2022-06-09 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206090077
X-Proofpoint-GUID: 3vM0fDCxXuAEST9ERr7m89dz6funb3Pu
X-Proofpoint-ORIG-GUID: 3vM0fDCxXuAEST9ERr7m89dz6funb3Pu
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mailman-Approved-At: Fri, 10 Jun 2022 09:23:02 +0000
Subject: Re: [Cluster-devel] [PATCH v2 16/19] hugetlb: Convert to
 migrate_folio
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-ext4@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/8/22 08:02, Matthew Wilcox (Oracle) wrote:
> This involves converting migrate_huge_page_move_mapping().  We also need a
> folio variant of hugetlb_set_page_subpool(), but that's for a later patch.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/hugetlbfs/inode.c    | 23 ++++++++++++++---------
>  include/linux/migrate.h |  6 +++---
>  mm/migrate.c            | 18 +++++++++---------
>  3 files changed, 26 insertions(+), 21 deletions(-)
> 

Thanks,

> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
> index 14d33f725e05..eca1d0fabd7e 100644
> --- a/fs/hugetlbfs/inode.c
> +++ b/fs/hugetlbfs/inode.c
> @@ -954,28 +954,33 @@ static int hugetlbfs_symlink(struct user_namespace *mnt_userns,
>  	return error;
>  }
>  
> -static int hugetlbfs_migrate_page(struct address_space *mapping,
> -				struct page *newpage, struct page *page,
> +#ifdef CONFIG_MIGRATION

and, thanks for adding the #ifdef CONFIG_MIGRATION to save a little space.

Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>

-- 
Mike Kravetz

