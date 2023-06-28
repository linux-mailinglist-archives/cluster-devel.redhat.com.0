Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E7F74157B
	for <lists+cluster-devel@lfdr.de>; Wed, 28 Jun 2023 17:43:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687966990;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gjTr0f7M8QrExyM3qwuOHs4MhV9+18GMo9BLtPYtKZc=;
	b=V0lCZ10fZfEjDivZtomf/H8mByzTXEp/0ZM5LAzs2eFVM7Hw0iHkO6fo5+okhzHjHMg87y
	b9wraqddZNPp1Z6v/dgYx28w+TA8lhmgdaUgGz6Rda2WnjlEovWG38kMc2x1uQyI28XcwU
	y9fXRMNrubSJu5z595ZznbR4nsfqVyA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-CahD_1CiMqamEt5Wwao3TA-1; Wed, 28 Jun 2023 11:42:56 -0400
X-MC-Unique: CahD_1CiMqamEt5Wwao3TA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECC93185A7B1;
	Wed, 28 Jun 2023 15:42:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F0A9314682FC;
	Wed, 28 Jun 2023 15:42:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8097319466DF;
	Wed, 28 Jun 2023 15:42:33 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 57D791946589 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 28 Jun 2023 14:08:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EBB7540C206F; Wed, 28 Jun 2023 14:08:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3CD440C2063
 for <cluster-devel@redhat.com>; Wed, 28 Jun 2023 14:08:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C541287323C
 for <cluster-devel@redhat.com>; Wed, 28 Jun 2023 14:08:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-FODR0ITSM5ih3NiYGy5FVA-1; Wed, 28 Jun 2023 10:07:36 -0400
