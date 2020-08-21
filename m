Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2B7DA24DE8E
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Aug 2020 19:34:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598031240;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3wCA4HLo0f8VIgxXVXJLBcGhXOCT044YVGsRmi1wqz8=;
	b=f3dqjhnezUFwtBcYX1zdkwbKqoXn2vJ757hfjAyToWwWaeJBUgnqA1bpLEuYzNclvBVodN
	yyKThKK89YkWCZM4mXXCos6z1NXk2f4TOlNbNVxAP2Wahd2F+3Lq/3NnYo7kT+nPNs06Ml
	YhIKTRoBW7gcYltASMiszts6gL/JplQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-tV7SXvsvNP6sZvWsIZdkYw-1; Fri, 21 Aug 2020 13:33:58 -0400
X-MC-Unique: tV7SXvsvNP6sZvWsIZdkYw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADEE31885D93;
	Fri, 21 Aug 2020 17:33:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E45B7E331;
	Fri, 21 Aug 2020 17:33:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 85854662CA;
	Fri, 21 Aug 2020 17:33:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LHXhsY028410 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 13:33:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 63CDC5DA75; Fri, 21 Aug 2020 17:33:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-102.phx2.redhat.com [10.3.112.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3110E5DA74
	for <cluster-devel@redhat.com>; Fri, 21 Aug 2020 17:33:43 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 21 Aug 2020 12:33:31 -0500
Message-Id: <20200821173337.20377-7-rpeterso@redhat.com>
In-Reply-To: <20200821173337.20377-1-rpeterso@redhat.com>
References: <20200821173337.20377-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 06/12] gfs2: Create transaction for
	inodes with i_nlink != 0
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Before this patch, function gfs2_evict_inode would check if i_nlink
was non-zero, and if so, go to label out. The problem is, the evicted
file may still have outstanding pages that need invalidating, but
the call to truncate_inode_pages_final at label out doesn't start a
transaction. It needs a transaction in order to write revokes for any
pages it has to invalidate.

This patch removes the early check for i_nlink in gfs2_evict_inode.
Not much further down in the code, there's another check for i_nlink
that skips to out_truncate. That one is proper because the calls
to truncate_inode_pages after out_truncate use a proper transaction,
so the page invalidates and subsequent revokes may be done properly.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 80ac446f0110..1f3dee740431 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1344,7 +1344,7 @@ static void gfs2_evict_inode(struct inode *inode)
 		return;
 	}
 
-	if (inode->i_nlink || sb_rdonly(sb))
+	if (sb_rdonly(sb))
 		goto out;
 
 	if (test_bit(GIF_ALLOC_FAILED, &ip->i_flags)) {
@@ -1370,15 +1370,19 @@ static void gfs2_evict_inode(struct inode *inode)
 	}
 
 	if (gfs2_inode_already_deleted(ip->i_gl, ip->i_no_formal_ino))
-		goto out_truncate;
+		goto out_flush;
 	error = gfs2_check_blk_type(sdp, ip->i_no_addr, GFS2_BLKST_UNLINKED);
-	if (error)
-		goto out_truncate;
+	if (error) {
+		error = 0;
+		goto out_flush;
+	}
 
 	if (test_bit(GIF_INVALID, &ip->i_flags)) {
 		error = gfs2_inode_refresh(ip);
-		if (error)
-			goto out_truncate;
+		if (error) {
+			error = 0;
+			goto out_flush;
+		}
 	}
 
 	/*
@@ -1392,7 +1396,7 @@ static void gfs2_evict_inode(struct inode *inode)
 	    test_bit(HIF_HOLDER, &ip->i_iopen_gh.gh_iflags)) {
 		if (!gfs2_upgrade_iopen_glock(inode)) {
 			gfs2_holder_uninit(&ip->i_iopen_gh);
-			goto out_truncate;
+			goto out_flush;
 		}
 	}
 
@@ -1424,7 +1428,7 @@ static void gfs2_evict_inode(struct inode *inode)
 	gfs2_inode_remember_delete(ip->i_gl, ip->i_no_formal_ino);
 	goto out_unlock;
 
-out_truncate:
+out_flush:
 	gfs2_log_flush(sdp, ip->i_gl, GFS2_LOG_HEAD_FLUSH_NORMAL |
 		       GFS2_LFC_EVICT_INODE);
 	metamapping = gfs2_glock2aspace(ip->i_gl);
@@ -1435,6 +1439,7 @@ static void gfs2_evict_inode(struct inode *inode)
 	write_inode_now(inode, 1);
 	gfs2_ail_flush(ip->i_gl, 0);
 
+out_truncate:
 	nr_revokes = inode->i_mapping->nrpages + metamapping->nrpages;
 	if (!nr_revokes)
 		goto out_unlock;
-- 
2.26.2

