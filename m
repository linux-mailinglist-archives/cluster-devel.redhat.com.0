Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 916143065A9
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Jan 2021 22:11:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611781914;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5vxotwa767aGOUP1R66I5dpFQHqbmkRVY0f3GOH64qk=;
	b=hgj1lYxTd0sENXyDumDcgmKQiadGrfL/6Ih4PwVnfld71emWsaL3dyIz4iW1e/H8WVVC2X
	wfm3f2h00dw+T9HtFmNHojxUQRxluzWE60vDrJmWlv7cTxM+M1HugVamaAJTh0bjcEkgZL
	LN4eMbRqhmaBkeDR4V/kXGZLsSUV9Zo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-jGxMIxj1M5SSNQxrXouDSA-1; Wed, 27 Jan 2021 16:11:52 -0500
X-MC-Unique: jGxMIxj1M5SSNQxrXouDSA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37789100C60D;
	Wed, 27 Jan 2021 21:11:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 276A0722E0;
	Wed, 27 Jan 2021 21:11:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0B61B1809CA7;
	Wed, 27 Jan 2021 21:11:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10RL7rdi013754 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 Jan 2021 16:07:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C42042BFE9; Wed, 27 Jan 2021 21:07:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 060A11F0;
	Wed, 27 Jan 2021 21:07:52 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 27 Jan 2021 22:07:28 +0100
Message-Id: <20210127210746.16958-3-agruenba@redhat.com>
In-Reply-To: <20210127210746.16958-1-agruenba@redhat.com>
References: <20210127210746.16958-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v3 02/20] gfs2: Simplify the buf_limit and
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

