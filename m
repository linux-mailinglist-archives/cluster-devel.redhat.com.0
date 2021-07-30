Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id E5D3D3DBE14
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Jul 2021 20:07:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627668459;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=K7suESAC6YUhgW7CJN7q988Ybjf5Z5roRE2o40+b2Sw=;
	b=SFP+95yWL0UybNqXjABOx8P3Yz5d3+IQdKzunWmX3JuJGppV4Sm6vJ0CR0Sb+05JtGSy3j
	y5ickf1G3Ue68aO/AqbBcrwWTXz8UT2b8pavJJFayZmrNbYxpzs9ogyl4Sj8P6mLs97uUZ
	0ZZ1ejsBBO+IE+TpSVPG6nAV4B1Zjbo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-8tk9CaMVPyaUuWudzJfaSw-1; Fri, 30 Jul 2021 14:07:37 -0400
X-MC-Unique: 8tk9CaMVPyaUuWudzJfaSw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA93C8799ED;
	Fri, 30 Jul 2021 18:07:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD02B5D9CA;
	Fri, 30 Jul 2021 18:07:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B2B2C4A7C8;
	Fri, 30 Jul 2021 18:07:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16UI29DJ020836 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Jul 2021 14:02:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E74BA19D9D; Fri, 30 Jul 2021 18:02:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-104.phx2.redhat.com [10.3.112.104])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B59F319C44
	for <cluster-devel@redhat.com>; Fri, 30 Jul 2021 18:02:09 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 30 Jul 2021 13:02:09 -0500
Message-Id: <20210730180209.427386-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: don't stop reads while withdraw in
	progress
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

When gfs2 withdraws a file system, it calls signal_our_withdraw which
triggers another node to replay the withdrawing node's journal. Then it
waits until it knows the journal has been replayed. Part of this wait is
to repeatedly call check_journal_clean which calls gfs2_jdesc_check,
which checks to see if the journal is sane. As part of its sanity checks
it needs to re-read its journal's metadata. But with today's code, any
attempt to re-read the metadata results in -EIO because of a check for
the file system withdraw in function gfs2_meta_wait.

This patch adds an additional check for SDF_WITHDRAW_IN_PROG, to tell
if the read is done while the withdraw is in progress. In that case
we allow the metadata read to not be rejected. Therefore the metadata
check is done properly, so the withdraw sequence can finish normally.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/meta_io.c | 7 +++----
 fs/gfs2/util.h    | 5 +++++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
index 7c9619997355..72d30a682ece 100644
--- a/fs/gfs2/meta_io.c
+++ b/fs/gfs2/meta_io.c
@@ -258,8 +258,7 @@ int gfs2_meta_read(struct gfs2_glock *gl, u64 blkno, int flags,
 	struct buffer_head *bh, *bhs[2];
 	int num = 0;
 
-	if (unlikely(gfs2_withdrawn(sdp)) &&
-	    (!sdp->sd_jdesc || gl != sdp->sd_jinode_gl)) {
+	if (unlikely(gfs2_withdrawn(sdp)) && !gfs2_withdraw_in_prog(sdp)) {
 		*bhp = NULL;
 		return -EIO;
 	}
@@ -317,7 +316,7 @@ int gfs2_meta_read(struct gfs2_glock *gl, u64 blkno, int flags,
 
 int gfs2_meta_wait(struct gfs2_sbd *sdp, struct buffer_head *bh)
 {
-	if (unlikely(gfs2_withdrawn(sdp)))
+	if (unlikely(gfs2_withdrawn(sdp)) && !gfs2_withdraw_in_prog(sdp))
 		return -EIO;
 
 	wait_on_buffer(bh);
@@ -328,7 +327,7 @@ int gfs2_meta_wait(struct gfs2_sbd *sdp, struct buffer_head *bh)
 			gfs2_io_error_bh_wd(sdp, bh);
 		return -EIO;
 	}
-	if (unlikely(gfs2_withdrawn(sdp)))
+	if (unlikely(gfs2_withdrawn(sdp)) && !gfs2_withdraw_in_prog(sdp))
 		return -EIO;
 
 	return 0;
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index 69e1a0ae5a4d..78ec190f4155 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -218,6 +218,11 @@ static inline bool gfs2_withdrawing(struct gfs2_sbd *sdp)
 	       !test_bit(SDF_WITHDRAWN, &sdp->sd_flags);
 }
 
+static inline bool gfs2_withdraw_in_prog(struct gfs2_sbd *sdp)
+{
+	return test_bit(SDF_WITHDRAW_IN_PROG, &sdp->sd_flags);
+}
+
 #define gfs2_tune_get(sdp, field) \
 gfs2_tune_get_i(&(sdp)->sd_tune, &(sdp)->sd_tune.field)
 
-- 
2.31.1

