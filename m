Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5B34330E1EC
	for <lists+cluster-devel@lfdr.de>; Wed,  3 Feb 2021 19:08:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612375695;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JmVjQM7oTofYK7vpIjSK8LdxVImyKuXuZR4N+n6s4uY=;
	b=CGYTHQWAV3wUyRknpcQKWWQzPg0PC3dZ4tZYBaWJAe35g9v5rURuIAXKTb6A0QovQYokOp
	Q8mvlhTcujQ9GAnhE6zrktWtrEgkxaJdyhdui/cVNwyBxwJNUHbw56yQDdS6GhHhnfsR4z
	m7LErFA+mKYCGUe2uZqKOduUxktwu5o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-nH7V5qSgPBGxtumjw0ncew-1; Wed, 03 Feb 2021 13:08:13 -0500
X-MC-Unique: nH7V5qSgPBGxtumjw0ncew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 111E0801965;
	Wed,  3 Feb 2021 18:08:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 006FE5D9F6;
	Wed,  3 Feb 2021 18:08:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF48518095CE;
	Wed,  3 Feb 2021 18:08:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 113I89Y2028577 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 3 Feb 2021 13:08:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1AC3C60D07; Wed,  3 Feb 2021 18:08:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-112-155.ams2.redhat.com [10.36.112.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 64785709B7;
	Wed,  3 Feb 2021 18:08:08 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed,  3 Feb 2021 19:07:43 +0100
Message-Id: <20210203180755.246596-9-agruenba@redhat.com>
In-Reply-To: <20210203180755.246596-1-agruenba@redhat.com>
References: <20210203180755.246596-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v4 08/20] gfs2: Use sb_start_intwrite in
	gfs2_ail_empty_gl
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Commit 2e60d7683c8d ("GFS2: update freeze code to use freeze/thaw_super
on all nodes") optimized away the sb_start_intwrite ... sb_end_intwrite
protection for the on-stack transactions in gfs2_ail_empty_gl with no
explanation.  I can't think of a valid reason for doing that, so revert
that change.  This simplifies the next commit.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glops.c | 5 ++++-
 fs/gfs2/trans.c | 8 +++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 3faa421568b0..fd1f52fff170 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -127,9 +127,12 @@ static int gfs2_ail_empty_gl(struct gfs2_glock *gl)
          * on the stack */
 	tr.tr_reserved = 1 + gfs2_struct2blk(sdp, tr.tr_revokes);
 	tr.tr_ip = _RET_IP_;
+	sb_start_intwrite(sdp->sd_vfs);
 	ret = gfs2_log_reserve(sdp, tr.tr_reserved);
-	if (ret < 0)
+	if (ret < 0) {
+		sb_end_intwrite(sdp->sd_vfs);
 		return ret;
+	}
 	WARN_ON_ONCE(current->journal_info);
 	current->journal_info = &tr;
 
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index 7705f04621f4..ae040b570868 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -98,10 +98,9 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 
 	if (!test_bit(TR_TOUCHED, &tr->tr_flags)) {
 		gfs2_log_release(sdp, tr->tr_reserved);
-		if (alloced) {
+		if (alloced)
 			gfs2_trans_free(sdp, tr);
-			sb_end_intwrite(sdp->sd_vfs);
-		}
+		sb_end_intwrite(sdp->sd_vfs);
 		return;
 	}
 
@@ -121,8 +120,7 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 	if (sdp->sd_vfs->s_flags & SB_SYNCHRONOUS)
 		gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 			       GFS2_LFC_TRANS_END);
-	if (alloced)
-		sb_end_intwrite(sdp->sd_vfs);
+	sb_end_intwrite(sdp->sd_vfs);
 }
 
 static struct gfs2_bufdata *gfs2_alloc_bufdata(struct gfs2_glock *gl,
-- 
2.26.2