X-MC-Unique: FODR0ITSM5ih3NiYGy5FVA-1
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35SCUlCs019209; Wed, 28 Jun 2023 06:31:14 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdurxus7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jun 2023 06:31:14 -0700 (PDT)
Received: from PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 by IA0PR11MB7741.namprd11.prod.outlook.com (2603:10b6:208:400::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Wed, 28 Jun
 2023 13:31:09 +0000
Received: from PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::89a4:55ba:11f6:6b05]) by PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::89a4:55ba:11f6:6b05%7]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 13:31:03 +0000
From: Dragos-Marian Panait <dragos.panait@windriver.com>
To: stable@vger.kernel.org
Date: Wed, 28 Jun 2023 16:30:52 +0300
Message-Id: <20230628133052.1796173-1-dragos.panait@windriver.com>
X-ClientProxiedBy: VI1PR06CA0132.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::25) To PH0PR11MB4952.namprd11.prod.outlook.com
 (2603:10b6:510:40::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4952:EE_|IA0PR11MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: fae0fa03-0796-4de5-c93e-08db77dbeb85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: kUDM23D+7YJejxd068AF3kE/+vd2RRtLenI7FIunhdg5xWNJMQjHSjREINoYdr6t7H9UHkgn/AzqdYUgZ7lPR7zX0g8rN+MjQhiq8iHS7viCH/P/fUizqc/6REGYI28u7CPJiO5GcOxoeqeh9Gey3s20v5jnrHRnZofiG4e55g/DqM+zwjnIHvsdlS8TUq/c3x6iwrfxKIfCcUim6lDsu805t43WRATCeg7ND+GvThEcoiwmssuv0qNqHrLvzjxpHkvd7GCRZSkpZB1HuRJpAm99CG+CNlPtNr+B017S4HNh07qkTT8QD0Ue9CFDHMS1oW299hcnhImqAQR7PlRJoLCW/u/SnDy0o8K3gH/3ZBUuzkTYbhs7FjkKhC0ulo2fsFN/I//Ok7nFrFCpE91M7YkbSCJU+Q+U4Jwd7zjZNWeHShakfOEl0xl5IEWQA4xntqEcygX9MtAKF454N/XhEYS3UxhmaI7ur2Bl0XDuukLBpdhwJFp1N/59JbOQemO5wW0O2xr2QZVdTiOLqXiuC+QIlc9VO8NtaJxL8glcbsm/q4m1F6MI/tCmBsa0vSkVCCYL5mtT84UlNesCuXAD1LPWff+gO4xOf8oc7GFAqVC27UXInjwCQqDaxjhOnwSS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(376002)(366004)(39850400004)(346002)(451199021)(5660300002)(66946007)(66556008)(4326008)(66476007)(6916009)(478600001)(36756003)(316002)(8936002)(8676002)(2906002)(54906003)(41300700001)(6486002)(52116002)(186003)(38350700002)(86362001)(26005)(6506007)(6512007)(6666004)(1076003)(2616005)(38100700002)(83380400001);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ejK6V6eN3ubFX3Sd8ZEyOSDM1hUoVDqVhFphLEXR/aurpQg+1EHNj9Ymz5gg?=
 =?us-ascii?Q?gBS50cpTNDHAAo/ITNINDjHHKkkuVbKTwLNIP0AJZb4IOwHZPMF1UpKCXOyy?=
 =?us-ascii?Q?bbXOuVi4L1PIdvsOqo5NKGuPCmd3ArMwRgn/MjA2pwA5ChDJLUT6YUq8MBua?=
 =?us-ascii?Q?EbccsCblcd2Uf3OCRO7Ji/PMGsZLcjX9cIq1RWxP+znFm/f18BGqYu+puQ9r?=
 =?us-ascii?Q?no9jgIpQhqEUirn0LZ7ZVn3qSy4HZO1hqXg64HN6ARu4gQgj5CVXvK9cJDah?=
 =?us-ascii?Q?OWlGMi9KFkuKEoHey6s6WzPt3G8HiMwVLn30LOcot6KlAipWJxIlN1WxJc9J?=
 =?us-ascii?Q?b6sghgpJK84bK40YJrCjDh6bfT0DiPzzQCgwPgBXKlunRj5LJBjd2NHVvvQ8?=
 =?us-ascii?Q?FtMttrfjWpQe7jHqBqtIFBBvhU2R75KdjS+Y3ogttfCckNpGdpUqE5FGTpGQ?=
 =?us-ascii?Q?gvMO4Vo6EjGNo7plS8LyPVf/EqHxVdcA86HBSinioNfRShf2aQA1clJyzMVX?=
 =?us-ascii?Q?Z+cnBnIsdbnUgPlrwUNysid50SgLm/xQ+axbGpJDdWHPHaEHJexI6pfAoCmc?=
 =?us-ascii?Q?12rCbSCL8gq6hco+f0oGiiotm0kceDfty96nSM5OVmOXpUotILrFW15brMNI?=
 =?us-ascii?Q?sL9icvvHrmQtcEdv91pGQUFHR6sjWH3Kj7TC6M8L4iGqZrutaQvRy71L5QBx?=
 =?us-ascii?Q?/JKIjTtKu76Xjz/I2Fl2yix8xv5aztBECNMKwIkZq2G+vAR4fbU+LAgIUCba?=
 =?us-ascii?Q?siGj6fpEG451KBGHBXH+J+gmfDRUTrpKGlKOK+wSGNhgJpG0QNY6RTCS5FYw?=
 =?us-ascii?Q?rxg647b03vduF/5scA4zmwiddVWH5v4aTq2V2XCxtQx9MnW5fuum57bKw5GC?=
 =?us-ascii?Q?ZDpHqfaeoU+r+jkyEzJHDCrSHJP4SVisZxFl+kEiJMBnnaZySB+blMeeoJC2?=
 =?us-ascii?Q?TnVPb+4Xe3p4bAHwQmducOCeMlAUDpYNFv5o19yacd+sru44AREol3Bokw2z?=
 =?us-ascii?Q?kaj2RV9zFINm33VUfj/hD28h7K1+vGpMMje8bmNuD0sFFsCnRemuVrJduKis?=
 =?us-ascii?Q?wmsKJkyzl3f/qzSexnF5t8ca7YAnuOF1c26P1gHLLVqC/ygimpyLJ2cH+sZz?=
 =?us-ascii?Q?hdIKRSHhu4vNFqQl/gzkbT0zqbv9TEfvx/Hdd5hpRYJNsfiYbY5LBXXkc7i2?=
 =?us-ascii?Q?ymERQ3wLdvxbpMBTg/gVw4IzhE8jvGdk6PpooqBAuQefJz9xEt2BlRDq5vfF?=
 =?us-ascii?Q?erlucwB7mSMDn9WQZvYMtQY4wt329sedYvwAeNUraXxrhyPByQEJJDSIsVKT?=
 =?us-ascii?Q?Z9RZYGL3iYuWgv0PtWvYdwnezLQANH0C72zRs5L0/scDKJp7IiAFMVOqTq7v?=
 =?us-ascii?Q?6uO/VqzDbai5vRhscH5MVLI3uN6JrWdiLd4/4crkM4SCJfX06ngTqri1rxeh?=
 =?us-ascii?Q?bMA6L8BBpumP6XVU9Q5M0bF7fHNbV81x4Jkc9dDN/ifNWMLvnFkIv9ike5/w?=
 =?us-ascii?Q?7w3wGoZbFmkm+wmZ+5R1JAAC6c1mntfdgskOZFybDejBDZ4jCK8+VwE657jX?=
 =?us-ascii?Q?Dr+N9XtVF9n39ZY8BSfVlN5uYLHYiyXH0+hrOHWeO1WtaCM6kOhiuHenZaIP?=
 =?us-ascii?Q?YA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fae0fa03-0796-4de5-c93e-08db77dbeb85
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 13:31:03.8180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UW0ZKdQ+4mJRGfWZkrxXCwbopxMzuI4RPLv5aTKeW9fYq32HcjPDvzVZrq7YbqswXQc3z9BWudCS7bdOqtOl1n/FC0JjHdzbdDc/C2OFaNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7741
X-Proofpoint-ORIG-GUID: I-xk8SNyfI4w4GbW3M7CS5jqXXHs2LwB
X-Proofpoint-GUID: I-xk8SNyfI4w4GbW3M7CS5jqXXHs2LwB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_09,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 phishscore=0 impostorscore=0 mlxlogscore=820 lowpriorityscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306280119
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Wed, 28 Jun 2023 15:40:45 +0000
Subject: [Cluster-devel] [PATCH 5.4] gfs2: Don't deref jdesc in evict
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
index 9c593fd50c6a..baf0a70460c0 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1258,6 +1258,14 @@ static void gfs2_evict_inode(struct inode *inode)
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

