Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E0A10306
	for <lists+cluster-devel@lfdr.de>; Wed,  1 May 2019 01:03:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 02E67307D962;
	Tue, 30 Apr 2019 23:03:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E45AB81742;
	Tue, 30 Apr 2019 23:03:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C401518089CC;
	Tue, 30 Apr 2019 23:03:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UN3PxC023046 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 19:03:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 97BD281742; Tue, 30 Apr 2019 23:03:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-20.phx2.redhat.com [10.3.116.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7191C81764
	for <cluster-devel@redhat.com>; Tue, 30 Apr 2019 23:03:25 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 30 Apr 2019 17:03:14 -0600
Message-Id: <20190430230319.10375-15-rpeterso@redhat.com>
In-Reply-To: <20190430230319.10375-1-rpeterso@redhat.com>
References: <20190430230319.10375-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v3 14/19] gfs2: Don't write log headers
	after file system withdraw
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Tue, 30 Apr 2019 23:03:31 +0000 (UTC)

Before this patch, when a node withdrew a gfs2 file system, it
wrote a (clean) unmount log header. That's wrong. You don't want
to write anything to the journal once you're withdrawn because
that's acknowledging that the transaction is complete and the
journal is in good shape, neither of which may be a valid
assumption when the file system is withdrawn. This is especially
true if the withdraw was caused due to io errors writing to the
journal in the first place. The best course of action is to leave
the journal "as is" until it may be safely replayed during
journal recovery, regardless of whether it's done by this node or
another.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 6169276aa9e6..771589b2e225 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -693,12 +693,16 @@ void gfs2_write_log_header(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 {
 	struct gfs2_log_header *lh;
 	u32 hash, crc;
-	struct page *page = mempool_alloc(gfs2_page_pool, GFP_NOIO);
+	struct page *page;
 	struct gfs2_statfs_change_host *l_sc = &sdp->sd_statfs_local;
 	struct timespec64 tv;
 	struct super_block *sb = sdp->sd_vfs;
 	u64 dblock;
 
+	if (gfs2_withdrawn(sdp))
+		goto out;
+
+	page = mempool_alloc(gfs2_page_pool, GFP_NOIO);
 	lh = page_address(page);
 	clear_page(lh);
 
@@ -751,6 +755,7 @@ void gfs2_write_log_header(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 
 	gfs2_log_write(sdp, page, sb->s_blocksize, 0, dblock);
 	gfs2_log_submit_bio(&sdp->sd_log_bio, REQ_OP_WRITE, op_flags);
+out:
 	log_flush_wait(sdp);
 }
 
-- 
2.20.1

