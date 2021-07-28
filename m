Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 061103D89CC
	for <lists+cluster-devel@lfdr.de>; Wed, 28 Jul 2021 10:32:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-kK-jkdkrM2-DVMwCrDyM4w-1; Wed, 28 Jul 2021 04:32:00 -0400
X-MC-Unique: kK-jkdkrM2-DVMwCrDyM4w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC3E787D546;
	Wed, 28 Jul 2021 08:31:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77F0C10495AD;
	Wed, 28 Jul 2021 08:31:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE1F2180BAB1;
	Wed, 28 Jul 2021 08:31:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16S8Vnp2015527 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 28 Jul 2021 04:31:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 97EA32063FE4; Wed, 28 Jul 2021 08:31:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 914602077FAD
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 08:31:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4976B800882
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 08:31:46 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
	[205.220.177.32]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-551-MuTuAqChNlWCYKzvKlObpg-1; Wed, 28 Jul 2021 04:31:44 -0400
X-MC-Unique: MuTuAqChNlWCYKzvKlObpg-1
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
	16S8QniH028267
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 08:31:43 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by mx0b-00069f02.pphosted.com with ESMTP id 3a2353bth8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 08:31:43 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	16S8PlYv026865
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 08:31:42 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
	(mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by aserp3030.oracle.com with ESMTP id 3a234byvwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 08:31:42 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
	(2603:10b6:301:2d::28) by MWHPR10MB1950.namprd10.prod.outlook.com
	(2603:10b6:300:10d::12) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29;
	Wed, 28 Jul 2021 08:31:40 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
	([fe80::5820:e42b:73d7:4268]) by
	MWHPR1001MB2365.namprd10.prod.outlook.com
	([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.032;
	Wed, 28 Jul 2021 08:31:40 +0000
Date: Wed, 28 Jul 2021 11:31:29 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: cluster-devel@redhat.com
Message-ID: <20210728083128.GA22963@kili>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: LO2P265CA0485.GBRP265.PROD.OUTLOOK.COM
	(2603:10a6:600:13a::10) To MWHPR1001MB2365.namprd10.prod.outlook.com
	(2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (2a02:6900:8208:1848::11d1) by
	LO2P265CA0485.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:13a::10)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18
	via Frontend Transport; Wed, 28 Jul 2021 08:31:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ea13946-61bb-482f-0bed-08d951a21f49
X-MS-TrafficTypeDiagnostic: MWHPR10MB1950:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1950F62C5E865AA7FB5F50CE8EEA9@MWHPR10MB1950.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: ztHOJ3w0YnTTBTFeFKeRAUt9oIUBZlp+KqXgzzUHAtcwZOm+gApF3U8S9nZl7U8Zs8kYbg+t01hd50H2n5PrUrpt9A6UzVS4xdIRqyl8iWpyRweB1LBzdEuZmmqNPpAPpXPYCL/c7PseOZW0KL0raay6g7It7m25IOvms3AyOAjXa+3/PQPslz5FAblvoNdDMJWWCMgP1ryJQgx4IfvIRDBL7g5alqPfU7AQvMTlj61TUYlox24v2kV3ckZdTNK1qVWifxMxrVMPS9zrfQsAjG0Wd9R9ma4DIblna7P2hLELCVC2pAJIF87B7CTllgS8K6m5jbr9X+YWtnwqZlxOR63EpdHDjlk0Gpr/VAEIopPkK/pSZ4gNgT4rrNQ73eVgC9M5AxcdTOJ/WABlL9Q8MoipTqhDIS8s+zhIagtZJf+5mG52uS4Cq/0Ro/beEZkzBwAu7Z0UuwMHe3MS0nIB+gbbCPIAnFYlHZy87HfQ+KjXde0Ek/bm+WGVCXfZJRYsxB1KjavygqVUA3nTMacERqsISdr95GHcWPKWnMegHUUyV1w4nUhX15tFiBVAKN8zvBSNhgqLfjKvwPROkQNveUGQdkgY/nt53tCzvZWq3JDbLz1JSZSkL3/txVR3A2Zm/1ipFOsxJ1DNfme9nDFIug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(39860400002)(396003)(136003)(346002)(376002)(316002)(9576002)(6916009)(83380400001)(33656002)(8936002)(52116002)(6496006)(186003)(44832011)(8676002)(478600001)(38100700002)(5660300002)(1076003)(9686003)(55016002)(66476007)(86362001)(66556008)(66946007)(6666004)(33716001)(2906002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nLSWCh8pqZW7uPDupiXm95UYtsQdCkaJzhohb/fSjuhMPuN16YA5efAd4kR0?=
	=?us-ascii?Q?zVPspARBuD9kV4xHYgbH8zOvuj2Kp8taYKCht1B0wGEaWxoGjEHnjL4SaTfG?=
	=?us-ascii?Q?8GbxaP3YuzI25Mc9CKKQyqGvcCW69y73VovITIBq1AMbPSxBHdkQXiMlQh2j?=
	=?us-ascii?Q?aARQB+QraRmg4k09lha4mV801RQUrWrXMSDQCp+N3F+OsCbWtwkYv5J9HfiP?=
	=?us-ascii?Q?NBj1aQRxv8nSrTVUa8hTDNBlTZLdEgRVNb6rjXP42ijO+qZxkoqcThjKWd1Y?=
	=?us-ascii?Q?pA5gXW4AqArYxs6hNaAJMIrib8gDOqjpNCg9sDqBnp7Eujk34i4JFaj/c9up?=
	=?us-ascii?Q?feOqVrWC7IfvwWBxcpvTtqHnHo+ClPtTVICjWax4w4hqCdjgVFSsUC2Wp6lm?=
	=?us-ascii?Q?XV73e29A4+Bo+1U2T+5ZTpl1AaEbgpzquLpHXH82MlUUa8HsXNe5rXfcSFrv?=
	=?us-ascii?Q?2rfEIF8kcRMQngZJKjHCoElkH+A6aRdUPIPRqXppKXOErwGFgdnFay4a6bEf?=
	=?us-ascii?Q?jJvabK++gHqaMYISNFck6WLXqKHfQx6Uy/6JwxkBVmr+C3KrR9zUDF7dKzVO?=
	=?us-ascii?Q?tAIgB0ebOIvXc1R0s7XuuE2sJaO0IxMVt0OYx/qwq2yPBGdONUWjxKNQwOhW?=
	=?us-ascii?Q?6v7ZTCfymcQuGIpCEoNtWHXrv7DqJBq9hnqbgdqPr8pmOBKtxQB9A/9CYQnD?=
	=?us-ascii?Q?yARE4eLlv7bS/alcsdHJ7ZoM4YlHayD4tYOB94FUB/om0nTXjGPHpxw8DbOq?=
	=?us-ascii?Q?3TuDcvQraa2run0FJBwzs5ycHi+EbLNJtWbtoZUfGoidtklZim7fUt2xJ+zt?=
	=?us-ascii?Q?3SOVT38JvS2+WgPYgD6pKYSrF3RfuI9BFVXwT7igN2awSfN7YkfcQM7e3jYA?=
	=?us-ascii?Q?KAe0F5KQBCg2HgzG5caPpgBPniIfukdr+dvqHL0PBkh4IpctJemdqQzjpeCL?=
	=?us-ascii?Q?2qNsSxXS65cBGUd6nT9/kdrcYWAcN7dEomU7cP45EvOIn0ZvjlnGj7onW1d+?=
	=?us-ascii?Q?Dzhd3Gab9zE1YkfyRQ1WDQwdjDaIZdpdOj7Fjf0yNDUrR0782tQaCSSasBEF?=
	=?us-ascii?Q?4GhsvGtUoLlc8dWOSJZUSZr+abBj6O32milAaZy5Z2iuFd6yJe++1tY7Rb/m?=
	=?us-ascii?Q?6YBQy+rjezWK0Mqk3mp94xdFzRJAeKwM3hDEawQH3KqKYLr9k6+DXvlTXThI?=
	=?us-ascii?Q?1r5A8/ED2LZbt256xkjbt/GrHe9uW989wvzTtbIWnT6zv4qPl8/6/crazme3?=
	=?us-ascii?Q?63AXS5s5YW3ksl3Jp/N2JkrwlTffPt4/pc29pZz6SIB16vLpxS7RSuxh5HlY?=
	=?us-ascii?Q?b+q8ShqbZzXZf+aTh4VVcKQt5zXuA8AZjAWeFI7uj1d2cAPCqvRNLB8PG/v2?=
	=?us-ascii?Q?2a56S5U=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea13946-61bb-482f-0bed-08d951a21f49
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 08:31:40.2397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOBCsun0UjYksVPPJ+aJSJ4Wt2ULAHDBN9BYPtoI3teX75FbwzF470loCCEeGvKcmVHBJTy5JNgvhcd7/4u32I9DR+mAushYxxCoPhsHGUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1950
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10058
	signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
	phishscore=0
	suspectscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 mlxscore=0
	malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2107140000 definitions=main-2107280047
X-Proofpoint-GUID: NoqbqG-D5PPFFgVSDZmWRtFFYR_IwcUH
X-Proofpoint-ORIG-GUID: NoqbqG-D5PPFFgVSDZmWRtFFYR_IwcUH
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [bug report] GFS2: Fix bug-trap in ail flush code
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi GFS2 devs,

This is 10 year old code, but it looks suspicious and hopefully the
recovery code doesn't get testing very often in runtime.

The patch 75549186edf1: "GFS2: Fix bug-trap in ail flush code" from
Aug 2, 2011, leads to the following static checker warning:

	fs/gfs2/glock.c:1487 gfs2_glock_dq()
	warn: sleeping in atomic context

fs/gfs2/glops.c
    57  static void __gfs2_ail_flush(struct gfs2_glock *gl, bool fsync,
    58                               unsigned int nr_revokes)
    59  {
    60          struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
    61          struct list_head *head = &gl->gl_ail_list;
    62          struct gfs2_bufdata *bd, *tmp;
    63          struct buffer_head *bh;
    64          const unsigned long b_state = (1UL << BH_Dirty)|(1UL << BH_Pinned)|(1UL << BH_Lock);
    65  
    66          gfs2_log_lock(sdp);
                ^^^^^^^^^^^^^^^^^^
    67          spin_lock(&sdp->sd_ail_lock);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
We're holding a spinlock here

    68          list_for_each_entry_safe_reverse(bd, tmp, head, bd_ail_gl_list) {
    69                  if (nr_revokes == 0)
    70                          break;
    71                  bh = bd->bd_bh;
    72                  if (bh->b_state & b_state) {
    73                          if (fsync)
    74                                  continue;
    75                          gfs2_ail_error(gl, bh);
                                ^^^^^^^^^^^^^^^^^^^^^^
The gfs2_ail_error() function calls gfs2_withdraw() which can sleep or
the call tree that this is complains about is:

--> gfs2_ail_error()
   --> gfs2_withdraw()
    --> signal_our_withdraw()
        -->gfs2_glock_dq()

It's also very possible that this is a false positive...  Smatch doesn't
understand bit tests very well and especially across function
boundaries.

    76                  }
    77                  gfs2_trans_add_revoke(sdp, bd);
    78                  nr_revokes--;
    79          }
    80          GLOCK_BUG_ON(gl, !fsync && atomic_read(&gl->gl_ail_count));
    81          spin_unlock(&sdp->sd_ail_lock);
    82          gfs2_log_unlock(sdp);
    83  }

regards,
dan carpenter

