Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 07B5B1F1CBC
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jun 2020 18:02:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591632174;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gloU259azMRRQIbxEsu7VkbFofANbiMEJPTast5VvhE=;
	b=i3kcW/lb6mRxNdx8kOgz1A37pzQnskljk4ABC2uIk8WjwpQnVIPLzuJZcu38NwOdrGlmsL
	82i1OYp1NZF+J8Gv6YnddmRs0zeL5GcgLLT9Vb8IL6cUJZHpVkFV1dxOgzlgriB8wN3XJf
	Zi8Jgxb+UrrV1xmJ0+rCz4nlOWgwecU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-F2-3Z60JMauCsUaxL2WofA-1; Mon, 08 Jun 2020 12:02:50 -0400
X-MC-Unique: F2-3Z60JMauCsUaxL2WofA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A26758018A7;
	Mon,  8 Jun 2020 16:02:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9085E1A8EA;
	Mon,  8 Jun 2020 16:02:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7BED6B348A;
	Mon,  8 Jun 2020 16:02:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058G177Z011803 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 12:01:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2D1031CA; Mon,  8 Jun 2020 16:01:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5EAE4648DB;
	Mon,  8 Jun 2020 16:01:06 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon,  8 Jun 2020 18:00:34 +0200
Message-Id: <20200608160039.549204-16-agruenba@redhat.com>
In-Reply-To: <20200608160039.549204-1-agruenba@redhat.com>
References: <20200608160039.549204-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 15/20] gfs2: Check inode generation number
	in delete_work_func
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

In delete_work_func, if the iopen glock still has an inode attached,
limit the inode lookup to that specific generation number: in the likely
case that the inode was deleted on the node on which the inode's link
count dropped to zero, we can skip verifying the on-disk block type and
reading in the inode.  The same applies if another node that had the
inode open managed to delete the inode before us.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c  | 4 +++-
 fs/gfs2/incore.h | 5 ++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index b6078b0e74b9..711259f68d55 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -795,6 +795,7 @@ static bool gfs2_try_evict(struct gfs2_glock *gl)
 		ip = NULL;
 	spin_unlock(&gl->gl_lockref.lock);
 	if (ip) {
+		gl->gl_no_formal_ino = ip->i_no_formal_ino;
 		set_bit(GIF_DEFERRED_DELETE, &ip->i_flags);
 		d_prune_aliases(&ip->i_inode);
 		iput(&ip->i_inode);
@@ -843,7 +844,8 @@ static void delete_work_func(struct work_struct *work)
 		}
 	}
 
-	inode = gfs2_lookup_by_inum(sdp, no_addr, 0, GFS2_BLKST_UNLINKED);
+	inode = gfs2_lookup_by_inum(sdp, no_addr, gl->gl_no_formal_ino,
+				    GFS2_BLKST_UNLINKED);
 	if (!IS_ERR_OR_NULL(inode)) {
 		d_prune_aliases(inode);
 		iput(inode);
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 76ac2578e658..03ab11fab962 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -380,7 +380,10 @@ struct gfs2_glock {
 	struct delayed_work gl_work;
 	union {
 		/* For iopen glocks only */
-		struct delayed_work gl_delete;
+		struct {
+			struct delayed_work gl_delete;
+			u64 gl_no_formal_ino;
+		};
 		/* For rgrp glocks only */
 		struct {
 			loff_t start;
-- 
2.26.2

