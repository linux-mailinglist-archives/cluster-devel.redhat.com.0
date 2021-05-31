Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1AABD39664F
	for <lists+cluster-devel@lfdr.de>; Mon, 31 May 2021 19:01:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622480516;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0KKzZ4Pnlj7CSEmGXCGwC261e/Tx/i3YqW/wwa1VS6k=;
	b=i3rk6+tHP6gAhF/pcIwxONMpiNAcnLtSg1pdkhTVziAnCWBq+2vi7VIqW+vgsMbhH/bcjg
	mh6E0ol1j6aBut1tUW3zUWpk8xonIQMn2pHOmokX8HD27HZwWEb9q5f/Nf73PMbSzGcjUJ
	j8cdLfi9sQ+82YP8kWWIGxtzUGmAXq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-QBJpfsarM4aQL_bF6mUkfA-1; Mon, 31 May 2021 13:01:54 -0400
X-MC-Unique: QBJpfsarM4aQL_bF6mUkfA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09362106BAEE;
	Mon, 31 May 2021 17:01:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EADB75D747;
	Mon, 31 May 2021 17:01:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D724455347;
	Mon, 31 May 2021 17:01:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14VH1qaj019153 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 31 May 2021 13:01:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 29F142BFDE; Mon, 31 May 2021 17:01:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.192.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7BE626062C;
	Mon, 31 May 2021 17:01:50 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 May 2021 19:01:21 +0200
Message-Id: <20210531170123.243771-8-agruenba@redhat.com>
In-Reply-To: <20210531170123.243771-1-agruenba@redhat.com>
References: <20210531170123.243771-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [Cluster-devel] [RFC 7/9] gfs2: Encode glock holding and retry
	flags in journal_info
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Use the lowest two bits in current->journal_info to encode when
we're holding a glock, and when an operation holding a glock
needs to be retried.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/incore.h | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index aa8d1a23132d..e32433df119c 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -871,14 +871,45 @@ static inline unsigned gfs2_max_stuffed_size(const struct gfs2_inode *ip)
 	return GFS2_SB(&ip->i_inode)->sd_sb.sb_bsize - sizeof(struct gfs2_dinode);
 }
 
+/*
+ * Transactions are always memory aligned, so we use bit 0 of
+ * current->journal_info to indicate when we're holding a glock and so taking
+ * random additional glocks might deadlock, and bit 1 to indicate when such an
+ * operation needs to be retried after dropping and re-acquiring that "outer"
+ * glock.
+ */
+
 static inline struct gfs2_trans *current_trans(void)
 {
-	return current->journal_info;
+	return (void *)((long)current->journal_info & ~3);
 }
 
 static inline void set_current_trans(struct gfs2_trans *tr)
 {
-	current->journal_info = tr;
+	long flags = (long)current->journal_info & 3;
+	current->journal_info = (void *)((long)tr | flags);
+}
+
+static inline bool current_holds_glock(void)
+{
+	return (long)current->journal_info & 1;
+}
+
+static inline bool current_needs_retry(void)
+{
+	return (long)current->journal_info & 2;
+}
+
+static inline void set_current_holds_glock(bool b)
+{
+	current->journal_info =
+		(void *)(((long)current->journal_info & ~1) | b);
+}
+
+static inline void set_current_needs_retry(bool b)
+{
+	current->journal_info =
+		(void *)(((long)current->journal_info & ~2) | (b << 1));
 }
 
 #endif /* __INCORE_DOT_H__ */
-- 
2.26.3

