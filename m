Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E6161449743
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Nov 2021 15:55:45 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-BfGsbuQ4M9u_FarVUqizIg-1; Mon, 08 Nov 2021 09:55:41 -0500
X-MC-Unique: BfGsbuQ4M9u_FarVUqizIg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09B281015DA4;
	Mon,  8 Nov 2021 14:55:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C77A5F4E9;
	Mon,  8 Nov 2021 14:55:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 84A454A703;
	Mon,  8 Nov 2021 14:55:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A8EtQuX027194 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Nov 2021 09:55:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1504F40CFD11; Mon,  8 Nov 2021 14:55:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F03340CFD0C
	for <cluster-devel@redhat.com>; Mon,  8 Nov 2021 14:55:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6891106655E
	for <cluster-devel@redhat.com>; Mon,  8 Nov 2021 14:55:25 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
	[205.220.177.32]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-124-rBr3G1AeMP6IRfrX8rCgeg-1; Mon, 08 Nov 2021 09:55:24 -0500
X-MC-Unique: rBr3G1AeMP6IRfrX8rCgeg-1
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id
	1A8DvNCl029335; Mon, 8 Nov 2021 14:55:23 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by mx0b-00069f02.pphosted.com with ESMTP id 3c6sbk3c6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Nov 2021 14:55:23 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A8EpxUl129706;
	Mon, 8 Nov 2021 14:55:22 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
	(mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by aserp3030.oracle.com with ESMTP id 3c5frcdpu5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Nov 2021 14:55:22 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
	(2603:10b6:301:2d::28) by CO1PR10MB4436.namprd10.prod.outlook.com
	(2603:10b6:303:91::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11;
	Mon, 8 Nov 2021 14:55:21 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
	([fe80::d409:11b5:5eb2:6be9]) by
	MWHPR1001MB2365.namprd10.prod.outlook.com
	([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4669.016;
	Mon, 8 Nov 2021 14:55:21 +0000
Date: Mon, 8 Nov 2021 17:55:06 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: rpeterso@redhat.com
Message-ID: <20211108145506.GA10167@kili>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0005.CHEP278.PROD.OUTLOOK.COM
	(2603:10a6:910:16::15) To MWHPR1001MB2365.namprd10.prod.outlook.com
	(2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0005.CHEP278.PROD.OUTLOOK.COM
	(2603:10a6:910:16::15) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
	id 15.20.4669.11 via Frontend Transport;
	Mon, 8 Nov 2021 14:55:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e43e677-9513-434d-0211-08d9a2c7c962
X-MS-TrafficTypeDiagnostic: CO1PR10MB4436:
X-Microsoft-Antispam-PRVS: <CO1PR10MB4436017307BE604FA58CEEB88E919@CO1PR10MB4436.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: 0RJuYrhD1y/trZwTisM17gpN1fqwZTVCh6f2HsvU5b4WP27/f0rKAjyUXROS0o7j74dJSIa8Vzp9Per1q1neelbZL5wpEGWIbJ0P6L72lrso3DW4LDXJ+5uJn+plaWmAtNUBV6sBwbs6Cd5LqeUs4CiMVwVE4/IBP6i54IqbZTFbzgiEx9oq6JVm6DtHXDMAcHvB0yDYr4Izfrs4mEumn5A/BJn+nhuKPHKnnIiwbWEwzqoKAy8/+ys/N3lp+J4KK3gmP4HHs7QW0vfPnJBlBtmynte95vIGeUhL9IIufvU5svd0f5IuG//l60Uns7xrqdXljt9/oxcvCA7IjcyTKvLPcPKbbJS2xFDqdvHDiEOHC8Vno0A+fWqFFHbo3JfAGU2teRJ6iAVHdDar2nbalMvnCFOWT5DxofKc+Ns/uIxzknNAx8UE7uQa1q6kcS18IcJaPzmxL1KOBOEEs2+j7NY343kf0E0q+4DSAydmluPYY2BMbGoNxdoRcX0poSAIaUXuOi6aHMYzLegUTdfU7STu1jWcArxOx7ebYWKVIeAQcdaBaRZ6++0XZn2AlLfpS1ezQ0hYhX24J+y7TB0+RWOAr8XvEY2qPwv6kHuF2uxjubDy7bos0qC6Ir7zSFGNkstVphJuOSvdSHCLbDRTJoupn/0KRVgP6aUyQ8+pNBzAEWBkbzw0Bwu/HX4oiNQRzmCTkvc8e9ItxeLZyQ/5Hw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(55016002)(6496006)(52116002)(33656002)(2906002)(450100002)(9686003)(8936002)(5660300002)(316002)(38100700002)(38350700002)(508600001)(8676002)(26005)(4326008)(6916009)(86362001)(186003)(83380400001)(956004)(66946007)(1076003)(6666004)(33716001)(44832011)(9576002)(66476007)(66556008);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1aZQPCSrDGtZdYHaYmo1MfArMzwvH3BeTCJtSvEsZtOBm3Cwc4PUgkwrgufK?=
	=?us-ascii?Q?8xOAdyh8JTTG9nKm9BV63PY1TjBwCLS5Wv8Q8n//0hOG/hhrNiH3zTO6sdL2?=
	=?us-ascii?Q?bjs7Rc3XXIJ4MYxB8P9amA+0LEd6nl3W5fJ3NTJYKe68FsCEm1z+BdMaFt+u?=
	=?us-ascii?Q?LShBDbK5Hk01FONtwAn9R8SgkN5Sx5R+2emwJkyzttzml95cNfnQ3K9FjUrP?=
	=?us-ascii?Q?fmN4q4Fu0HlySBXa5pzLQ9eVXiqsHrOhrMpVei1F0dZ7fZqHvKgeATmzY9Yn?=
	=?us-ascii?Q?0Wrrl+1J7EgjMGvMKszkMC5bD0qFO/HJa0PhDZG50D/0gMS0xRit7zsnWNCO?=
	=?us-ascii?Q?NfHtngYkhJhq/PPl7MfVTBWckL6W5fL6y1TmzTmQjeCf5Wua+LyTTwvRI+vw?=
	=?us-ascii?Q?39vcEeZ9Aq4YEGPAm8hyOsGKI+TXv3VF0P5AceWptnIQpADmwkGZbNTvX/hf?=
	=?us-ascii?Q?YweCD2tb2dnqD0diUDf39UQOekrW7yGP9bHeb1b6cgcdy5KSitlVIAm6qQDv?=
	=?us-ascii?Q?nEX4kL1LLcKf5zOqKlCAROXr54c4mniA+O+rDE/LtLhv5iaaDiqlvSApuHhc?=
	=?us-ascii?Q?Qfbbw8faNt7btJjqm1xvePoaW1dsBCNcYa73zdcojN5QHp+hue1Yt+4oNGwp?=
	=?us-ascii?Q?b+NSKJNJlHXomhBUi+9LpIxR2w2BkAAN1pNuKcKCHvkvgMABopVJf9RKS0Qo?=
	=?us-ascii?Q?2vngZUobZKuUevUWDZ27q78nsLoeHEKnhpnYhH3ohxtC6dgeSLgsIPQIi1uQ?=
	=?us-ascii?Q?oxxcpyZb9WTzV6LZaKUJJ+HjpWQVLRyYpGt8Ut9JMR3ztMY/jTNFZBoKDUMr?=
	=?us-ascii?Q?CUaniPkzX/oiDHqL5fscdbQmTEGOHrVmPbrjdwwo0t7RJkIABNeIlma7liyD?=
	=?us-ascii?Q?RdAhxR66KHUwsYUNd2yXN0cxnfRIZOPZihRWIqLoSJtK5JwvuuwNzMkdhLxm?=
	=?us-ascii?Q?8Bxd1jgOWQyKXhwBILMkEfXf+iCe38oNUW+sP45wfl64He0QzKCTBItGWIGR?=
	=?us-ascii?Q?eA0L3BkvfJkXx4oFfh2YyVI1Aj/yzAtXU+G1jMN1KskGluC1yuom8FRcyLrT?=
	=?us-ascii?Q?SkXIioI/YqNHjt7mDz2hQIacdrh71Tgfml/cqf81YhFIg3PACXpdcb2g8TLX?=
	=?us-ascii?Q?xAqw3e0ymw/Ct/2LzP917lxH1Hz3GH43tEzI/G/ZtyNLTFKQMEi+1m3MUdCI?=
	=?us-ascii?Q?O+lGloqhjcsyS98i0cbJY8nFflOHYOLos62wR+VXoL7BwcQedSGfg93xn9tl?=
	=?us-ascii?Q?Zk+J0dZBYi2XgwAufzdGatuD9fwslPm/caUD5XUNl2V/UVjyaqf7uXzTIzts?=
	=?us-ascii?Q?WWpmcz5vJWwVetD3GvE/mxiiBcm5tYLvPFMXHkX2z3VZqUwNlsWUSEVG+fTt?=
	=?us-ascii?Q?k3byWAIRpdTfU8NGWu7Bw4ICLwPjLDgC8Lmicp1gYjOV1PomrqsTEMVkAf1t?=
	=?us-ascii?Q?4UkkMQuVRkAUM3CCL2shMdR/MBrde98hFQISHQo2hjf2QA9yfHllUyMG5Bvv?=
	=?us-ascii?Q?61cEpQZzXNSBdcxS7/tjwqAgkm53TEwhKiL2fSnqN5pwzUj9zmA1q64gwdOF?=
	=?us-ascii?Q?j/ko/3fB67oOMzg8c6QHN9/KDxq6ahySkJrMgNCrjPQckrW8YS9yGJXmXEQn?=
	=?us-ascii?Q?GBsCDmmaLMUV+qIAD/Qb4poGW6nYac6kT/sU8o1cCrDp/siIIHGHljvLiIFn?=
	=?us-ascii?Q?fLzKDfGo5A5TZVDbmhQI4A0V1es=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e43e677-9513-434d-0211-08d9a2c7c962
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 14:55:21.1590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6L6WpWOHg1KWhcyN3X+7XmxF/gGnmqng7JhycoYzyVQp7S4EVcSrBQnOdb7X/NtvEAbWOLvse2hvuK2xqdM3Ixz7x7508foXwVOGf9d8oM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4436
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10161
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=748
	mlxscore=0
	suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2110150000 definitions=main-2111080092
X-Proofpoint-GUID: RXRqm_-BXygO9RswYzczl7FP3UdDLG5K
X-Proofpoint-ORIG-GUID: RXRqm_-BXygO9RswYzczl7FP3UdDLG5K
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [bug report] gfs2: Introduce flag for glock holder
	auto-demotion
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Bob Peterson,

The patch dc732906c245: "gfs2: Introduce flag for glock holder
auto-demotion" from Aug 19, 2021, leads to the following Smatch
static checker warning:

	fs/gfs2/glock.c:421 demote_incompat_holders()
	warn: iterator 'gh->gh_list.next' changed during iteration

fs/gfs2/glock.c
    411 static void demote_incompat_holders(struct gfs2_glock *gl,
    412                                     struct gfs2_holder *new_gh)
    413 {
    414         struct gfs2_holder *gh;
    415 
    416         /*
    417          * Demote incompatible holders before we make ourselves eligible.
    418          * (This holder may or may not allow auto-demoting, but we don't want
    419          * to demote the new holder before it's even granted.)
    420          */
--> 421         list_for_each_entry(gh, &gl->gl_holders, gh_list) {
    422                 /*
    423                  * Since holders are at the front of the list, we stop when we
    424                  * find the first non-holder.
    425                  */
    426                 if (!test_bit(HIF_HOLDER, &gh->gh_iflags))
    427                         return;
    428                 if (test_bit(HIF_MAY_DEMOTE, &gh->gh_iflags) &&
    429                     !may_grant(gl, new_gh, gh)) {
    430                         /*
    431                          * We should not recurse into do_promote because
    432                          * __gfs2_glock_dq only calls handle_callback,
    433                          * gfs2_glock_add_to_lru and __gfs2_glock_queue_work.
    434                          */
    435                         __gfs2_glock_dq(gh);
                                ^^^^^^^^^^^^^^^^^^^^
This calls list_del_init(&gh->gh_list); which sets the ->next pointer.
So I think that means we could hit a forever loop situation looking for
the original &gl->gl_holders list head.

Should it use list_for_each_entry_safe()?

    436                 }
    437         }
    438 }

regards,
dan carpenter

