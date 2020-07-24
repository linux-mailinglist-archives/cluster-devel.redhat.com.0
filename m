Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id CD10822CDCC
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Jul 2020 20:33:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595615601;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZRZUiM9u6SG2IstM8HSmONTMdsOnd4GieaAwaSHfirA=;
	b=ht2ZHajnHjX6fjeLvPJy3r/qF+0IOE8uHHi4tiUF/o0scOASxzflvslRcVGT9o5Paj5/Oe
	2QIBnaj8+rCqvijTUB07+1JZ+JbfDI/DTOAw5RvtmLkJr+X7zdlUFwZemxsHMX1+TrLjuH
	NvLkjb7l8A8+frB6frOL3MLBh8Gxmzg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-jl-zXjMtMsmm70sB_7mZfQ-1; Fri, 24 Jul 2020 14:33:19 -0400
X-MC-Unique: jl-zXjMtMsmm70sB_7mZfQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C52A800C64;
	Fri, 24 Jul 2020 18:33:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C5D18FA2A;
	Fri, 24 Jul 2020 18:33:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5627BA3595;
	Fri, 24 Jul 2020 18:33:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OIXBKh016271 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 14:33:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 60949705A0; Fri, 24 Jul 2020 18:33:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-145.phx2.redhat.com [10.3.112.145])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 31EFE6FEFE
	for <cluster-devel@redhat.com>; Fri, 24 Jul 2020 18:33:11 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 24 Jul 2020 13:32:55 -0500
Message-Id: <20200724183304.366913-3-rpeterso@redhat.com>
In-Reply-To: <20200724183304.366913-1-rpeterso@redhat.com>
References: <20200724183304.366913-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 02/11] gfs2: don't break integrity
	writeback on __gfs2_jdata_writepage error
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Port Brian Foster's patch 3fa750dcf29e8606e3969d13d8e188cc1c0f511d to
gfs2's sister function gfs2_write_cache_jdata. Brian's original description:

write_cache_pages() is used in both background and integrity writeback
scenarios by various filesystems.  Background writeback is mostly
concerned with cleaning a certain number of dirty pages based on various
mm heuristics.  It may not write the full set of dirty pages or wait for
I/O to complete.  Integrity writeback is responsible for persisting a set
of dirty pages before the writeback job completes.  For example, an
fsync() call must perform integrity writeback to ensure data is on disk
before the call returns.

write_cache_pages() unconditionally breaks out of its processing loop in
the event of a ->writepage() error.  This is fine for background
writeback, which had no strict requirements and will eventually come
around again.  This can cause problems for integrity writeback on
filesystems that might need to clean up state associated with failed page
writeouts.  For example, XFS performs internal delayed allocation
accounting before returning a ->writepage() error, where applicable.  If
the current writeback happens to be associated with an unmount and
write_cache_pages() completes the writeback prematurely due to error, the
filesystem is unmounted in an inconsistent state if dirty+delalloc pages
still exist.

To handle this problem, update write_cache_pages() to always process the
full set of pages for integrity writeback regardless of ->writepage()
errors.  Save the first encountered error and return it to the caller once
complete.  This facilitates XFS (or any other fs that expects integrity
writeback to process the entire set of dirty pages) to clean up its
internal state completely in the event of persistent mapping errors.
Background writeback continues to exit on the first error encountered.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/aops.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index d6f471cbd62b..ff2ec416f106 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -239,6 +239,7 @@ static int gfs2_write_cache_jdata(struct address_space *mapping,
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
 	int ret = 0;
 	int done = 0;
+	int error;
 	struct pagevec pvec;
 	int nr_pages;
 	pgoff_t uninitialized_var(writeback_index);
@@ -326,25 +327,31 @@ static int gfs2_write_cache_jdata(struct address_space *mapping,
 				goto continue_unlock;
 
 			trace_wbc_writepage(wbc, inode_to_bdi(inode));
-			ret = __gfs2_jdata_writepage(page, wbc);
-			if (unlikely(ret)) {
-				if (ret == AOP_WRITEPAGE_ACTIVATE) {
+			error = __gfs2_jdata_writepage(page, wbc);
+			if (unlikely(error)) {
+				/*
+				 * Handle errors according to the type of
+				 * writeback. There's no need to continue for
+				 * background writeback. Just push done_index
+				 * past this page so media errors won't choke
+				 * writeout for the entire file. For integrity
+				 * writeback, we must process the entire dirty
+				 * set regardless of errors because the fs may
+				 * still have state to clear for each page. In
+				 * that case we continue processing and return
+				 * the first error.
+				 */
+				if (error == AOP_WRITEPAGE_ACTIVATE) {
 					unlock_page(page);
-					ret = 0;
-				} else {
-					/*
-					 * done_index is set past this page,
-					 * so media errors will not choke
-					 * background writeout for the entire
-					 * file. This has consequences for
-					 * range_cyclic semantics (ie. it may
-					 * not be suitable for data integrity
-					 * writeout).
-					 */
+					error = 0;
+				} else if (wbc->sync_mode != WB_SYNC_ALL) {
+					ret = error;
 					done_index = page->index + 1;
 					done = 1;
 					break;
 				}
+				if (!ret)
+					ret = error;
 			}
 
 			/*
-- 
2.26.2

