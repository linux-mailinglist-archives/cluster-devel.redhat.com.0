Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8A04938BF
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Jan 2022 11:43:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642589028;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RRx/vLjRQBFJAJ40HJhc6n7t1kcR1v+FX8MJk0AZ/xM=;
	b=KgtKEI06ixX/Zba4fHeLu7y6dPuD0PmgLT33FGL5I+X24MNedyvYnewvKHrFp3tze0ZIkj
	BBoN1XfnpBDDkethu7ZHv/vSOKv59kPrXuN09HjFArl6J+BJ9VIcJB8Afmy3mlgBG/i+U4
	uuKndUcTeYsIRoULype9+m9K8a+Lm0M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-62Ormq91O82hPU89bIsknw-1; Wed, 19 Jan 2022 05:43:45 -0500
X-MC-Unique: 62Ormq91O82hPU89bIsknw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB53081424C;
	Wed, 19 Jan 2022 10:43:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB2E71037F53;
	Wed, 19 Jan 2022 10:43:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 943751806D1C;
	Wed, 19 Jan 2022 10:43:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20JAhfDs024252 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 05:43:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 98F5F794D2; Wed, 19 Jan 2022 10:43:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C572478B18
	for <cluster-devel@redhat.com>; Wed, 19 Jan 2022 10:43:40 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 19 Jan 2022 10:43:04 +0000
Message-Id: <20220119104316.2489995-10-anprice@redhat.com>
In-Reply-To: <20220119104316.2489995-1-anprice@redhat.com>
References: <20220119104316.2489995-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 09/21] libgfs2: Namespace improvements -
	gfs2_disk_hash.c
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Use the lgfs2_ prefix in libgfs2 interface names.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/fsck/pass2.c             |  2 +-
 gfs2/libgfs2/fs_ops.c         | 12 ++++++------
 gfs2/libgfs2/gfs2_disk_hash.c |  5 ++---
 gfs2/libgfs2/libgfs2.h        |  7 +++----
 gfs2/libgfs2/rgrp.c           |  4 ++--
 gfs2/libgfs2/structures.c     |  2 +-
 6 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/gfs2/fsck/pass2.c b/gfs2/fsck/pass2.c
index 3d732772..d394f6bf 100644
--- a/gfs2/fsck/pass2.c
+++ b/gfs2/fsck/pass2.c
@@ -470,7 +470,7 @@ static int basic_dentry_checks(struct gfs2_inode *ip, struct gfs2_dirent *dent,
 		return 1;
 	}
 
