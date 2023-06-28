Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A997415CC
	for <lists+cluster-devel@lfdr.de>; Wed, 28 Jun 2023 17:56:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687967761;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FzntaIMIEqZNLZogt7dvDGQ15SQo0lvSC9otQFCE6tc=;
	b=Zk5JuF8urMNessTywkNac7MnVj1+/aLpflZR2ZTQHE7IKWulP6ojgcEL1M3sj5OgUuMV+w
	eOZk+c1anF3WhhxVtnXGwkx7QBGXZodQbh7ZNLwSHDdZBmxCodbsryvpkVgAN+VhKygogB
	0gJSEEF8STFfrMxAIAx5SeNLU0YNYuU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-1bNIiRH0NHOujGEtL6FC1w-1; Wed, 28 Jun 2023 11:55:44 -0400
X-MC-Unique: 1bNIiRH0NHOujGEtL6FC1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF7BF2800C3E;
	Wed, 28 Jun 2023 15:55:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E37940C6CCD;
	Wed, 28 Jun 2023 15:55:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 407781946587;
	Wed, 28 Jun 2023 15:55:18 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 595CC1946589 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 28 Jun 2023 14:14:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 36BC6111F3BB; Wed, 28 Jun 2023 14:14:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E0CA111F3B0
 for <cluster-devel@redhat.com>; Wed, 28 Jun 2023 14:14:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE51D296A62F
 for <cluster-devel@redhat.com>; Wed, 28 Jun 2023 14:14:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-130-YHa0f6vcMeKCdpyY1cE8Tg-1; Wed, 28 Jun 2023 10:14:04 -0400
