Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C47E55ECB9
	for <lists+cluster-devel@lfdr.de>; Tue, 28 Jun 2022 20:39:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656441562;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sFS4CJCW/LKMmKNJhR2GW63MgTjEXtPvK2Wy9D9NDnE=;
	b=SUvWisim2qjTnP54YEqYRXgkZBzefyS0OZnWHMjIX5UPmQeu/a/QvKEff0XApWHxcwdQ1F
	cLO6G/DtPI/Uhr/tom5/X5z9aLz3dxZUvUsdFW47ohrLFmhS8b1wrY/QOqmhziswiHUP2C
	IVBf0P4ExP66ph4vnv93FIiBwSWPTro=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-e19Ukvi2OoKVBkAHQ_6Pog-1; Tue, 28 Jun 2022 14:39:09 -0400
X-MC-Unique: e19Ukvi2OoKVBkAHQ_6Pog-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8442185A7A4;
	Tue, 28 Jun 2022 18:39:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BBD661415108;
	Tue, 28 Jun 2022 18:39:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 76FC81947062;
	Tue, 28 Jun 2022 18:39:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CBBCF19466DF for <cluster-devel@listman.corp.redhat.com>;
 Tue, 28 Jun 2022 18:39:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AE9631121314; Tue, 28 Jun 2022 18:39:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27D21112131B;
 Tue, 28 Jun 2022 18:39:06 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 28 Jun 2022 20:39:05 +0200
Message-Id: <20220628183905.641284-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [PATCH] gfs2: Minor gfs2_glock_nq_m cleanup
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add state and flags arguments to gfs2_rlist_alloc() to make it somewhat more
obvious which state and flags an rlist uses.  With that, stop knocking off
flags in gfs2_glock_nq_m() and its nq_m_sync() helper that are never set in the
first place.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/dir.c   | 2 +-
 fs/gfs2/glock.c | 6 +-----
 fs/gfs2/rgrp.c  | 9 ++++++---
 fs/gfs2/rgrp.h  | 3 ++-
 fs/gfs2/xattr.c | 2 +-
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
index 42b7dfffb5e7..df938b8c8359 100644
--- a/fs/gfs2/dir.c
+++ b/fs/gfs2/dir.c
@@ -2017,7 +2017,7 @@ static int leaf_dealloc(struct gfs2_inode *dip, u32 index, u32 len,
 		l_blocks++;
 	}
 
-	gfs2_rlist_alloc(&rlist);
+	gfs2_rlist_alloc(&rlist, LM_ST_EXCLUSIVE, LM_FLAG_NODE_SCOPE);
 
 	for (x = 0; x < rlist.rl_rgrps; x++) {
 		struct gfs2_rgrpd *rgd = gfs2_glock2rgrp(rlist.rl_ghs[x].gh_gl);
diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index b3259c8e6dad..e540d1290099 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1780,7 +1780,7 @@ static int glock_compare(const void *arg_a, const void *arg_b)
 }
 
 /**
- * nq_m_sync - synchonously acquire more than one glock in deadlock free order
+ * nq_m_sync - synchronously acquire more than one glock in deadlock free order
  * @num_gh: the number of structures
  * @ghs: an array of struct gfs2_holder structures
  * @p: placeholder for the holder structure to pass back
@@ -1801,8 +1801,6 @@ static int nq_m_sync(unsigned int num_gh, struct gfs2_holder *ghs,
 	sort(p, num_gh, sizeof(struct gfs2_holder *), glock_compare, NULL);
 
 	for (x = 0; x < num_gh; x++) {
-		p[x]->gh_flags &= ~(LM_FLAG_TRY | GL_ASYNC);
-
 		error = gfs2_glock_nq(p[x]);
 		if (error) {
 			while (x--)
@@ -1819,7 +1817,6 @@ static int nq_m_sync(unsigned int num_gh, struct gfs2_holder *ghs,
  * @num_gh: the number of structures
  * @ghs: an array of struct gfs2_holder structures
  *
- *
  * Returns: 0 on success (all glocks acquired),
  *          errno on failure (no glocks acquired)
  */
@@ -1834,7 +1831,6 @@ int gfs2_glock_nq_m(unsigned int num_gh, struct gfs2_holder *ghs)
 	case 0:
 		return 0;
 	case 1:
-		ghs->gh_flags &= ~(LM_FLAG_TRY | GL_ASYNC);
 		return gfs2_glock_nq(ghs);
 	default:
 		if (num_gh <= 4)
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 8a63870eef5a..b9b8faefbe84 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -2720,12 +2720,15 @@ void gfs2_rlist_add(struct gfs2_inode *ip, struct gfs2_rgrp_list *rlist,
  * gfs2_rlist_alloc - all RGs have been added to the rlist, now allocate
  *      and initialize an array of glock holders for them
  * @rlist: the list of resource groups
+ * @state: the state we're requesting
+ * @flags: the modifier flags
  *
  * FIXME: Don't use NOFAIL
  *
  */
 
-void gfs2_rlist_alloc(struct gfs2_rgrp_list *rlist)
+void gfs2_rlist_alloc(struct gfs2_rgrp_list *rlist,
+		      unsigned int state, u16 flags)
 {
 	unsigned int x;
 
@@ -2733,8 +2736,8 @@ void gfs2_rlist_alloc(struct gfs2_rgrp_list *rlist)
 				      sizeof(struct gfs2_holder),
 				      GFP_NOFS | __GFP_NOFAIL);
 	for (x = 0; x < rlist->rl_rgrps; x++)
-		gfs2_holder_init(rlist->rl_rgd[x]->rd_gl, LM_ST_EXCLUSIVE,
-				 LM_FLAG_NODE_SCOPE, &rlist->rl_ghs[x]);
+		gfs2_holder_init(rlist->rl_rgd[x]->rd_gl, state, flags,
+				 &rlist->rl_ghs[x]);
 }
 
 /**
diff --git a/fs/gfs2/rgrp.h b/fs/gfs2/rgrp.h
index 46dd94e9e085..fd6ee8bfe18d 100644
--- a/fs/gfs2/rgrp.h
+++ b/fs/gfs2/rgrp.h
@@ -64,7 +64,8 @@ struct gfs2_rgrp_list {
 
 extern void gfs2_rlist_add(struct gfs2_inode *ip, struct gfs2_rgrp_list *rlist,
 			   u64 block);
-extern void gfs2_rlist_alloc(struct gfs2_rgrp_list *rlist);
+extern void gfs2_rlist_alloc(struct gfs2_rgrp_list *rlist,
+			     unsigned int state, u16 flags);
 extern void gfs2_rlist_free(struct gfs2_rgrp_list *rlist);
 extern u64 gfs2_ri_total(struct gfs2_sbd *sdp);
 extern void gfs2_rgrp_dump(struct seq_file *seq, struct gfs2_rgrpd *rgd,
diff --git a/fs/gfs2/xattr.c b/fs/gfs2/xattr.c
index 0c5650fe1fd1..f6a66050380e 100644
--- a/fs/gfs2/xattr.c
+++ b/fs/gfs2/xattr.c
@@ -1313,7 +1313,7 @@ static int ea_dealloc_indirect(struct gfs2_inode *ip)
 	else
 		goto out;
 
-	gfs2_rlist_alloc(&rlist);
+	gfs2_rlist_alloc(&rlist, LM_ST_EXCLUSIVE, LM_FLAG_NODE_SCOPE);
 
 	for (x = 0; x < rlist.rl_rgrps; x++) {
 		rgd = gfs2_glock2rgrp(rlist.rl_ghs[x].gh_gl);
-- 
2.35.1

