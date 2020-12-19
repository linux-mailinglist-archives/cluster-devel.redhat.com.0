Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 429A92DF199
	for <lists+cluster-devel@lfdr.de>; Sat, 19 Dec 2020 21:49:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608410951;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5vxotwa767aGOUP1R66I5dpFQHqbmkRVY0f3GOH64qk=;
	b=Ci62Wb+dZy3P5ZFIvnuz0BxlMLFAEa7JD8eTiU6MUu9LSn4jdjS6OWPJ0zTTDc3Thoqy3Q
	7s3KH/RCZAi2bg5oCkmh/FU/2DkwNUUujoi42ltupJVYMm/PnGO2aSq3p7dbBnlZtKqOl2
	H2i29PCFt065RUrdRyitZHjkL+GGLzk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-KDR3ZmiOMnqqoAhJuoQRvw-1; Sat, 19 Dec 2020 15:49:09 -0500
X-MC-Unique: KDR3ZmiOMnqqoAhJuoQRvw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5742E180A095;
	Sat, 19 Dec 2020 20:49:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 455C960C05;
	Sat, 19 Dec 2020 20:49:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EC53F1809CA2;
	Sat, 19 Dec 2020 20:49:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BJKn0BJ020100 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 19 Dec 2020 15:49:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 984D839A4E; Sat, 19 Dec 2020 20:49:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (ovpn-115-196.ams2.redhat.com [10.36.115.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C0C550A8B;
	Sat, 19 Dec 2020 20:48:59 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Sat, 19 Dec 2020 21:48:30 +0100
Message-Id: <20201219204848.285781-3-agruenba@redhat.com>
In-Reply-To: <20201219204848.285781-1-agruenba@redhat.com>
References: <20201219204848.285781-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v2 02/20] gfs2: Simplify the buf_limit and
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

