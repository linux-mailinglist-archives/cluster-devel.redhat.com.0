Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 059B936BC05
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Apr 2021 01:25:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-bL8xY66ZNS2_oHUH6DM_Kw-1; Mon, 26 Apr 2021 19:25:42 -0400
X-MC-Unique: bL8xY66ZNS2_oHUH6DM_Kw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE15218397A4;
	Mon, 26 Apr 2021 23:25:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D01006085A;
	Mon, 26 Apr 2021 23:25:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD371E171;
	Mon, 26 Apr 2021 23:25:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13QNLwko008463 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Apr 2021 19:21:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5C8A8200B670; Mon, 26 Apr 2021 23:21:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57448200B66E
	for <cluster-devel@redhat.com>; Mon, 26 Apr 2021 23:21:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FA9D857D08
	for <cluster-devel@redhat.com>; Mon, 26 Apr 2021 23:21:55 +0000 (UTC)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-449-bgwWZbvJPHmG8bw3SB9dXw-1; Mon, 26 Apr 2021 19:21:53 -0400
X-MC-Unique: bgwWZbvJPHmG8bw3SB9dXw-1
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	13QM0VgC115653; Mon, 26 Apr 2021 22:07:29 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by aserp2130.oracle.com with ESMTP id 385afpuksg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Apr 2021 22:07:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	13QM6Klg105544; Mon, 26 Apr 2021 22:07:28 GMT
Received: from nam04-bn3-obe.outbound.protection.outlook.com
	(mail-bn3nam04lp2054.outbound.protection.outlook.com [104.47.46.54])
	by userp3020.oracle.com with ESMTP id 384w3s65pu-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Apr 2021 22:07:28 +0000
Received: from SJ0PR10MB4752.namprd10.prod.outlook.com (2603:10b6:a03:2d7::19)
	by BY5PR10MB4307.namprd10.prod.outlook.com (2603:10b6:a03:212::18)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19;
	Mon, 26 Apr 2021 22:07:25 +0000
Received: from SJ0PR10MB4752.namprd10.prod.outlook.com
	([fe80::7865:7d35:9cee:363f]) by
	SJ0PR10MB4752.namprd10.prod.outlook.com
	([fe80::7865:7d35:9cee:363f%5]) with mapi id 15.20.4065.027;
	Mon, 26 Apr 2021 22:07:25 +0000
