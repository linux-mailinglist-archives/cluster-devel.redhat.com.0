Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF8748CC03
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jan 2022 20:32:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642015929;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ACSD+Qac+jRJ4+R1Vawp7bh347r6zATPaRguG6maczY=;
	b=Z+071Hcrj7NNlmBqY1xQLNvNbeuhBQpeGF1EU4l98a3Q9wstJYvEnX/e7S6+6znhfvF2d1
	36+KBNiAZiMZScSAFdyHJSr2stqq5UWsOT5OYdbF/C83KKLUjzFIhGO+RMZsiZBicb+Si3
	GTUJTGL8ojG7QICb5WULSJOkejLM5F4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-oHbzTfA7OZS-QTRhsGyfdQ-1; Wed, 12 Jan 2022 14:30:14 -0500
X-MC-Unique: oHbzTfA7OZS-QTRhsGyfdQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32D81344E0;
	Wed, 12 Jan 2022 19:27:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2392660C9F;
	Wed, 12 Jan 2022 19:27:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D9D51806D03;
	Wed, 12 Jan 2022 19:27:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20CJR2fM009273 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jan 2022 14:27:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 78A072B178; Wed, 12 Jan 2022 19:27:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB45560BD8
	for <cluster-devel@redhat.com>; Wed, 12 Jan 2022 19:27:01 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 12 Jan 2022 19:26:35 +0000
Message-Id: <20220112192650.1426415-4-anprice@redhat.com>
In-Reply-To: <20220112192650.1426415-1-anprice@redhat.com>
References: <20220112192650.1426415-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 03/18] libgfs2: Move build_jindex() into
	fsck.gfs2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

fsck.gfs2 is the only remaining util that builds journals this way so
move it out of libgfs2. The debug printfs can be removed because
fsck.gfs2 doesn't enable libgfs2's cfg_debug.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/fsck/fs_recovery.c   | 21 +++++++++++++++++++++
 gfs2/fsck/fs_recovery.h   |  1 +
 gfs2/fsck/pass2.c         |  1 +
 gfs2/libgfs2/libgfs2.h    |  1 -
 gfs2/libgfs2/structures.c | 29 -----------------------------
 5 files changed, 23 insertions(+), 30 deletions(-)

diff --git a/gfs2/fsck/fs_recovery.c b/gfs2/fsck/fs_recovery.c
index 48d98626..e5cde051 100644
--- a/gfs2/fsck/fs_recovery.c
+++ b/gfs2/fsck/fs_recovery.c
@@ -848,6 +848,27 @@ static struct metawalk_fxns jindex_check_fxns = {
 	.check_dentry = check_jindex_dent,
 };
 
+int build_jindex(struct gfs2_sbd *sdp)
+{
+	struct gfs2_inode *jindex;
+
+	jindex = createi(sdp->master_dir, "jindex", S_IFDIR | 0700,
+			 GFS2_DIF_SYSTEM);
+	if (jindex == NULL) {
+		return errno;
+	}
+	sdp->md.journal = malloc(sdp->md.journals * sizeof(struct gfs2_inode *));
+	for (unsigned j = 0; j < sdp->md.journals; j++) {
+		int ret = build_journal(sdp, j, jindex);
+		if (ret)
+			return ret;
+		inode_put(&sdp->md.journal[j]);
+	}
+	free(sdp->md.journal);
+	inode_put(&jindex);
+	return 0;
+}
+
 /**
  * init_jindex - read in the rindex file
  */
diff --git a/gfs2/fsck/fs_recovery.h b/gfs2/fsck/fs_recovery.h
index d6876274..884d3c43 100644
--- a/gfs2/fsck/fs_recovery.h
+++ b/gfs2/fsck/fs_recovery.h
@@ -8,6 +8,7 @@ extern int replay_journals(struct gfs2_sbd *sdp, int preen, int force_check,
 extern int preen_is_safe(struct gfs2_sbd *sdp, int preen, int force_check);
 
 extern int ji_update(struct gfs2_sbd *sdp);
+extern int build_jindex(struct gfs2_sbd *sdp);
 extern int init_jindex(struct gfs2_sbd *sdp, int allow_ji_rebuild);
 #endif /* __FS_RECOVERY_H__ */
 
diff --git a/gfs2/fsck/pass2.c b/gfs2/fsck/pass2.c
index 998b0c96..0ab35b55 100644
--- a/gfs2/fsck/pass2.c
+++ b/gfs2/fsck/pass2.c
@@ -18,6 +18,7 @@
 #include "lost_n_found.h"
 #include "inode_hash.h"
 #include "afterpass1_common.h"
+#include "fs_recovery.h"
 
 #define MAX_FILENAME 256
 
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 990a9d9e..9a66b5b3 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -776,7 +776,6 @@ extern int build_master(struct gfs2_sbd *sdp);
 extern int lgfs2_sb_write(const struct gfs2_sbd *sdp, int fd);
 extern int build_journal(struct gfs2_sbd *sdp, int j,
 			 struct gfs2_inode *jindex);
-extern int build_jindex(struct gfs2_sbd *sdp);
 extern struct gfs2_inode *lgfs2_build_jindex(struct gfs2_inode *metafs, struct lgfs2_inum *jnls, size_t nmemb);
 extern int build_per_node(struct gfs2_sbd *sdp);
 extern int build_inum(struct gfs2_sbd *sdp);
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index de36c4e3..09d7041e 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -279,35 +279,6 @@ struct gfs2_inode *lgfs2_build_jindex(struct gfs2_inode *master, struct lgfs2_in
 	return jindex;
 }
 
-int build_jindex(struct gfs2_sbd *sdp)
-{
-	struct gfs2_inode *jindex;
-	unsigned int j;
-	int ret;
-
-	jindex = createi(sdp->master_dir, "jindex", S_IFDIR | 0700,
-			 GFS2_DIF_SYSTEM);
-	if (jindex == NULL) {
-		return errno;
-	}
-	sdp->md.journal = malloc(sdp->md.journals *
-				 sizeof(struct gfs2_inode *));
-	for (j = 0; j < sdp->md.journals; j++) {
-		ret = build_journal(sdp, j, jindex);
-		if (ret)
-			return ret;
-		inode_put(&sdp->md.journal[j]);
-	}
-	if (cfg_debug) {
-		printf("\nJindex:\n");
-		lgfs2_dinode_print(jindex->i_bh->b_data);
-	}
-
-	free(sdp->md.journal);
-	inode_put(&jindex);
-	return 0;
-}
-
 int build_inum_range(struct gfs2_inode *per_node, unsigned int j)
 {
 	char name[256];
-- 
2.34.1

