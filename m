Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6323B22CDD8
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Jul 2020 20:36:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595615785;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=t+gvHEcCACDldPYHZUoLwd3/E9gDJ49sf/UrLOAdElA=;
	b=C+iy3otF3WSANmahw5D34z63dU6Poc7SE2oGWQiOudbFFxkRna8bcBHyxbI0F6oL8+5YqE
	+dxMGyPaiPuulcGHZmoVmoyUw0Z0TruyFWw3preojfJDWrQJ74YemMdsLJLjircOJkxDy8
	jbNy99JXVKmPa0VBhTnKTCGf25n0L44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-aJRWBEdeMRuvLgw_ODOe9A-1; Fri, 24 Jul 2020 14:36:23 -0400
X-MC-Unique: aJRWBEdeMRuvLgw_ODOe9A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D63A100AA24;
	Fri, 24 Jul 2020 18:36:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0D315D9D3;
	Fri, 24 Jul 2020 18:36:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D6341809554;
	Fri, 24 Jul 2020 18:36:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OIXCE6016282 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 14:33:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 037236FEFE; Fri, 24 Jul 2020 18:33:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-145.phx2.redhat.com [10.3.112.145])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C8ED9709E4
	for <cluster-devel@redhat.com>; Fri, 24 Jul 2020 18:33:11 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 24 Jul 2020 13:32:57 -0500
Message-Id: <20200724183304.366913-5-rpeterso@redhat.com>
In-Reply-To: <20200724183304.366913-1-rpeterso@redhat.com>
References: <20200724183304.366913-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 04/11] gfs2: don't try to add buffers
	to transactions a second time for jdata
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

When jdata buffers are written by user-space, the iomap code adds the
buffers to the appropriate transaction's databufs queue. Then they get
pinned, and unpinned and make their way to the ail1 list. But then
gfs2_ail1_start gets called, resulting in this calling sequence:

