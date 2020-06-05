Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 95CA81F03CA
	for <lists+cluster-devel@lfdr.de>; Sat,  6 Jun 2020 02:21:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591402864;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=J172nxDFUxzaOGfxoNhmQ/WBOBRUiM9D2W7K9USkYS4=;
	b=daJ34id6M6CTiI/L2p64VvHesPsBJYL70i2fUl8m1bJZCSP6XkKfKZg0aBGTdFjEMsO/ZX
	Kn8sprJJtUVqYXBwpEbtrgqTE4oB0o3tZLfusKvjI42J4DBukQfwOchQYHwOaT9LJ0nEVm
	2FzB/hkTNKn5RW9S6fi2uy1O4aejmbs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-VZ1Rx2HsPaK-wTc5vKQr1w-1; Fri, 05 Jun 2020 20:21:02 -0400
X-MC-Unique: VZ1Rx2HsPaK-wTc5vKQr1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0993800685;
	Sat,  6 Jun 2020 00:20:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC08261985;
	Sat,  6 Jun 2020 00:20:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 996D987425;
	Sat,  6 Jun 2020 00:20:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055CZOgr029628 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 08:35:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 023492156A4A; Fri,  5 Jun 2020 12:35:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD0542156A3A
	for <cluster-devel@redhat.com>; Fri,  5 Jun 2020 12:35:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFB3E80028B
	for <cluster-devel@redhat.com>; Fri,  5 Jun 2020 12:35:20 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-210-pbh3KefUPNqS6X3TF1l4bQ-1;
	Fri, 05 Jun 2020 08:35:16 -0400
X-MC-Unique: pbh3KefUPNqS6X3TF1l4bQ-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 218B6207F5;
	Fri,  5 Jun 2020 12:25:32 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Fri,  5 Jun 2020 08:25:11 -0400
Message-Id: <20200605122517.2882338-12-sashal@kernel.org>
In-Reply-To: <20200605122517.2882338-1-sashal@kernel.org>
References: <20200605122517.2882338-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 055CZOgr029628
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.6 12/17] gfs2: Even more
	gfs2_find_jhead fixes
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

From: Andreas Gruenbacher <agruenba@redhat.com>

[ Upstream commit 20be493b787cd581c9fffad7fcd6bfbe6af1050c ]

Fix several issues in the previous gfs2_find_jhead fix:
* When updating @blocks_submitted, @block refers to the first block block not
  submitted yet, not the last block submitted, so fix an off-by-one error.
* We want to ensure that @blocks_submitted is far enough ahead of @blocks_read
  to guarantee that there is in-flight I/O.  Otherwise, we'll eventually end up
  waiting for pages that haven't been submitted, yet.
* It's much easier to compare the number of blocks added with the number of
  blocks submitted to limit the maximum bio size.
* Even with bio chaining, we can keep adding blocks until we reach the maximum
  bio size, as long as we stop at a page boundary.  This simplifies the logic.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Reviewed-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/lops.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 3a020bdc358c..966ed37c9acd 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -505,12 +505,12 @@ int gfs2_find_jhead(struct gfs2_jdesc *jd, struct gfs2_log_header_host *head,
 	unsigned int bsize = sdp->sd_sb.sb_bsize, off;
 	unsigned int bsize_shift = sdp->sd_sb.sb_bsize_shift;
 	unsigned int shift = PAGE_SHIFT - bsize_shift;
-	unsigned int max_bio_size = 2 * 1024 * 1024;
+	unsigned int max_blocks = 2 * 1024 * 1024 >> bsize_shift;
 	struct gfs2_journal_extent *je;
 	int sz, ret = 0;
 	struct bio *bio = NULL;
 	struct page *page = NULL;
-	bool bio_chained = false, done = false;
+	bool done = false;
 	errseq_t since;
 
 	memset(head, 0, sizeof(*head));
@@ -533,10 +533,7 @@ int gfs2_find_jhead(struct gfs2_jdesc *jd, struct gfs2_log_header_host *head,
 				off = 0;
 			}
 
-			if (!bio || (bio_chained && !off) ||
-			    bio->bi_iter.bi_size >= max_bio_size) {
-				/* start new bio */
-			} else {
+			if (bio && (off || block < blocks_submitted + max_blocks)) {
 				sector_t sector = dblock << sdp->sd_fsb2bb_shift;
 
 				if (bio_end_sector(bio) == sector) {
@@ -549,19 +546,17 @@ int gfs2_find_jhead(struct gfs2_jdesc *jd, struct gfs2_log_header_host *head,
 						(PAGE_SIZE - off) >> bsize_shift;
 
 					bio = gfs2_chain_bio(bio, blocks);
-					bio_chained = true;
 					goto add_block_to_new_bio;
 				}
 			}
 
 			if (bio) {
-				blocks_submitted = block + 1;
+				blocks_submitted = block;
 				submit_bio(bio);
 			}
 
 			bio = gfs2_log_alloc_bio(sdp, dblock, gfs2_end_log_read);
 			bio->bi_opf = REQ_OP_READ;
-			bio_chained = false;
 add_block_to_new_bio:
 			sz = bio_add_page(bio, page, bsize, off);
 			BUG_ON(sz != bsize);
@@ -569,7 +564,7 @@ int gfs2_find_jhead(struct gfs2_jdesc *jd, struct gfs2_log_header_host *head,
 			off += bsize;
 			if (off == PAGE_SIZE)
 				page = NULL;
-			if (blocks_submitted < 2 * max_bio_size >> bsize_shift) {
+			if (blocks_submitted <= blocks_read + max_blocks) {
 				/* Keep at least one bio in flight */
 				continue;
 			}
-- 
2.25.1


