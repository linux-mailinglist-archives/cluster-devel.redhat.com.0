Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A68526AE9
	for <lists+cluster-devel@lfdr.de>; Wed, 22 May 2019 21:22:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C6FB3079B62;
	Wed, 22 May 2019 19:22:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A5F61001E73;
	Wed, 22 May 2019 19:22:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B296A54D3D;
	Wed, 22 May 2019 19:22:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4MJLqje004072 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 22 May 2019 15:21:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 45DF81001E80; Wed, 22 May 2019 19:21:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D8271001E81;
	Wed, 22 May 2019 19:21:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 85C665D672;
	Wed, 22 May 2019 19:21:33 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7D20F217D9;
	Wed, 22 May 2019 19:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558552885;
	bh=ArSHjs28NdkfbTowzn7Wt6gNKxncZUHW8jAxRtOEqXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=2I6H0gJ2SxVpooePrIkWJ84WThPuWAjVpkULP4Jw1UclrTdZ6xXvD6kzwpX9WBuLZ
	oQvDeisgACpaPXftDCNRQyTNvHhAzrBDAFjT3L79VxpXJBf1Rt/IQ/LihlKkbOEGQy
	yoGrxp/TnIFQ+z2ffVbWTT6340pVdSgiV98QlpHw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Wed, 22 May 2019 15:15:08 -0400
Message-Id: <20190522192115.22666-8-sashal@kernel.org>
In-Reply-To: <20190522192115.22666-1-sashal@kernel.org>
References: <20190522192115.22666-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 22 May 2019 19:21:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Wed, 22 May 2019 19:21:33 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'sashal@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<sashal@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Sasha Levin <sashal@kernel.org>
Subject: [Cluster-devel] [PATCH AUTOSEL 5.1 008/375] gfs2: Fix occasional
	glock use-after-free
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Wed, 22 May 2019 19:22:34 +0000 (UTC)

From: Andreas Gruenbacher <agruenba@redhat.com>

[ Upstream commit 9287c6452d2b1f24ea8e84bd3cf6f3c6f267f712 ]

This patch has to do with the life cycle of glocks and buffers.  When
gfs2 metadata or journaled data is queued to be written, a gfs2_bufdata
object is assigned to track the buffer, and that is queued to various
lists, including the glock's gl_ail_list to indicate it's on the active
items list.  Once the page associated with the buffer has been written,
it is removed from the ail list, but its life isn't over until a revoke
has been successfully written.

So after the block is written, its bufdata object is moved from the
glock's gl_ail_list to a file-system-wide list of pending revokes,
sd_log_le_revoke.  At that point the glock still needs to track how many
revokes it contributed to that list (in gl_revokes) so that things like
glock go_sync can ensure all the metadata has been not only written, but
also revoked before the glock is granted to a different node.  This is
to guarantee journal replay doesn't replay the block once the glock has
been granted to another node.

Ross Lagerwall recently discovered a race in which an inode could be
evicted, and its glock freed after its ail list had been synced, but
while it still had unwritten revokes on the sd_log_le_revoke list.  The
evict decremented the glock reference count to zero, which allowed the
glock to be freed.  After the revoke was written, function
revoke_lo_after_commit tried to adjust the glock's gl_revokes counter
and clear its GLF_LFLUSH flag, at which time it referenced the freed
glock.

This patch fixes the problem by incrementing the glock reference count
in gfs2_add_revoke when the glock's first bufdata object is moved from
the glock to the global revokes list. Later, when the glock's last such
bufdata object is freed, the reference count is decremented. This
guarantees that whichever process finishes last (the revoke writing or
the evict) will properly free the glock, and neither will reference the
glock after it has been freed.

Reported-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/glock.c | 1 +
 fs/gfs2/log.c   | 3 ++-
 fs/gfs2/lops.c  | 6 ++++--
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index e4f6d39500bcc..71c28ff98b564 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -140,6 +140,7 @@ void gfs2_glock_free(struct gfs2_glock *gl)
 {
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 
+	BUG_ON(atomic_read(&gl->gl_revokes));
 	rhashtable_remove_fast(&gl_hash_table, &gl->gl_node, ht_parms);
 	smp_mb();
 	wake_up_glock(gl);
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index b8830fda51e8f..0e04f87a7dddb 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -606,7 +606,8 @@ void gfs2_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd)
 	gfs2_remove_from_ail(bd); /* drops ref on bh */
 	bd->bd_bh = NULL;
 	sdp->sd_log_num_revoke++;
-	atomic_inc(&gl->gl_revokes);
+	if (atomic_inc_return(&gl->gl_revokes) == 1)
+		gfs2_glock_hold(gl);
 	set_bit(GLF_LFLUSH, &gl->gl_flags);
 	list_add(&bd->bd_list, &sdp->sd_log_le_revoke);
 }
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 8722c60b11feb..4b280611246df 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -669,8 +669,10 @@ static void revoke_lo_after_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 		bd = list_entry(head->next, struct gfs2_bufdata, bd_list);
 		list_del_init(&bd->bd_list);
 		gl = bd->bd_gl;
-		atomic_dec(&gl->gl_revokes);
-		clear_bit(GLF_LFLUSH, &gl->gl_flags);
+		if (atomic_dec_return(&gl->gl_revokes) == 0) {
+			clear_bit(GLF_LFLUSH, &gl->gl_flags);
+			gfs2_glock_queue_put(gl);
+		}
 		kmem_cache_free(gfs2_bufdata_cachep, bd);
 	}
 }
-- 
2.20.1

