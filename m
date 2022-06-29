Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 867745606F6
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Jun 2022 19:06:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656522367;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wE8DzDOiAU9Ke7Y8EDyfaL6xmxw/704sFWAZsK+F3MU=;
	b=bLekCXi8ozMfRLZBwt0usZDwu06tOD9c8ShgVGpf2ei7zCinyHucQbpGrIptRwPOWHs8R4
	rC5Uk5wlnaH87SQfWJ+8pRlYWZf2ctqFjrl88T4k0Vb5uhCLWZewbuho9bbZBYiTKXGenz
	H3QM4ZHHMN+R0+sc/rJh0ntCaX5nm9A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-44BrHCOWOH-UQ2H19K1REQ-1; Wed, 29 Jun 2022 13:06:04 -0400
X-MC-Unique: 44BrHCOWOH-UQ2H19K1REQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EC263C11723;
	Wed, 29 Jun 2022 17:06:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22B951121314;
	Wed, 29 Jun 2022 17:06:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5A1571947072;
	Wed, 29 Jun 2022 17:06:02 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 312B81947058 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Jun 2022 16:37:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1CB69492CA4; Wed, 29 Jun 2022 16:37:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EABE492C3B;
 Wed, 29 Jun 2022 16:37:16 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 29 Jun 2022 18:37:07 +0200
Message-Id: <20220629163711.732931-6-agruenba@redhat.com>
In-Reply-To: <20220629163711.732931-1-agruenba@redhat.com>
References: <20220629163711.732931-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Cluster-devel] [PATCH 5/9] gfs2: Make go_instantiate take a glock
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Make go_instantiate take a glock instead of a glock holder as its argument:
this handler is supposed to instantiate the object associated with the glock.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c  | 2 +-
 fs/gfs2/glops.c  | 3 +--
 fs/gfs2/incore.h | 2 +-
 fs/gfs2/rgrp.c   | 3 +--
 fs/gfs2/rgrp.h   | 2 +-
 5 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 6fe088644d7d..832af9a03b15 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -507,7 +507,7 @@ int gfs2_instantiate(struct gfs2_holder *gh)
 		goto again;
 	}
 
-	ret = glops->go_instantiate(gh);
+	ret = glops->go_instantiate(gl);
 	if (!ret)
 		clear_bit(GLF_INSTANTIATE_NEEDED, &gl->gl_flags);
 	clear_and_wake_up_bit(GLF_INSTANTIATE_IN_PROG, &gl->gl_flags);
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 4e0a9909087c..49210a2e7ce7 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -485,9 +485,8 @@ int gfs2_inode_refresh(struct gfs2_inode *ip)
  * Returns: errno
  */
 
-static int inode_go_instantiate(struct gfs2_holder *gh)
+static int inode_go_instantiate(struct gfs2_glock *gl)
 {
-	struct gfs2_glock *gl = gh->gh_gl;
 	struct gfs2_inode *ip = gl->gl_object;
 
 	if (!ip) /* no inode to populate - read it in later */
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 15e4258a1dad..d09d9892cd05 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -219,7 +219,7 @@ struct gfs2_glock_operations {
 	int (*go_xmote_bh)(struct gfs2_glock *gl);
 	void (*go_inval) (struct gfs2_glock *gl, int flags);
 	int (*go_demote_ok) (const struct gfs2_glock *gl);
-	int (*go_instantiate) (struct gfs2_holder *gh);
+	int (*go_instantiate) (struct gfs2_glock *gl);
 	int (*go_held)(struct gfs2_holder *gh);
 	void (*go_dump)(struct seq_file *seq, struct gfs2_glock *gl,
 			const char *fs_id_buf);
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 8a63870eef5a..5439bad3083e 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1196,9 +1196,8 @@ static void rgrp_set_bitmap_flags(struct gfs2_rgrpd *rgd)
  * Returns: errno
  */
 
-int gfs2_rgrp_go_instantiate(struct gfs2_holder *gh)
+int gfs2_rgrp_go_instantiate(struct gfs2_glock *gl)
 {
-	struct gfs2_glock *gl = gh->gh_gl;
 	struct gfs2_rgrpd *rgd = gl->gl_object;
 	struct gfs2_sbd *sdp = rgd->rd_sbd;
 	unsigned int length = rgd->rd_length;
diff --git a/fs/gfs2/rgrp.h b/fs/gfs2/rgrp.h
index 46dd94e9e085..c75bac45d314 100644
--- a/fs/gfs2/rgrp.h
+++ b/fs/gfs2/rgrp.h
@@ -31,7 +31,7 @@ extern struct gfs2_rgrpd *gfs2_rgrpd_get_next(struct gfs2_rgrpd *rgd);
 extern void gfs2_clear_rgrpd(struct gfs2_sbd *sdp);
 extern int gfs2_rindex_update(struct gfs2_sbd *sdp);
 extern void gfs2_free_clones(struct gfs2_rgrpd *rgd);
-extern int gfs2_rgrp_go_instantiate(struct gfs2_holder *gh);
+extern int gfs2_rgrp_go_instantiate(struct gfs2_glock *gl);
 extern void gfs2_rgrp_brelse(struct gfs2_rgrpd *rgd);
 
 extern struct gfs2_alloc *gfs2_alloc_get(struct gfs2_inode *ip);
-- 
2.35.1