From: Junxiao Bi <junxiao.bi@oracle.com>
To: ocfs2-devel@oss.oracle.com, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org
Date: Mon, 26 Apr 2021 15:05:51 -0700
Message-Id: <20210426220552.45413-2-junxiao.bi@oracle.com>
In-Reply-To: <20210426220552.45413-1-junxiao.bi@oracle.com>
References: <20210426220552.45413-1-junxiao.bi@oracle.com>
X-Originating-IP: [73.231.9.254]
X-ClientProxiedBy: SN6PR05CA0026.namprd05.prod.outlook.com
	(2603:10b6:805:de::39) To SJ0PR10MB4752.namprd10.prod.outlook.com
	(2603:10b6:a03:2d7::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from dhcp-10-159-151-113.vpn.oracle.com (73.231.9.254) by
	SN6PR05CA0026.namprd05.prod.outlook.com (2603:10b6:805:de::39)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.16
	via Frontend Transport; Mon, 26 Apr 2021 22:07:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a8e2d37-4503-4b06-f203-08d908ffac6e
X-MS-TrafficTypeDiagnostic: BY5PR10MB4307:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB4307BF0767AA8E97413F2F94E8429@BY5PR10MB4307.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: zHVKO/nMN4+N7PsK3S0CfHI9lMCaKNw+qUiO0/JaVU5UZTXPnKCdvQ4RI0oigmwJsxE5uRJiUyB0ki7vFK3rbNqdaHxh+/uUwX/epj9Xi4sS6rY6LqYRg1HaLcqpK6h2Ir4wwtV02yMfo7YOCu2c7Ic8JxtEtwtps0RBMIsSnEYXH93vw/zri+vlYec8SSyHT5IjGJwOKcwcF5rCe6XCE9uTjx13Mmn+R2Zt0q/S19/Zgl8XpTps3Gg7luvn1ctgE5kqhzowQDm8zzCEyEdsHISxl4FA47EdoZDhLn8R0GNEC8w9kFlzyMoAXKfnTFLTEVz8h71g69SmHgoN7adJmCM4NwQ2ewr3ScLpfWLEImwHpdzGHSLBgsaCTQ8uAzFDyu1LAJKFuAEBwKLNEqpLW4Fo4PQczRJyIq37NDORikn8iqVPNPYgTI1EWijTAaPckrFTU27RPpAJYFFjEel9JMs9Azg7Q3VqteQvMRvL9dxgt/TkknKqwZvF9vZUkSPRyXe7b6D2RkCwHsLMaUHr5yiUK/I/T0M9TXjkMpU8si8EQv/pOLcdyQqh9NNEsv6uM6jCttp0eJKFhoLMdOu/LeOLanHRlKhH5Kse8tpm8971G6bM19jFFSyr0ZSN0UzLhs3wDbgFpOhWzeslG5FLzjZLDKspDnJyA3HIkFt/DL4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SJ0PR10MB4752.namprd10.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(396003)(376002)(346002)(39860400002)(366004)(136003)(6486002)(6666004)(44832011)(5660300002)(478600001)(2906002)(66556008)(52116002)(4326008)(36756003)(83380400001)(38350700002)(86362001)(107886003)(26005)(956004)(2616005)(316002)(8676002)(16526019)(1076003)(38100700002)(8936002)(7696005)(66476007)(66946007)(186003);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cFNHjP5FUdIFbj93xG43IRskHQROlJVnJgqZgABWdzpeVVLyKudfwwNrkjXX?=
	=?us-ascii?Q?vMnbDxNE+WilVTtJKSnnlYTBj3PyM2yUhZc0lxrr2qjo6kWMeMF/6GFWzxiK?=
	=?us-ascii?Q?IoJC9VA2GU3SZwgcQp3/9x30F57eNI1Y8pSW8HmdrAeLQV7TUrs9FDwDrWEm?=
	=?us-ascii?Q?oT4Qu2n/Wgo9t9buM5HKAA9jnqzaAWlRU3PJ+i0ATORiJKZ8K90ShiAAnDml?=
	=?us-ascii?Q?ttBqjz1yjS2DgdtZegwWbIXg8CAK+gRntczX6QFujD9avHo+2hlNi6WmH67s?=
	=?us-ascii?Q?s7GrLJ2ehqqx3JiRzrfTO8rhhwFXH+I5thKrBxFCmrYFd30o9eHsrPvyHcZV?=
	=?us-ascii?Q?KxrP494ol5MpLAsS0x45aImU2hWGqqnPlIYHNplcQ/CfEHtNB8dwkupcRgbL?=
	=?us-ascii?Q?LazIPVuIwdYiQ0aILgeWi083oERej/5H7WLis5P189Swdt1tkx/AH2odZ6S3?=
	=?us-ascii?Q?xK89xkC6aDHFQFWs+p+vZMvDKYoZnk2G8uDZJ5yM9VWDNIwmVPd+sszva3Fq?=
	=?us-ascii?Q?uZns0SMeA3BPMP48abMSj4/2VjRqeD4QYpI39PjCPOx4N8dvK3oCuXF0l/2y?=
	=?us-ascii?Q?dB4lPy9/i995eHdBLLsRsbLTKyL//oF8n3au/p1qBUZTgU7Z9yweYwW8ZF7B?=
	=?us-ascii?Q?5+TXUYiY3JIax/Uhm4tddcWNRn60jVA4ur+AYrza2QrwxyC/bM4K+r9bbGL2?=
	=?us-ascii?Q?Kl8JowjKAlXPhDYA/h+j2cd5rdGpvK2ChM2g05PXdqSF7LtdRcSFB+q6uIJr?=
	=?us-ascii?Q?GAjtH276FNkCGlKi7PHRTVIQKkTlaRhA8zKFXBwIRoHyK0mg9NOcAsOpHKPC?=
	=?us-ascii?Q?xMDj4kznibm36BzgV9ajGP4mA/PG74ZC6ltDKHJemeItmdl6Y1cxLwLt6oz3?=
	=?us-ascii?Q?WRiksc39IydX1wdEL1xZ4XlaP9Qe/ZtebH9v1AMqMD5Y/DawyBlQbGl/sKnA?=
	=?us-ascii?Q?PFmpZR1uo2Hl6SELXKDHWjCrLwOPSo+HP8g19m7gy9gZYpSNaXk52mdwrD1D?=
	=?us-ascii?Q?pg9Rv4KyABLkKEju6dzco0pjl+3q0onCnFulkL58MOujxV6rlVWGEpVfnRCx?=
	=?us-ascii?Q?Dg3seHewzCW5JYlLM5G4c1I1zonI41IIjzq9Io2qBX41CPeCAQ1edwWnhvk0?=
	=?us-ascii?Q?DiiuPq1nIAl726TVsOqCgDHEnfL3oiwZy+OHjf0fNGDeVC1qV/wjewaPeLZR?=
	=?us-ascii?Q?rva4GcOWfghHig66w9bgTP4DsSDnYlOsKFQa46C3H6T3AvmlDnJ/f0ZIlFtT?=
	=?us-ascii?Q?w1eToh+bKIXv/BM9JQIAOt17W+xpZhO40lpu3uc23cezr7La2XqO2sKswqWn?=
	=?us-ascii?Q?YOwachgzb2B/fllPXKBbcbol?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8e2d37-4503-4b06-f203-08d908ffac6e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4752.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 22:07:25.3863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rv8xsTrN/O+NCzFaHs19l22ZD6yrK3wBAt7Blb2gKtFX1jW2QeHUoTvhSFEp+rVtP9Bomygel5Js5XujDAd3rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4307
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9966
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
	malwarescore=0 mlxscore=0
	mlxlogscore=999 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2104060000 definitions=main-2104260167
X-Proofpoint-ORIG-GUID: BnD2L5VtgzJF3N2jLH86hRjYErerrUaw
X-Proofpoint-GUID: BnD2L5VtgzJF3N2jLH86hRjYErerrUaw
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9966
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
	spamscore=0 phishscore=0
	clxscore=1015 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
	mlxscore=0
	adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2104060000 definitions=main-2104260166
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
Cc: junxiao.bi@oracle.com
Subject: [Cluster-devel] [PATCH 2/3] ocfs2: allow writing back pages out of
	inode size
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When fallocate/truncate extend inode size, if the original isize is in
the middle of last cluster, then the part from isize to the end of the
cluster needs to be zeroed with buffer write, at that time isize is not
yet updated to match the new size, if writeback is kicked in, it will
invoke ocfs2_writepage()->block_write_full_page() where the pages out
of inode size will be dropped. That will cause file corruption.

Running the following command with qemu-image 4.2.1 can get a corrupted
coverted image file easily.

    qemu-img convert -p -t none -T none -f qcow2 $qcow_image \
             -O qcow2 -o compat=1.1 $qcow_image.conv

Cc: <stable@vger.kernel.org>
Signed-off-by: Junxiao Bi <junxiao.bi@oracle.com>
---
 fs/ocfs2/aops.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
index ad20403b383f..7a3e3d59f6a9 100644
--- a/fs/ocfs2/aops.c
+++ b/fs/ocfs2/aops.c
@@ -402,11 +402,28 @@ static void ocfs2_readahead(struct readahead_control *rac)
  */
 static int ocfs2_writepage(struct page *page, struct writeback_control *wbc)
 {
+	struct inode * const inode = page->mapping->host;
+	loff_t i_size = i_size_read(inode);
+	const pgoff_t end_index = i_size >> PAGE_SHIFT;
+	unsigned int offset;
+
 	trace_ocfs2_writepage(
 		(unsigned long long)OCFS2_I(page->mapping->host)->ip_blkno,
 		page->index);
 
-	return block_write_full_page(page, ocfs2_get_block, wbc);
+	/*
+	 * The page straddles i_size.  It must be zeroed out on each and every
+	 * writepage invocation because it may be mmapped.  "A file is mapped
+	 * in multiples of the page size.  For a file that is not a multiple of
+	 * the  page size, the remaining memory is zeroed when mapped, and
+	 * writes to that region are not written out to the file."
+	 */
+	offset = i_size & (PAGE_SIZE-1);
+	if (page->index == end_index && offset)
+		zero_user_segment(page, offset, PAGE_SIZE);
+
+	return __block_write_full_page_eof(inode, page, ocfs2_get_block, wbc,
+			end_buffer_async_write, true);
 }
 
 /* Taken from ext3. We don't necessarily need the full blown
-- 
2.24.3 (Apple Git-128)