X-MC-Unique: YHa0f6vcMeKCdpyY1cE8Tg-1
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 35SBA2tD002888; Wed, 28 Jun 2023 13:33:04 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdpqb3vap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jun 2023 13:33:03 +0000 (GMT)
Received: from PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 by DM8PR11MB5608.namprd11.prod.outlook.com (2603:10b6:8:35::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.26; Wed, 28 Jun 2023 13:33:01 +0000
Received: from PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::89a4:55ba:11f6:6b05]) by PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::89a4:55ba:11f6:6b05%7]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 13:33:01 +0000
From: Dragos-Marian Panait <dragos.panait@windriver.com>
To: stable@vger.kernel.org
Date: Wed, 28 Jun 2023 16:32:50 +0300
Message-Id: <20230628133250.1797254-1-dragos.panait@windriver.com>
X-ClientProxiedBy: VI1PR0102CA0079.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::20) To PH0PR11MB4952.namprd11.prod.outlook.com
 (2603:10b6:510:40::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4952:EE_|DM8PR11MB5608:EE_
X-MS-Office365-Filtering-Correlation-Id: 52ed4229-348e-40fb-6e5a-08db77dc31dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: rdvTyW/sOWnyWw3JAx7lUlaGKcOvoOY5ipzcwkh5Pbzpr6eLRV7TXKttJLBP2QxMZOVBy7w1NfINJwy8Ejli+jxR4yVN95qrwBNwZ1jlD3IxdycaSrGJIV6admT9KDGp20vQYby/Z8kAsOx6VP0EGytnuEXlMO7TVwzHU0EIhG6xdgLUYSvh8vMUiyiYV7rh5oQF+xuL2pPKODC5a3j1pE507Hm0HljFbOgScjt9oxqD+pps+VET3JYuouYr4UrfPSaSKppMieFBQYy2opWYwnficAq5Z5iEBhrWqQDOPY0OTEroeCc900D3JJgT70qe5B8J5+G24kFzbOSg4bg2NjiN+0Z990UwbduLGbJJjrlmJU5AF30mo0lxIljxzBnDXz7+FEPgWNh59DOq9/oo1CVcWCdIr2MrJLothVPpDLYZk/B4bq/+N1P2dLy1uEMnS3Gtn76uV39FcvsWk6DOqaKE+MA1oi6ZTvoh2tWRulk9sSY2/UoaihCcxm2s9g33nt82TbnCAu528adHpuYVxAPVJOREMDX1hZsb3i3m+Cjt87H2i0SKWSaquTQzH/fCb8GsHXVusJjRvPAabqriEm3Ujzorz2/IMuKLoclWTyqRwS08Vy5Cfouvs3nBtFy2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(396003)(39850400004)(376002)(366004)(451199021)(66556008)(66946007)(316002)(66476007)(6916009)(4326008)(478600001)(36756003)(8936002)(5660300002)(8676002)(1076003)(86362001)(54906003)(41300700001)(6486002)(2906002)(52116002)(186003)(6506007)(6512007)(6666004)(38350700002)(38100700002)(26005)(83380400001)(2616005);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uNbYzONA2d5flUmJB8Kw4OMy7a9q1SwYnayEtxhWCuWrFWrbifM5RkSp7q/F?=
 =?us-ascii?Q?8oWAaLv0rQtO5hcOA+gX+JJmqFV3Y9DG8TB1EIeUUwyqQ+XYZNyIls/9yOnh?=
 =?us-ascii?Q?Z8J1AkKUQT1wyk8BnqHOlb7opR2BqE/X4BJn4nGzgjvn+dfHAfhJ7kZLObNT?=
 =?us-ascii?Q?g9kHRelkJZo9c+U3bzYSfFzoPWvIcMKVsyfTGhPS8z06nms9xc+PJecFpafq?=
 =?us-ascii?Q?ziOzcnHb89GeOFSixpnpiiu4G36k4rJCJXvOwLdFr1iLjboQCWq1LNubqcxB?=
 =?us-ascii?Q?6MGZzic86fTPdKNwjaFAh3iHi2s8m2KrY3G7jd6fjQcvFMw4p0+jfu/vOgg+?=
 =?us-ascii?Q?1iR9X/TL8zycN6bbCcZSt449JQVU1o7dbxIspc+XBX882LRFzHe35prKdWNW?=
 =?us-ascii?Q?UapYv/s+okUSFDSXHKJwLFhbyF+3c82X1YHBXPMz+uIrB7/xFs+ldP7QV7fx?=
 =?us-ascii?Q?NTuvoR+6OiFhhCFmOTXJs8PhNMn3cYHRQ9C7zcxOMoMqBW/bHaKV1iqFFLvL?=
 =?us-ascii?Q?ADoZtg613kx6rjmkaVSD7ERUGHQ/0UH0/lrQfGuytgu/kyvuJCo7ciojilmv?=
 =?us-ascii?Q?hgOz12if+VavrCs6UIxcZV3yT8er0VnmGcFtWiwFVY4Kiqxes0JwSByIxRrr?=
 =?us-ascii?Q?NaqRaECmT6LzMnGi3EDzipd6hrPkwPVpUoQbYtcWI6Ab2w6kxWZZPdMaT+5s?=
 =?us-ascii?Q?z4moWx8rLQlxdHDM0+zuA0xSuJQzYIRciwM6zH0SwQwTtIkkP3OQok88ZM/p?=
 =?us-ascii?Q?qEUo0NaMF5OMcJcLJgS57rezWOGrpjbfdSqkLEXfkLVmUVKZOtK0yDZSoQ4G?=
 =?us-ascii?Q?AavGtbbLjAYkRp/6cpidF7XRNVxq+yvYWgiS7TmJjbjZmu2q7YF0SCTF/Myr?=
 =?us-ascii?Q?sJzb4Awdl/cdd35Pr+qWX9CWKolsUce16/PoB6wzcE5isJIYJKS5DcIpuLEP?=
 =?us-ascii?Q?lJ8C6o/2EENZ1QrCbOJ4/ujTt5aOx8j7WP372ogl01H0As4pEzG91YYdniip?=
 =?us-ascii?Q?JjqA2ChXKRo9uCspaMc4p97MPTz4F4kPl1CNMN2TUZfwtIAgyf8GGR5sRr67?=
 =?us-ascii?Q?7gkAX6eFaRcZW4IHKqNJ6QoFQ9hntSahZrfT2zICNE+49Kea8gs1mSsElUtK?=
 =?us-ascii?Q?gzWn/PpVeib1+sVt56ScQu39eC63uTmKmclcfyh7GrlGkHlmOUwURiRt34DL?=
 =?us-ascii?Q?C2isFdtlTKO8w1vK6scSdcHDxR3GhhPh6Gq9LKoJbYyOGn384KnnIPJvrQu2?=
 =?us-ascii?Q?iNEm48d0Q225avlm82QM7eP91IZi/qNfunJ2wDRTaDPMwAPkwd9sCO3ZYutm?=
 =?us-ascii?Q?NzhQiMGY6BTLZJgyPrIGn2oaWnZQHUPdNBLI/w5XDGStpQpaqb6m1Pfp0kH1?=
 =?us-ascii?Q?snyTfotCij6wkXljXBXRzyc/putoGgKQAXNorm79LG/C/WuXnUCyIh6F3Rgq?=
 =?us-ascii?Q?bkXu/1fv0QY/DEW8MxIB3U6A9MU7hyNS+h7KP/rOt1as9hclIxxjd8soka2y?=
 =?us-ascii?Q?vs441KCaVEBLBa5O8DyiS6M9d54HIVk+otRnwvtveFyzOiWcHx2x/ILc7F0x?=
 =?us-ascii?Q?5LdZAd1PrXuTqQvfPMEdZxiZDlsF/lC/MXtv/Kud297spJsVdLutSeXvSQ8W?=
 =?us-ascii?Q?fQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ed4229-348e-40fb-6e5a-08db77dc31dc
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 13:33:01.7572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQbyhJsPB1rVCuHr9pStMKtvx3pYaHH0lRNju1Ks9f++rTnLBcNi1w5SxYn+oJZKz458oPoUQjeGgJlYo/fipJ51AbRt7hXYYqPLO9CFArM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5608
X-Proofpoint-ORIG-GUID: AD3tY-fg8X_QLKXArQrCXSLZwapYUkEm
X-Proofpoint-GUID: AD3tY-fg8X_QLKXArQrCXSLZwapYUkEm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_09,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 mlxlogscore=820 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306280120
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Wed, 28 Jun 2023 15:40:45 +0000
Subject: [Cluster-devel] [PATCH 4.19] gfs2: Don't deref jdesc in evict
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
Cc: cluster-devel@redhat.com, Yang Lan <lanyang0908@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: windriver.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Bob Peterson <rpeterso@redhat.com>

[ Upstream commit 504a10d9e46bc37b23d0a1ae2f28973c8516e636 ]

On corrupt gfs2 file systems the evict code can try to reference the
journal descriptor structure, jdesc, after it has been freed and set to
NULL. The sequence of events is:

init_journal()
...
fail_jindex:
   gfs2_jindex_free(sdp); <------frees journals, sets jdesc = NULL
      if (gfs2_holder_initialized(&ji_gh))
         gfs2_glock_dq_uninit(&ji_gh);
fail:
   iput(sdp->sd_jindex); <--references jdesc in evict_linked_inode
      evict()
         gfs2_evict_inode()
            evict_linked_inode()
               ret = gfs2_trans_begin(sdp, 0, sdp->sd_jdesc->jd_blocks);
<------references the now freed/zeroed sd_jdesc pointer.

The call to gfs2_trans_begin is done because the truncate_inode_pages
call can cause gfs2 events that require a transaction, such as removing
journaled data (jdata) blocks from the journal.

This patch fixes the problem by adding a check for sdp->sd_jdesc to
function gfs2_evict_inode. In theory, this should only happen to corrupt
gfs2 file systems, when gfs2 detects the problem, reports it, then tries
to evict all the system inodes it has read in up to that point.

Reported-by: Yang Lan <lanyang0908@gmail.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
[DP: adjusted context]
Signed-off-by: Dragos-Marian Panait <dragos.panait@windriver.com>
---
 fs/gfs2/super.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 3cc2237e5896..bb0eaa4638e3 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1586,6 +1586,14 @@ static void gfs2_evict_inode(struct inode *inode)
 	if (inode->i_nlink || sb_rdonly(sb))
 		goto out;
 
+	/*
+	 * In case of an incomplete mount, gfs2_evict_inode() may be called for
+	 * system files without having an active journal to write to.  In that
+	 * case, skip the filesystem evict.
+	 */
+	if (!sdp->sd_jdesc)
+		goto out;
+
 	if (test_bit(GIF_ALLOC_FAILED, &ip->i_flags)) {
 		BUG_ON(!gfs2_glock_is_locked_by_me(ip->i_gl));
 		gfs2_holder_mark_uninitialized(&gh);
-- 
2.40.1

