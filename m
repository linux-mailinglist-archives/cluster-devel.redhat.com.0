Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A478C788F50
	for <lists+cluster-devel@lfdr.de>; Fri, 25 Aug 2023 21:46:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692992796;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=jYcCJpzTnNbPAmPTHyUYkEHcpVlJRGE4FKapXMxpyYQ=;
	b=N0P3r7cGp/DPYMTnStyJSc+68qxF2IdUb3bnQFkDxOQglwNk0lU21o5cvqSwxBZDjHaZSB
	qP56tSUgkG/N6wBqXLnsHxEYtNxMltwqXFe/INjuAW7LYv/EUjZK/rmWF8jSys9uGxPz9d
	pRaCQhFT0090GUJcrlGieD80Ao7PrHM=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-4I3lwT7kMXy1yWkAwSq4cA-1; Fri, 25 Aug 2023 15:46:29 -0400
X-MC-Unique: 4I3lwT7kMXy1yWkAwSq4cA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4DA929DD99F;
	Fri, 25 Aug 2023 19:46:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A650EC1602B;
	Fri, 25 Aug 2023 19:46:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 50CEE19465B3;
	Fri, 25 Aug 2023 19:46:26 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8A35019465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 19:46:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 783F82026D76; Fri, 25 Aug 2023 19:46:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FB192026D68
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 19:46:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C0BB38008BA
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 19:46:20 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-lD08Qq8KOgOPoMGDiNJBWQ-1; Fri, 25 Aug 2023 15:46:16 -0400
X-MC-Unique: lD08Qq8KOgOPoMGDiNJBWQ-1
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37PGKOZI021135; Fri, 25 Aug 2023 17:21:20 GMT
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3sn1yvxtd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Aug 2023 17:21:19 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 37PGttnX036056; Fri, 25 Aug 2023 17:21:18 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3sn1yxm4ce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Aug 2023 17:21:18 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH7PR10MB7054.namprd10.prod.outlook.com (2603:10b6:510:276::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 17:21:15 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::2990:c166:9436:40e]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::2990:c166:9436:40e%6]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 17:21:15 +0000
Date: Fri, 25 Aug 2023 13:21:11 -0400
From: Chuck Lever <chuck.lever@oracle.com>
To: Alexander Aring <aahringo@redhat.com>
Message-ID: <ZOjjB0XeUraoSJru@tissot.1015granger.net>
References: <20230823213352.1971009-1-aahringo@redhat.com>
 <20230823213352.1971009-2-aahringo@redhat.com>
