Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDFC6FE463
	for <lists+cluster-devel@lfdr.de>; Wed, 10 May 2023 21:08:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683745706;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=n2CKUP+g/F/aYCwMJgS7G5sNnZD5cInGZYroLgPJzj0=;
	b=Yle5W6dW1TOPJXI8nnW3LBS6igGBEgCgk3uSNLmDMzUEWmGzukkNJTWrcJymn3GwQoOSoT
	77l2L3pSVY4nK61RY+zg7W38NtiFuFqgz0EXgOIN8S4VYfAIcRJ4jvBwiCG/TYH+WzHVf9
	dLZZ95QxLbG2qinLDQWw66Lu2nP/dNY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-OIPEDN-RNiy3vDeE347DKw-1; Wed, 10 May 2023 15:08:23 -0400
X-MC-Unique: OIPEDN-RNiy3vDeE347DKw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63BBC88D023;
	Wed, 10 May 2023 19:08:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F0D11410DD5;
	Wed, 10 May 2023 19:08:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 10ABC19451C0;
	Wed, 10 May 2023 19:08:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5B0041946A45 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 10 May 2023 19:08:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 10DC940C2077; Wed, 10 May 2023 19:08:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.ipa.redhat.com (unknown [10.22.32.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB34240C2076
 for <cluster-devel@redhat.com>; Wed, 10 May 2023 19:08:18 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 10 May 2023 15:08:18 -0400
Message-Id: <20230510190818.125286-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH] gfs2: Don't free rgrp clone bitmaps until
 go_inval
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Before this patch, every time an rgrp was synced (go_sync) the
clone bitmaps were freed. We do not need to free the bitmaps in many
common cases. For example when demoting the glock from EXCLUSIVE to
SHARED. This is especially wasteful in cases where we unlink lots of
files: the rgrps are transitioned to EX, then back to SH multiple
times as it looks at the dinode allocation states, then frees them,
but the clones prevent allocations until the files are evicted.
Subsequent uses often cause the rgrp glock to be transitioned from
SH to EX and back again in rapid succession.

In these cases it's proper to sync the rgrp bitmaps to the storage media
but wasteful to free the clones, because the very next unlink needs to
reallocate the clone bitmaps again. So in short, today we have:

1. SH->EX (for unlink or other)
2. Allocate (kmalloc) a clone bitmap.
3. Clear the bits in original bitmap.
4. Keep original state in the clone bitmap to prevent re-allocation
   until the last user closes the file.
5. EX->SH
6. Sync bitmap to storage media.
7. Free the clone bitmaps.
8. Go to 1.

This repeated kmalloc -> kfree -> kmalloc -> kfree is a waste of time:
We only need to free the clone bitmaps when the glock is invalidated
(i.e. when transitioning the glock to UN or DF so another node's view
is consistent.) However, we still need to re-sync the clones with the
real bitmap. This patch allows rgrp bitmaps to stick around until we
have an invalidate of the glock. So in short:

1. SH->EX (for unlink or other)
2. Only the first time, allocate (kmalloc) a clone bitmap.
3. Free the bits in original bitmap.
4. Keep original state in the clone bitmap to prevent re-allocation
   until the last user closes the file.
5. EX->SH
6. Sync bitmap to storage media.
7. Go to 1.

Other transitions, like EX->UN still sync and free the clone bitmaps.
And, of course, transition from SH->EX cannot have dirty buffers, so
will not have clone bitmaps.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glops.c |  4 +++-
 fs/gfs2/rgrp.c  | 13 +++++++++++++
 fs/gfs2/rgrp.h  |  1 +
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 01d433ed6ce7..58cf2004548e 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -205,7 +205,8 @@ static int rgrp_go_sync(struct gfs2_glock *gl)
 	error = gfs2_rgrp_metasync(gl);
 	if (!error)
 		error = gfs2_ail_empty_gl(gl);
-	gfs2_free_clones(rgd);
+	if (!test_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags))
+		gfs2_sync_clones(rgd);
 	return error;
 }
 
@@ -229,6 +230,7 @@ static void rgrp_go_inval(struct gfs2_glock *gl, int flags)
 
 	if (!rgd)
 		return;
+	gfs2_free_clones(rgd);
 	start = (rgd->rd_addr * bsize) & PAGE_MASK;
 	end = PAGE_ALIGN((rgd->rd_addr + rgd->rd_length) * bsize) - 1;
 	gfs2_rgrp_brelse(rgd);
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 3b9b76e980ad..6e212e0eb74e 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -616,6 +616,19 @@ void gfs2_free_clones(struct gfs2_rgrpd *rgd)
 	}
 }
 
+void gfs2_sync_clones(struct gfs2_rgrpd *rgd)
+{
+	int x;
+
+	for (x = 0; x < rgd->rd_length; x++) {
+		struct gfs2_bitmap *bi = rgd->rd_bits + x;
+		if (bi->bi_clone)
+			memcpy(bi->bi_clone + bi->bi_offset,
+			       bi->bi_bh->b_data + bi->bi_offset,
+			       bi->bi_bytes);
+	}
+}
+
 static void dump_rs(struct seq_file *seq, const struct gfs2_blkreserv *rs,
 		    const char *fs_id_buf)
 {
diff --git a/fs/gfs2/rgrp.h b/fs/gfs2/rgrp.h
index 00b30cf893af..254188cf2d7b 100644
--- a/fs/gfs2/rgrp.h
+++ b/fs/gfs2/rgrp.h
@@ -32,6 +32,7 @@ extern void gfs2_clear_rgrpd(struct gfs2_sbd *sdp);
 extern int gfs2_rindex_update(struct gfs2_sbd *sdp);
 extern void gfs2_free_clones(struct gfs2_rgrpd *rgd);
 extern int gfs2_rgrp_go_instantiate(struct gfs2_glock *gl);
+extern void gfs2_sync_clones(struct gfs2_rgrpd *rgd);
 extern void gfs2_rgrp_brelse(struct gfs2_rgrpd *rgd);
 
 extern struct gfs2_alloc *gfs2_alloc_get(struct gfs2_inode *ip);
-- 
2.40.1