-	calculated_hash = gfs2_disk_hash(tmp_name, d->dr_name_len);
+	calculated_hash = lgfs2_disk_hash(tmp_name, d->dr_name_len);
 	if (d->dr_hash != calculated_hash){
 	        log_err( _("Dir entry with bad hash or name length\n"
 			   "\tHash found         = %u (0x%x)\n"
diff --git a/gfs2/libgfs2/fs_ops.c b/gfs2/libgfs2/fs_ops.c
index 4e10ab4f..4e3736ca 100644
--- a/gfs2/libgfs2/fs_ops.c
+++ b/gfs2/libgfs2/fs_ops.c
@@ -1148,7 +1148,7 @@ static int dir_e_add(struct gfs2_inode *dip, const char *filename, int len,
 	uint64_t leaf_no, bn;
 	int err = 0;
 
-	hash = gfs2_disk_hash(filename, len);
+	hash = lgfs2_disk_hash(filename, len);
 restart:
 	/* Have to kludge because (hash >> 32) gives hash for some reason. */
 	if (dip->i_depth)
@@ -1313,7 +1313,7 @@ static int dir_l_add(struct gfs2_inode *dip, const char *filename, int len,
 	}
 
 	lgfs2_inum_out(inum, &dent->de_inum);
-	de_hash = gfs2_disk_hash(filename, len);
+	de_hash = lgfs2_disk_hash(filename, len);
 	dent->de_hash = cpu_to_be32(de_hash);
 	dent->de_type = cpu_to_be16(type);
 	memcpy((char *)(dent + 1), filename, len);
@@ -1376,7 +1376,7 @@ static int __init_dinode(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhp, st
 		uint32_t hash;
 		uint16_t len;
 
-		hash = gfs2_disk_hash(".", 1);
+		hash = lgfs2_disk_hash(".", 1);
 		len = GFS2_DIRENT_SIZE(1);
 		de.de_inum = di->di_num;
 		de.de_hash = cpu_to_be32(hash);
@@ -1387,7 +1387,7 @@ static int __init_dinode(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhp, st
 		p[sizeof(de)] = '.';
 		p += len;
 
-		hash = gfs2_disk_hash("..", 2);
+		hash = lgfs2_disk_hash("..", 2);
 		len = sdp->sd_bsize - (p - bh->b_data);
 		de.de_inum.no_formal_ino = cpu_to_be64(parent->in_formal_ino);
 		de.de_inum.no_addr = cpu_to_be64(parent->in_addr);
@@ -1598,7 +1598,7 @@ static int leaf_search(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
 	else
 		return -1;
 
-	hash = gfs2_disk_hash(filename, len);
+	hash = lgfs2_disk_hash(filename, len);
 
 	do{
 		if (!dent->de_inum.no_formal_ino){
@@ -1650,7 +1650,7 @@ static int linked_leaf_search(struct gfs2_inode *dip, const char *filename,
 
 	/*  Figure out the address of the leaf node.  */
 
-	hash = gfs2_disk_hash(filename, len);
+	hash = lgfs2_disk_hash(filename, len);
 	lindex = hash >> (32 - dip->i_depth);
 
 	error = get_first_leaf(dip, lindex, &bh_next);
diff --git a/gfs2/libgfs2/gfs2_disk_hash.c b/gfs2/libgfs2/gfs2_disk_hash.c
index 959f5ddc..07632a28 100644
--- a/gfs2/libgfs2/gfs2_disk_hash.c
+++ b/gfs2/libgfs2/gfs2_disk_hash.c
@@ -40,7 +40,7 @@ static const uint32_t crc_32_tab[] =
 };
 
 /**
- * gfs2_disk_hash - hash an array of data
+ * lgfs2_disk_hash - hash an array of data
  * @data: the data to be hashed
  * @len: the length of data to be hashed
  *
@@ -59,7 +59,7 @@ static const uint32_t crc_32_tab[] =
  * Returns: the hash
  */
 
-uint32_t gfs2_disk_hash(const char *data, int len)
+uint32_t lgfs2_disk_hash(const char *data, int len)
 {
 	uint32_t hash = 0xFFFFFFFF;
 
@@ -71,4 +71,3 @@ uint32_t gfs2_disk_hash(const char *data, int len)
 	return hash;
 }
 
-
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index aede5cda..5c2f1aa7 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -783,11 +783,10 @@ extern int lgfs2_read_sb(struct gfs2_sbd *sdp);
 extern int lgfs2_rindex_read(struct gfs2_sbd *sdp, uint64_t *rgcount, int *ok);
 extern int lgfs2_write_sb(struct gfs2_sbd *sdp);
 
-/* ondisk.c */
-extern uint32_t gfs2_disk_hash(const char *data, int len);
-
-/* Translation functions */
+/* gfs2_disk_hash.c */
+extern uint32_t lgfs2_disk_hash(const char *data, int len);
 
+/* ondisk.c */
 extern void lgfs2_inum_in(struct lgfs2_inum *i, void *inp);
 extern void lgfs2_inum_out(const struct lgfs2_inum *i, void *inp);
 extern void lgfs2_sb_in(struct gfs2_sbd *sdp, void *buf);
diff --git a/gfs2/libgfs2/rgrp.c b/gfs2/libgfs2/rgrp.c
index a359f2fe..78b6812a 100644
--- a/gfs2/libgfs2/rgrp.c
+++ b/gfs2/libgfs2/rgrp.c
@@ -163,7 +163,7 @@ int lgfs2_rgrp_crc_check(char *buf)
 		return 0;
 
 	rg->rg_crc = 0;
-	if (be32_to_cpu(crc) != gfs2_disk_hash(buf, sizeof(struct gfs2_rgrp)))
+	if (be32_to_cpu(crc) != lgfs2_disk_hash(buf, sizeof(struct gfs2_rgrp)))
 		ret = 1;
 	rg->rg_crc = crc;
 	return ret;
@@ -178,7 +178,7 @@ void lgfs2_rgrp_crc_set(char *buf)
 	uint32_t crc;
 
 	rg->rg_crc = 0;
-	crc = gfs2_disk_hash(buf, sizeof(struct gfs2_rgrp));
+	crc = lgfs2_disk_hash(buf, sizeof(struct gfs2_rgrp));
 	rg->rg_crc = cpu_to_be32(crc);
 }
 
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index fc0a59cc..a0de2477 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -81,7 +81,7 @@ uint32_t lgfs2_log_header_hash(char *buf)
 	/* lh_hash only CRCs the fields in the old lh, which ends where lh_crc is now */
 	const off_t v1_end = offsetof(struct gfs2_log_header, lh_hash) + 4;
 
-	return gfs2_disk_hash(buf, v1_end);
+	return lgfs2_disk_hash(buf, v1_end);
 }
 
 uint32_t lgfs2_log_header_crc(char *buf, unsigned bsize)
-- 
2.34.1