In-Reply-To: <20230823213352.1971009-2-aahringo@redhat.com>
X-ClientProxiedBy: CH0PR03CA0413.namprd03.prod.outlook.com
 (2603:10b6:610:11b::11) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|PH7PR10MB7054:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d56652b-5681-4cfe-479f-08dba58faf9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: azO/o52Be7H/QFALkF48SaZat3Dp2cc0ryYXSb3CuHozEZAv8VNZzoGwC6ozq4xcOQXyy7F/fMQmX8oZ3QxpB0YAQZ6R3l94PtmG2zAdaKmOeEGMzRwgf/XCukAzL0TQlQ9aES9d7goL9ybVAzNDJyIdzWTSUSUomX69Qfd6Jhs5oWTdex+pstqImXm/wNwcavOb7QY7jguL07KvweGsqTA7WfIS+X9BneVHvLcL0r1JWt3S/f8j6BuZ1gkA6CN+bqgh8oj7vtRrotlVe75MKW9qhdLxl5/GBNZTocXnwVKoO/a1bw6oJoED9sIJx4djJQXbjkZCd+VT1WCtBvTeCdudzW3g17gbgiR7NP6Ry2xTbL9pFnd+TrKVt+O6NYlG5ppA229WOFl5jJOXCCdCkrW7AMqxsJGH+6M4z1naXXBPAX8T8rXvbImRVG7eKKuM3m26pPNU/QH3mrlVXmpYuE351Jt4UDJh2qO+H1WqFkiDq7qyQCFDa6O44OdMweWDgGHZuGZIXvYx5WZlDwYSM0TW6an7QMN4wK79K/Rd3DpTjW3TJKQsbBTY1kLSJVsq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5128.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(366004)(346002)(396003)(451199024)(1800799009)(186009)(38100700002)(8676002)(4326008)(8936002)(6506007)(41300700001)(66476007)(6486002)(6666004)(316002)(66946007)(6916009)(86362001)(66556008)(6512007)(9686003)(478600001)(26005)(44832011)(83380400001)(7416002)(2906002)(5660300002);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QX4WyId6B6d9Ft1x8K4BW6UjlD/ZhlQp2GMLi4EV+pyy8HNVSpwjtJpadYpg?=
 =?us-ascii?Q?9wgswEgXLWbWA7gUV6hhJ6JjjFgdbEELmHJ2xjYPnZ8zAYF+BuO8FpKTWimM?=
 =?us-ascii?Q?z8350/d8P4VfURcWfNx/CiYin35eeXw86tFHR6wr8IrI+mItiQr8kCRHso4E?=
 =?us-ascii?Q?CxcXruj4IsCSgprLzQvLxsvq4tNd1PUlzrJdXI6iCCWa8EBhCdnQO0Xwwhfr?=
 =?us-ascii?Q?t5cI794jz/QBBRH7DdLEkkCKKLtnXNBvP/OBT3mTUvfBUgryEk6NsIbpFT9F?=
 =?us-ascii?Q?kON1tbJffRONHnYbk0IFWfQeNFfEJGtmT3I4+GNqod0Zm1jbe9iu0M7jzUK8?=
 =?us-ascii?Q?M2agY3jey0lGV7sznG8j27IY4gVZikRRblvVIZLQulF/dqLpUMxJX6W46iAo?=
 =?us-ascii?Q?gIba0L5zLijI3P7iMOlFkOwCp2bsgIjBLrfpoojr56moIWRhUuG92oCDBbOg?=
 =?us-ascii?Q?bymh2wIhOgdsDDryrZApImz8+3iXvPzjpLqdnhtWtydcV43GzG0C6wp7usAw?=
 =?us-ascii?Q?Uftala/gUc/ud3RaRLfceZ4I/mKPJWVdSvoPycDHhpgmxcfkODd8dievUE+r?=
 =?us-ascii?Q?QPbaS9oBtbIv+n4S8OBLeikrITkzzg6EGWDW+jOhlHBEzrPV072SeE3MqWG1?=
 =?us-ascii?Q?SNm4k9UPPbqsBqlpjiN98FETlbKxpt+SS6IgVosYCE58XrNIDDcgda7FFfby?=
 =?us-ascii?Q?Xe3cfLIbqY2rufGWStbMquxfDV/c3E+wzllbC03MsM1sdZwjKuHGF7hAVTSU?=
 =?us-ascii?Q?PNWQc1iQUYDxbF2i2VGjL6TfoOhLC+TkUDMr6cx0tIY9XOLIUSwng1ypn+DK?=
 =?us-ascii?Q?wy2Skosd1iZvf2nt3wZV9Hdq9j8g2OokzcVMEDsCNzZ6HQjiuRJXToAccJmX?=
 =?us-ascii?Q?tGkR41zRor9cdiPqsDonsxN3jbMCyY0hOfUYSs1G4LqNGdXZEPaNxIEnaK66?=
 =?us-ascii?Q?3szZgSwDfPvHprStw1FwCnqkqQPimTUWFosReJih9pP9ubkJk2kKaRhcOEiB?=
 =?us-ascii?Q?w0ujGWQZ9M+D05QeAH4viiFpRAzTwwY6NhhprKfIKJUhEvMxRV6ofSHknOif?=
 =?us-ascii?Q?Jy4S/OOYUnho0a8waLv7hlQcvOsCce71LtzZ84rsCKRlwRQD6DO+OF4mqJj0?=
 =?us-ascii?Q?Pcdd7sleL5vORapS6qfO6tpsD7SU5B/S6hkAFDpON7t6Vue/OMQRctAB+C/c?=
 =?us-ascii?Q?OA+KB+QNp+YLj53PARQUiuwEqr+W5sxeTJOZ4GecLWKHPf+WG8sqRems6VOg?=
 =?us-ascii?Q?pZkhxl7qL3KV0lNFFOKMTPKFY1bMBY9vo3WIZciOnMNnDWASvD6TLKDHBXn9?=
 =?us-ascii?Q?+m1D4YaUWXXgdtH1yIM0q0AhRL7+P2ZqG6eyFMxjCmGJclrSQ4UQIkx//xkf?=
 =?us-ascii?Q?U5wVjGTUeYE+Zqd3ceGgwq1Rz3Ps9f1FW5894w889bj7FjEQhEAOOJkdoymT?=
 =?us-ascii?Q?1kSohxOB1L4gJ3CB/jeFLO6MWSylUB5xHZrqd4qKXSGU7hukbUoYxS0Nmza4?=
 =?us-ascii?Q?OhaK64u4Tu+ZQzag7b88FDzy8gKoy05Zll5Xm6oYU2rtJehkh5uvLdJlnpBX?=
 =?us-ascii?Q?DY6IACEt0xQRCeNK3uu+DVIRvhr/Fc01uvdBkLVEDa4SZ5VedJgmgavc/Qyk?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 2wsgriSFKz77J4d6xW521Rsb7Wj3GiDoExmAHDe9SHPcm5NPCgh6PR2oE0wRBMbZcC81amXFhjEl8Os8T2T1n2TE4NQB9DRjJ+5yzxnLjOlpbaF4A2izn9vOX8t2W/JucAGBDmjh8RiGrJzAlmIUXsRRDjBmH/DRhEnXU86rOFibmMy40OlGRY2Lk5EUVI101mU79tIZKEGrmEEj/pkxzzbsg4baJ7nAl+pITFRn8BfmF2yIqJlfDNCyp5QL8sG9qlQ8HfDLPAtH0XFu7SA9fx+dV25iOk6f8LG72Mrv7LGJDzbyA2igYOjfRWxMbz4noh447EO4uUEhunFRuORuqUNlPdN4B9DEnWm0gJgq4Q43zgnRKzsdZqmHaVNJrLAYu1fUYNo+ylYy34nRd7KPnFgi5VC6UTU5N2cDGdD2wBfVrmSu32jjehQ2dDsKkKkIQqT/l499yD9CE7hjJw7LBJO4lUMZnBsKvLFjdGSEH7Ba/GiJ2xuKXgRjNi12ouVkRRxmKtdWhAbIaoGyfxNK6VvsbPEMYuQYxMLyPhV+LVzuKQ8WCQssT1r464n3FqH9sebIVuR1ZOXx64X48HpGMaMkinMGOGwxnc8wG4ZcvM+mOGZekw+M9Ef7taVxPDk3vVIGTdQkYS2pLcPaDpi6Fp0gLpdtmaJDSqEh6wCyQv83Mg+hnIKAQY7lYYplqgj5PmfvoLfw4SfoE6AsYL8zVWcEz2FcQaPm84aobqUWIYSuguVb/JoyDoCtCI5Yz6gXCMLx26dO4FRk7XT94Z+c9guAUD3AbWp5FLZnjQawJyNdf3F9lmZCX+cY+IjpjgX2GY/9ltx3YzYFApIAab8jouznUYP+urken3/sIXfvJn52nAuRRxGOnlG+C8WTsCBSFjAgL/TfgS0oSgNwlcP1nA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d56652b-5681-4cfe-479f-08dba58faf9d
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 17:21:15.0565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TR918Iap08J0MSbvcSeCsDMOwojJtEFDzWw+lbLwsXAAlSx4rZKm41Tk1V5FFdJEwmBSSJ4/go+6zRJ/t+CKQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7054
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_15,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 malwarescore=0 spamscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308250155
X-Proofpoint-ORIG-GUID: sjxUPjFGcLDwVese7SgWJzO_apJmn4ic
X-Proofpoint-GUID: sjxUPjFGcLDwVese7SgWJzO_apJmn4ic
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH 1/7] lockd: introduce safe async lock op
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: oracle.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 23, 2023 at 05:33:46PM -0400, Alexander Aring wrote:
> This patch reverts mostly commit 40595cdc93ed ("nfs: block notification
> on fs with its own ->lock") and introduces an EXPORT_OP_SAFE_ASYNC_LOCK
> export flag to signal that the "own ->lock" implementation supports
> async lock requests. The only main user is DLM that is used by GFS2 and
> OCFS2 filesystem. Those implement their own lock() implementation and
> return FILE_LOCK_DEFERRED as return value. Since commit 40595cdc93ed
> ("nfs: block notification on fs with its own ->lock") the DLM
> implementation were never updated. This patch should prepare for DLM
> to set the EXPORT_OP_SAFE_ASYNC_LOCK export flag and update the DLM
> plock implementation regarding to it.
> 
> Acked-by: Jeff Layton <jlayton@kernel.org>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/lockd/svclock.c       |  5 ++---
>  fs/nfsd/nfs4state.c      | 13 ++++++++++---
>  include/linux/exportfs.h |  8 ++++++++
>  3 files changed, 20 insertions(+), 6 deletions(-)

I'm starting to look at these. Just so you know, it's too late for
inclusion in v6.6, but I think we can get these into shape for v6.7.

More below.


> diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
> index c43ccdf28ed9..6e3b230e8317 100644
> --- a/fs/lockd/svclock.c
> +++ b/fs/lockd/svclock.c
> @@ -470,9 +470,7 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *file,
>  	    struct nlm_host *host, struct nlm_lock *lock, int wait,
>  	    struct nlm_cookie *cookie, int reclaim)
>  {
> -#if IS_ENABLED(CONFIG_SUNRPC_DEBUG)
>  	struct inode		*inode = nlmsvc_file_inode(file);
> -#endif
>  	struct nlm_block	*block = NULL;
>  	int			error;
>  	int			mode;
> @@ -486,7 +484,8 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *file,
>  				(long long)lock->fl.fl_end,
>  				wait);
>  
> -	if (nlmsvc_file_file(file)->f_op->lock) {
> +	if (!export_op_support_safe_async_lock(inode->i_sb->s_export_op,
> +					       nlmsvc_file_file(file)->f_op)) {
>  		async_block = wait;
>  		wait = 0;
>  	}
> diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
> index 3aefbad4cc09..14ca06424ff1 100644
> --- a/fs/nfsd/nfs4state.c
> +++ b/fs/nfsd/nfs4state.c
> @@ -7430,6 +7430,7 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
>  	struct nfsd4_blocked_lock *nbl = NULL;
>  	struct file_lock *file_lock = NULL;
>  	struct file_lock *conflock = NULL;
> +	struct super_block *sb;
>  	__be32 status = 0;
>  	int lkflg;
>  	int err;
> @@ -7451,6 +7452,7 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
>  		dprintk("NFSD: nfsd4_lock: permission denied!\n");
>  		return status;
>  	}
> +	sb = cstate->current_fh.fh_dentry->d_sb;
>  
>  	if (lock->lk_is_new) {
>  		if (nfsd4_has_session(cstate))
> @@ -7502,7 +7504,9 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
>  	fp = lock_stp->st_stid.sc_file;
>  	switch (lock->lk_type) {
>  		case NFS4_READW_LT:
> -			if (nfsd4_has_session(cstate))
> +			if (nfsd4_has_session(cstate) ||
> +			    export_op_support_safe_async_lock(sb->s_export_op,
> +							      nf->nf_file->f_op))
>  				fl_flags |= FL_SLEEP;
>  			fallthrough;
>  		case NFS4_READ_LT:
> @@ -7514,7 +7518,9 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
>  			fl_type = F_RDLCK;
>  			break;
>  		case NFS4_WRITEW_LT:
> -			if (nfsd4_has_session(cstate))
> +			if (nfsd4_has_session(cstate) ||
> +			    export_op_support_safe_async_lock(sb->s_export_op,
> +							      nf->nf_file->f_op))
>  				fl_flags |= FL_SLEEP;
>  			fallthrough;
>  		case NFS4_WRITE_LT:
> @@ -7542,7 +7548,8 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
>  	 * for file locks), so don't attempt blocking lock notifications
>  	 * on those filesystems:
>  	 */
> -	if (nf->nf_file->f_op->lock)
> +	if (!export_op_support_safe_async_lock(sb->s_export_op,
> +					       nf->nf_file->f_op))
>  		fl_flags &= ~FL_SLEEP;
>  
>  	nbl = find_or_allocate_block(lock_sop, &fp->fi_fhandle, nn);
> diff --git a/include/linux/exportfs.h b/include/linux/exportfs.h
> index 11fbd0ee1370..10358a93cdc1 100644
> --- a/include/linux/exportfs.h
> +++ b/include/linux/exportfs.h
> @@ -3,6 +3,7 @@
>  #define LINUX_EXPORTFS_H 1
>  
>  #include <linux/types.h>
> +#include <linux/fs.h>
>  
>  struct dentry;
>  struct iattr;
> @@ -224,9 +225,16 @@ struct export_operations {
>  						  atomic attribute updates
>  						*/
>  #define EXPORT_OP_FLUSH_ON_CLOSE	(0x20) /* fs flushes file data on close */
> +#define EXPORT_OP_SAFE_ASYNC_LOCK	(0x40) /* fs can do async lock request */

We haven't been good about this recently, but the addition of new
EXPORT_OP flags need to be accompanied by updates to
Documentation/filesystems/nfs/exporting.rst.

I will see about adding documentation for other recent flags, but
please include an update to exporting.rst with this patch.

I'm not sure we need _SAFE_ in the flag name. Would
EXPORT_OP_ASYNC_LOCK be OK with you?


>  	unsigned long	flags;
>  };
>  
> +static inline bool export_op_support_safe_async_lock(const struct export_operations *export_ops,
> +						     const struct file_operations *f_op)
> +{
> +	return (export_ops->flags & EXPORT_OP_SAFE_ASYNC_LOCK) || !f_op->lock;
> +}
> +

I'd like some cosmetic changes to this API, since this seems to be
the first utility function for checking EXPORT_OP flags.

- The function name is unwieldy. How about exportfs_lock_op_is_async() ?

- Break up the long lines. It's OK with me if the return value type
  is left on a different line than the function name and parameters.

- This function is globally visible, so a kdoc comment is needed.

- The f_op->lock check is common to all the call sites, but it is
  not at all related to the export AFAICT. Can it be removed from
  this inline function?


>  extern int exportfs_encode_inode_fh(struct inode *inode, struct fid *fid,
>  				    int *max_len, struct inode *parent,
>  				    int flags);
> -- 
> 2.31.1
> 

-- 
Chuck Lever

