Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E5B4938D5
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Jan 2022 11:46:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642589205;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RYuqnzA6Ivt/qhabuVJ9EQXeSrheGQMpuqqysyQ/CLM=;
	b=YbQCYQO6BzJQHS0FLupfEA1UH1t0Va+hybnhQveG6IgsO/v+eCL1+cJSwaUIles2/J1IiI
	6/b84UuVwiTiQqMuTafzDAEQ6muLq4Xqb/kiv42zxkKzUsks7VShsR/C5Gmo3Rnv2NTFEL
	HvFbw5ii2+/xBbOT55k6aDC8W6DDNNY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-Tblb79LbOl2VAwJWFDzWLQ-1; Wed, 19 Jan 2022 05:46:42 -0500
X-MC-Unique: Tblb79LbOl2VAwJWFDzWLQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAA5581424C;
	Wed, 19 Jan 2022 10:46:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D743078374;
	Wed, 19 Jan 2022 10:46:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF4344A706;
	Wed, 19 Jan 2022 10:46:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20JAiNEV024493 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 05:44:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C90E578B10; Wed, 19 Jan 2022 10:44:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07BDE79588
	for <cluster-devel@redhat.com>; Wed, 19 Jan 2022 10:43:41 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 19 Jan 2022 10:43:05 +0000
Message-Id: <20220119104316.2489995-11-anprice@redhat.com>
In-Reply-To: <20220119104316.2489995-1-anprice@redhat.com>
References: <20220119104316.2489995-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 10/21] libgfs2: Remove revoke function
	declarations from libgfs2.h
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

These functions are actually defined in fsck.gfs2 code and can be made
static.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/fsck/fs_recovery.c | 14 +++++++-------
 gfs2/libgfs2/libgfs2.h  |  4 ----
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/gfs2/fsck/fs_recovery.c b/gfs2/fsck/fs_recovery.c
index bd0fd731..5bd46301 100644
--- a/gfs2/fsck/fs_recovery.c
+++ b/gfs2/fsck/fs_recovery.c
@@ -33,7 +33,7 @@ struct gfs2_revoke_replay {
 	unsigned int rr_where;
 };
 
-int gfs2_revoke_add(struct gfs2_sbd *sdp, uint64_t blkno, unsigned int where)
+static int revoke_add(struct gfs2_sbd *sdp, uint64_t blkno, unsigned int where)
 {
 	osi_list_t *tmp, *head = &sd_revoke_list;
 	struct gfs2_revoke_replay *rr;
@@ -62,7 +62,7 @@ int gfs2_revoke_add(struct gfs2_sbd *sdp, uint64_t blkno, unsigned int where)
 	return 1;
 }
 
-int gfs2_revoke_check(struct gfs2_sbd *sdp, uint64_t blkno, unsigned int where)
+static int revoke_check(struct gfs2_sbd *sdp, uint64_t blkno, unsigned int where)
 {
 	osi_list_t *tmp;
 	struct gfs2_revoke_replay *rr;
@@ -86,7 +86,7 @@ int gfs2_revoke_check(struct gfs2_sbd *sdp, uint64_t blkno, unsigned int where)
 	return (wrap) ? (a || b) : (a && b);
 }
 
-void gfs2_revoke_clean(struct gfs2_sbd *sdp)
+static void revoke_clean(struct gfs2_sbd *sdp)
 {
 	osi_list_t *head = &sd_revoke_list;
 	struct gfs2_revoke_replay *rr;
@@ -144,7 +144,7 @@ static int buf_lo_scan_elements(struct gfs2_inode *ip, unsigned int start,
 
 		blkno = be64_to_cpu(*ptr);
 		ptr++;
-		if (gfs2_revoke_check(sdp, blkno, start))
+		if (revoke_check(sdp, blkno, start))
 			continue;
 
 		error = gfs2_replay_read_block(ip, start, &bh_log);
@@ -213,7 +213,7 @@ static int revoke_lo_scan_elements(struct gfs2_inode *ip, unsigned int start,
 			blkno = be64_to_cpu(*(__be64 *)(bh->b_data + offset));
 			log_info(_("Journal replay processing revoke for block #%"PRIu64" (0x%"PRIx64") for journal+0x%x\n"),
 			         blkno, blkno, start);
-			error = gfs2_revoke_add(sdp, blkno, start);
+			error = revoke_add(sdp, blkno, start);
 			if (error < 0)
 				return error;
 			else if (error)
@@ -255,7 +255,7 @@ static int databuf_lo_scan_elements(struct gfs2_inode *ip, unsigned int start,
 
 		sd_found_jblocks++;
 
-		if (gfs2_revoke_check(sdp, blkno, start))
+		if (revoke_check(sdp, blkno, start))
 			continue;
 
 		error = gfs2_replay_read_block(ip, start, &bh_log);
@@ -578,7 +578,7 @@ static int gfs2_recover_journal(struct gfs2_inode *ip, int j, int preen,
 		}
 	}
 	log_info( _("jid=%u: Found %u revoke tags\n"), j, sd_found_revokes);
-	gfs2_revoke_clean(sdp);
+	revoke_clean(sdp);
 	error = lgfs2_clean_journal(ip, &head);
 	if (error)
 		goto out;
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 5c2f1aa7..e9e0c184 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -733,10 +733,6 @@ extern int lgfs2_open_mnt_dir(const char *path, int flags, struct mntent **mnt);
 extern void gfs2_replay_incr_blk(struct gfs2_inode *ip, unsigned int *blk);
 extern int gfs2_replay_read_block(struct gfs2_inode *ip, unsigned int blk,
 				  struct gfs2_buffer_head **bh);
-extern int gfs2_revoke_add(struct gfs2_sbd *sdp, uint64_t blkno, unsigned int where);
-extern int gfs2_revoke_check(struct gfs2_sbd *sdp, uint64_t blkno,
-			     unsigned int where);
-extern void gfs2_revoke_clean(struct gfs2_sbd *sdp);
 extern int lgfs2_get_log_header(struct gfs2_inode *ip, unsigned int blk,
                                 struct lgfs2_log_header *head);
 extern int lgfs2_find_jhead(struct gfs2_inode *ip, struct lgfs2_log_header *head);
-- 
2.34.1

