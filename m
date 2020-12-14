Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id F2D872D9461
	for <lists+cluster-devel@lfdr.de>; Mon, 14 Dec 2020 09:55:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607936103;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5vxotwa767aGOUP1R66I5dpFQHqbmkRVY0f3GOH64qk=;
	b=ienxgfm7vfBLFvp3sTtZOjhMFdXvBdUC7wIq088YAqoDVOX6WmUKNh0zGhoCvr+Mo5zxwx
	5sSnLh9hrNkw5PznkCUb6Ywfig7kQRI7aHkRDWqVH58Mo66//xcQtjlf7Q8OB5uaPRpY4A
	qVPfcrrQUHjJ1ZSH3fSemK2DIRxr85o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-LGtH7U0EOPu77ogCaAKR4g-1; Mon, 14 Dec 2020 03:55:01 -0500
X-MC-Unique: LGtH7U0EOPu77ogCaAKR4g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A11D6107ACFA;
	Mon, 14 Dec 2020 08:54:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B82A36FA;
	Mon, 14 Dec 2020 08:54:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B84D64EEF6;
	Mon, 14 Dec 2020 08:54:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BE8sosB016387 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 14 Dec 2020 03:54:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 885A76268D; Mon, 14 Dec 2020 08:54:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.194])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C274B6267C;
	Mon, 14 Dec 2020 08:54:49 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 14 Dec 2020 09:54:32 +0100
Message-Id: <20201214085442.45467-3-agruenba@redhat.com>
In-Reply-To: <20201214085442.45467-1-agruenba@redhat.com>
References: <20201214085442.45467-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 02/12] gfs2: Simplify the buf_limit and
	databuf_limit definitions
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

The BUF_OFFSET and DATABUF_OFFSET definitions are only used in buf_limit
and databuf_limit, respectively, and the rounding done in those
definitions is immediately wiped out by dividing by the element size.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/lops.h | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/fs/gfs2/lops.h b/fs/gfs2/lops.h
index fbdbb08dcec6..3fca5bf239d3 100644
--- a/fs/gfs2/lops.h
+++ b/fs/gfs2/lops.h
@@ -10,13 +10,6 @@
 #include <linux/list.h>
 #include "incore.h"
 
-#define BUF_OFFSET \
-	((sizeof(struct gfs2_log_descriptor) + sizeof(__be64) - 1) & \
-	 ~(sizeof(__be64) - 1))
-#define DATABUF_OFFSET \
-	((sizeof(struct gfs2_log_descriptor) + (2 * sizeof(__be64) - 1)) & \
-	 ~(2 * sizeof(__be64) - 1))
-
 extern const struct gfs2_log_operations *gfs2_log_ops[];
 extern void gfs2_log_incr_head(struct gfs2_sbd *sdp);
 extern u64 gfs2_log_bmap(struct gfs2_jdesc *jd, unsigned int lbn);
@@ -29,18 +22,12 @@ extern int gfs2_find_jhead(struct gfs2_jdesc *jd,
 			   struct gfs2_log_header_host *head, bool keep_cache);
 static inline unsigned int buf_limit(struct gfs2_sbd *sdp)
 {
-	unsigned int limit;
-
-	limit = (sdp->sd_sb.sb_bsize - BUF_OFFSET) / sizeof(__be64);
-	return limit;
+	return sdp->sd_ldptrs;
 }
 
 static inline unsigned int databuf_limit(struct gfs2_sbd *sdp)
 {
-	unsigned int limit;
-
-	limit = (sdp->sd_sb.sb_bsize - DATABUF_OFFSET) / (2 * sizeof(__be64));
-	return limit;
+	return sdp->sd_ldptrs / 2;
 }
 
 static inline void lops_before_commit(struct gfs2_sbd *sdp,
-- 
2.26.2

