Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 56FA538AE5B
	for <lists+cluster-devel@lfdr.de>; Thu, 20 May 2021 14:34:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621514071;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=niIyGypKRI/tMYi74NMa5b60rnjqZJ04fmjRzMuqFao=;
	b=QOBWJjZupAbokyxPX7RYqlAvamNZqChKLy3ZPvZnPOohKcGjsorai4RhAmTcAJAedMRJYi
	h65pkmcBgK5t4Lkr9cT6YuZqoErYyerq2YhfmEyT7ugcIFT/XvEw+jadzhI/swGy1j0Pt0
	b2EHejmhZCwZh5w81ZluV0s0BXZMgjY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-UT_vpcZ0ORCpym_DKdhwgQ-1; Thu, 20 May 2021 08:34:29 -0400
X-MC-Unique: UT_vpcZ0ORCpym_DKdhwgQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 171CA107ACF8;
	Thu, 20 May 2021 12:34:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D337219C59;
	Thu, 20 May 2021 12:34:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B0FCA1800BBE;
	Thu, 20 May 2021 12:34:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14KCPrjc030532 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 May 2021 08:25:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 557A260C13; Thu, 20 May 2021 12:25:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.195.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D219C60C04;
	Thu, 20 May 2021 12:25:51 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, cluster-devel@redhat.com
Date: Thu, 20 May 2021 14:25:35 +0200
Message-Id: <20210520122536.1596602-6-agruenba@redhat.com>
In-Reply-To: <20210520122536.1596602-1-agruenba@redhat.com>
References: <20210520122536.1596602-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, Jan Kara <jack@suse.cz>
Subject: [Cluster-devel] [PATCH 5/6] gfs2: Add LM_FLAG_OUTER glock holder
	flag
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

When a glock holder has the LM_FLAG_OUTER flag set, we set the
current_holds_glock() flag upon taking the lock.  With that flag set, we can
then recognize when trying to take an "inner" glock and react accordingly.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 12 ++++++++++++
 fs/gfs2/glock.h | 13 ++++++++++---
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index d9cb261f55b0..f6cae2ee1c83 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1427,6 +1427,11 @@ int gfs2_glock_nq(struct gfs2_holder *gh)
 	if (glock_blocked_by_withdraw(gl) && !(gh->gh_flags & LM_FLAG_NOEXP))
 		return -EIO;
 
+	if (gh->gh_flags & LM_FLAG_OUTER) {
+		BUG_ON(current_holds_glock());
+		set_current_holds_glock(true);
+	}
+
 	if (test_bit(GLF_LRU, &gl->gl_flags))
 		gfs2_glock_remove_from_lru(gl);
 
@@ -1514,6 +1519,11 @@ void gfs2_glock_dq(struct gfs2_holder *gh)
 		__gfs2_glock_queue_work(gl, delay);
 	}
 	spin_unlock(&gl->gl_lockref.lock);
+
+	if (gh->gh_flags & LM_FLAG_OUTER) {
+		BUG_ON(!current_holds_glock());
+		set_current_holds_glock(false);
+	}
 }
 
 void gfs2_glock_dq_wait(struct gfs2_holder *gh)
@@ -2068,6 +2078,8 @@ static const char *hflags2str(char *buf, u16 flags, unsigned long iflags)
 		*p++ = 'p';
 	if (flags & LM_FLAG_NODE_SCOPE)
 		*p++ = 'n';
+	if (flags & LM_FLAG_OUTER)
+		*p++ = 'o';
 	if (flags & GL_ASYNC)
 		*p++ = 'a';
 	if (flags & GL_EXACT)
diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
index f0ef6fd24ba4..8b145269fb14 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -94,6 +94,12 @@ static inline bool gfs2_holder_is_compatible(struct gfs2_holder *gh, int state)
  * This holder agrees to share the lock within this node. In other words,
  * the glock is held in EX mode according to DLM, but local holders on the
  * same node can share it.
+ *
+ * LM_FLAG_OUTER
+ * Use set_current_holds_glock() to indicate when the current task is holding
+ * this "upper" glock, and current_holds_glock() to detect when the current
+ * task is trying to take another glock.  Used to prevent deadlocks involving
+ * the inode glock during page faults.
  */
 
 #define LM_FLAG_TRY		0x0001
@@ -102,9 +108,10 @@ static inline bool gfs2_holder_is_compatible(struct gfs2_holder *gh, int state)
 #define LM_FLAG_ANY		0x0008
 #define LM_FLAG_PRIORITY	0x0010
 #define LM_FLAG_NODE_SCOPE	0x0020
-#define GL_ASYNC		0x0040
-#define GL_EXACT		0x0080
-#define GL_SKIP			0x0100
+#define LM_FLAG_OUTER		0x0040
+#define GL_ASYNC		0x0080
+#define GL_EXACT		0x0100
+#define GL_SKIP			0x0200
 #define GL_NOCACHE		0x0400
   
 /*
-- 
2.26.3