gfs2_ail1_start(sdp);
   gfs2_ail1_flush(sdp, &wbc); wbc has for_sync=1
      list_for_each_entry_reverse(tr, head, tr_list) {
         ret = gfs2_ail1_start_one(sdp, wbc, tr);
            ret = generic_writepages(mapping, wbc);
               write_cache_pages
                  __writepage
                     gfs2_jdata_writepage
                        __gfs2_jdata_writepage

At this point, __gfs2_jdata_writepage is trying to write the in-place
jdata buffers, but ends up calling gfs2_page_add_databufs which calls
gfs2_trans_add_data which, of course, requires a transaction. But the
gfs2_ail1_flush calling sequence is for flushing transactions, so it
does not have a transaction. In fact, it should just be writing the
jdata buffers in-place and shouldn't need a transaction.

This got us into strange situations where it thought it needed a
transaction when it didn't, and infinite loops because it thought
the buffer was PageChecked (i.e. re-dirtied by a competing write op)
so it just kept waiting for it to not be PageChecked each time.

To fix this, this patch introduces a new buffer_head flag "needs_trans"
to indicate when a buffer has been dirtied by a real write as opposed
to just an in-place write for the ail list.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/aops.c   | 37 +++++++++++++++++++++++--------------
 fs/gfs2/bmap.c   |  1 +
 fs/gfs2/incore.h |  3 +++
 fs/gfs2/lops.c   |  1 +
 fs/gfs2/trans.c  |  2 ++
 5 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index ff2ec416f106..a9af28abe468 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -158,14 +158,29 @@ static int __gfs2_jdata_writepage(struct page *page, struct writeback_control *w
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
 
-	if (PageChecked(page)) {
-		ClearPageChecked(page);
-		if (!page_has_buffers(page)) {
-			create_empty_buffers(page, inode->i_sb->s_blocksize,
-					     BIT(BH_Dirty)|BIT(BH_Uptodate));
+	if (!PageChecked(page))
+		goto write;
+
+	ClearPageChecked(page);
+	if (page_has_buffers(page)) {
+		struct buffer_head *bh, *head;
+
+		bh = head = page_buffers(page);
+		do {
+			if (buffer_needstrans(bh))
+				break;
+			bh = bh->b_this_page;
+		} while (bh != head);
+		if (buffer_needstrans(bh)) {
+			BUG_ON(!current->journal_info);
+			gfs2_page_add_databufs(ip, page, 0,
+					       sdp->sd_vfs->s_blocksize);
 		}
-		gfs2_page_add_databufs(ip, page, 0, sdp->sd_vfs->s_blocksize);
+	} else {
+		create_empty_buffers(page, inode->i_sb->s_blocksize,
+				     BIT(BH_Dirty)|BIT(BH_Uptodate));
 	}
+write:
 	return gfs2_write_full_page(page, gfs2_get_block_noalloc, wbc);
 }
 
@@ -184,15 +199,9 @@ static int gfs2_jdata_writepage(struct page *page, struct writeback_control *wbc
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
 
-	if (gfs2_assert_withdraw(sdp, gfs2_glock_is_held_excl(ip->i_gl)))
-		goto out;
-	if (PageChecked(page) || current->journal_info)
-		goto out_ignore;
-	return __gfs2_jdata_writepage(page, wbc);
+	if (!gfs2_assert_withdraw(sdp, gfs2_glock_is_held_excl(ip->i_gl)))
+		return __gfs2_jdata_writepage(page, wbc);
 
-out_ignore:
-	redirty_page_for_writepage(wbc, page);
-out:
 	unlock_page(page);
 	return 0;
 }
diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 6306eaae378b..85cf903011d7 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -94,6 +94,7 @@ static int gfs2_unstuffer_page(struct gfs2_inode *ip, struct buffer_head *dibh,
 		gfs2_trans_add_data(ip->i_gl, bh);
 	else {
 		mark_buffer_dirty(bh);
+		set_buffer_needstrans(bh);
 		gfs2_ordered_add_inode(ip);
 	}
 
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index ca2ec02436ec..f510126efc1c 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -149,12 +149,15 @@ static inline bool gfs2_rbm_eq(const struct gfs2_rbm *rbm1,
 enum gfs2_state_bits {
 	BH_Pinned = BH_PrivateStart,
 	BH_Escaped = BH_PrivateStart + 1,
+	BH_Needstrans = BH_PrivateStart + 2,
 };
 
 BUFFER_FNS(Pinned, pinned)
 TAS_BUFFER_FNS(Pinned, pinned)
 BUFFER_FNS(Escaped, escaped)
 TAS_BUFFER_FNS(Escaped, escaped)
+BUFFER_FNS(Needstrans, needstrans)
+TAS_BUFFER_FNS(Needstrans, needstrans)
 
 struct gfs2_bufdata {
 	struct buffer_head *bd_bh;
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index cb2a11b458c6..6f74fc43e9c2 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -104,6 +104,7 @@ static void gfs2_unpin(struct gfs2_sbd *sdp, struct buffer_head *bh,
 	BUG_ON(!buffer_pinned(bh));
 
 	lock_buffer(bh);
+	clear_buffer_needstrans(bh);
 	mark_buffer_dirty(bh);
 	clear_buffer_pinned(bh);
 
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index a3dfa3aa87ad..897d08e2a6b0 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -130,6 +130,7 @@ static struct gfs2_bufdata *gfs2_alloc_bufdata(struct gfs2_glock *gl,
 	bd->bd_bh = bh;
 	bd->bd_gl = gl;
 	INIT_LIST_HEAD(&bd->bd_list);
+	INIT_LIST_HEAD(&bd->bd_ail_st_list);
 	bh->b_private = bd;
 	return bd;
 }
@@ -155,6 +156,7 @@ void gfs2_trans_add_data(struct gfs2_glock *gl, struct buffer_head *bh)
 	struct gfs2_bufdata *bd;
 
 	lock_buffer(bh);
+	clear_buffer_needstrans(bh);
 	if (buffer_pinned(bh)) {
 		set_bit(TR_TOUCHED, &tr->tr_flags);
 		goto out;
-- 
2.26.2

