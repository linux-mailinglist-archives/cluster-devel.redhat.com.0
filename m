Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 81E3E4297B2
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Oct 2021 21:40:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633981243;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mUhYOZ4xLiXXpUV10dKMCcxFKWkLNfSdX99AQduQVNo=;
	b=RBLgqwVYRdB6FHkRO3irJLBoQ9AynJePJx+cjfQB+eMxwokNOz6BV7Z4bbVWvlVUv54ls6
	7JF1kBs7nI7W55WtB6THh1iIRJpRWgOOMOLvxBaptu94vaR8ZL3Bvtf6xzp8vze03ipZMN
	oV2kXlkNqYMwfinnA9K8MlCkmIXEwaA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-m0U_WGHBOjW--tJ4UpOeew-1; Mon, 11 Oct 2021 15:40:40 -0400
X-MC-Unique: m0U_WGHBOjW--tJ4UpOeew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 368CE100C619;
	Mon, 11 Oct 2021 19:40:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2617A26DE1;
	Mon, 11 Oct 2021 19:40:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A4C854EA37;
	Mon, 11 Oct 2021 19:40:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19BJeW8q028838 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Oct 2021 15:40:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 51C8B2657D; Mon, 11 Oct 2021 19:40:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-2.phx2.redhat.com [10.3.114.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F8CA2657E
	for <cluster-devel@redhat.com>; Mon, 11 Oct 2021 19:40:32 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 11 Oct 2021 14:40:06 -0500
Message-Id: <20211011194008.50097-12-rpeterso@redhat.com>
In-Reply-To: <20211011194008.50097-1-rpeterso@redhat.com>
References: <20211011194008.50097-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v3 PATCH 11/13] gfs2: Eliminate GIF_INVALID
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

With the addition of the new GLF_INSTANTIATE_NEEDED flag, the
GIF_INVALID flag is now redundant. This patch removes it.
Since inode_instantiate is only called when instantiation is needed,
the check in inode_instantiate is removed too.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glops.c  | 11 +++--------
 fs/gfs2/incore.h |  1 -
 fs/gfs2/inode.c  |  1 -
 fs/gfs2/super.c  |  2 +-
 4 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index e2656baf38a3..0b6a59f71eef 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -356,7 +356,6 @@ static void inode_go_inval(struct gfs2_glock *gl, int flags)
 		struct address_space *mapping = gfs2_glock2aspace(gl);
 		truncate_inode_pages(mapping, 0);
 		if (ip) {
-			set_bit(GIF_INVALID, &ip->i_flags);
 			set_bit(GLF_INSTANTIATE_NEEDED, &gl->gl_flags);
 			forget_all_cached_acls(&ip->i_inode);
 			security_inode_invalidate_secctx(&ip->i_inode);
@@ -477,8 +476,6 @@ int gfs2_inode_refresh(struct gfs2_inode *ip)
 
 	error = gfs2_dinode_in(ip, dibh->b_data);
 	brelse(dibh);
-	clear_bit(GIF_INVALID, &ip->i_flags);
-
 	return error;
 }
 
@@ -499,11 +496,9 @@ static int inode_go_instantiate(struct gfs2_holder *gh)
 	if (!ip) /* no inode to populate - read it in later */
 		goto out;
 
-	if (test_bit(GIF_INVALID, &ip->i_flags)) {
-		error = gfs2_inode_refresh(ip);
-		if (error)
-			goto out;
-	}
+	error = gfs2_inode_refresh(ip);
+	if (error)
+		goto out;
 
 	if (gh->gh_state != LM_ST_DEFERRED)
 		inode_dio_wait(&ip->i_inode);
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index e119b87128f4..183badadac85 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -372,7 +372,6 @@ struct gfs2_glock {
 };
 
 enum {
-	GIF_INVALID		= 0,
 	GIF_QD_LOCKED		= 1,
 	GIF_ALLOC_FAILED	= 2,
 	GIF_SW_PAGED		= 3,
diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 8569142901f6..700f577fe3ff 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -182,7 +182,6 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
 		}
 
 		glock_set_object(ip->i_gl, ip);
-		set_bit(GIF_INVALID, &ip->i_flags);
 		set_bit(GLF_INSTANTIATE_NEEDED, &ip->i_gl->gl_flags);
 		error = gfs2_glock_nq_init(io_gl, LM_ST_SHARED, GL_EXACT, &ip->i_iopen_gh);
 		if (unlikely(error))
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 26c726580041..5b121371508a 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1244,7 +1244,7 @@ static enum dinode_demise evict_should_delete(struct inode *inode,
 	if (ret)
 		return SHOULD_NOT_DELETE_DINODE;
 
-	if (test_bit(GIF_INVALID, &ip->i_flags)) {
+	if (test_bit(GLF_INSTANTIATE_NEEDED, &ip->i_gl->gl_flags)) {
 		ret = gfs2_instantiate(gh);
 		if (ret)
 			return SHOULD_NOT_DELETE_DINODE;
-- 
2.31.1

