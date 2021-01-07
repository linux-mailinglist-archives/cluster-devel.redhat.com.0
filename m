Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1C02ED0F5
	for <lists+cluster-devel@lfdr.de>; Thu,  7 Jan 2021 14:42:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610026977;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0VU80d1Teq8HOHDEI3RObUl7mH01LhU1MU3AssXRuuM=;
	b=CftPUpmg4xjisiASVakgdsZEAjMfXE1DrB6kudmNoC+sbunCZaJ4i6S8LLlTe3JRxQHzBN
	1Mqmwi50D4157MeFArYP7fgEMG+39b+cWybKfIJibO+M/ngi/TJyexnLp1E/Eu8wEJhKYQ
	uCDT4IJHSssXuzYj8S3am7Ru4/N5twE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-6XYdoUrOPoubm6Us2E-F0w-1; Thu, 07 Jan 2021 08:42:55 -0500
X-MC-Unique: 6XYdoUrOPoubm6Us2E-F0w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C560107ACE3;
	Thu,  7 Jan 2021 13:42:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 848521972B;
	Thu,  7 Jan 2021 13:42:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 687E04E58F;
	Thu,  7 Jan 2021 13:42:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 107DgnEU028894 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 7 Jan 2021 08:42:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 88E0D19809; Thu,  7 Jan 2021 13:42:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.37.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B48BB197FA
	for <cluster-devel@redhat.com>; Thu,  7 Jan 2021 13:42:48 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  7 Jan 2021 13:42:39 +0000
Message-Id: <20210107134240.386547-3-anprice@redhat.com>
In-Reply-To: <20210107134240.386547-1-anprice@redhat.com>
References: <20210107134240.386547-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 2/3] fsck.gfs2: Enable checking of format
	1802
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Format 1802 introduces trusted.* xattrs with type 4. Since the
gfs2_ondisk.h kernel header may not match the booted kernel the validity
check is now hard coded.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/fsck/fsck.h  |  2 +-
 gfs2/fsck/pass1.c | 12 ++++++++++--
 tests/fsck.at     |  4 +++-
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/gfs2/fsck/fsck.h b/gfs2/fsck/fsck.h
index 877448c3..13dd7b37 100644
--- a/gfs2/fsck/fsck.h
+++ b/gfs2/fsck/fsck.h
@@ -4,7 +4,7 @@
 #include "libgfs2.h"
 #include "osi_tree.h"
 
-#define FSCK_MAX_FORMAT (1801)
+#define FSCK_MAX_FORMAT (1802)
 
 #define FSCK_HASH_SHIFT         (13)
 #define FSCK_HASH_SIZE          (1 << FSCK_HASH_SHIFT)
diff --git a/gfs2/fsck/pass1.c b/gfs2/fsck/pass1.c
index e6aec43e..88fc4dc4 100644
--- a/gfs2/fsck/pass1.c
+++ b/gfs2/fsck/pass1.c
@@ -998,6 +998,14 @@ static int ask_remove_eattr_entry(struct gfs2_sbd *sdp,
 	return 1;
 }
 
+static int eatype_max(unsigned fs_format)
+{
+	int max = 4;
+	if (fs_format < 1802)
+		max = 3;
+	return max;
+}
+
 static int check_eattr_entries(struct gfs2_inode *ip,
 			       struct gfs2_buffer_head *leaf_bh,
 			       struct gfs2_ea_header *ea_hdr,
@@ -1038,11 +1046,11 @@ static int check_eattr_entries(struct gfs2_inode *ip,
 	strncpy(ea_name, (char *)ea_hdr + sizeof(struct gfs2_ea_header),
 		ea_hdr->ea_name_len);
 
-	if (!GFS2_EATYPE_VALID(ea_hdr->ea_type) &&
+	if (ea_hdr->ea_type > eatype_max(sdp->sd_sb.sb_fs_format) &&
 	   ((ea_hdr_prev) || (!ea_hdr_prev && ea_hdr->ea_type))){
 		/* Skip invalid entry */
 		log_err(_("EA (%s) type is invalid (%d > %d).\n"),
-			ea_name, ea_hdr->ea_type, GFS2_EATYPE_LAST);
+			ea_name, ea_hdr->ea_type, eatype_max(sdp->sd_sb.sb_fs_format));
 		return ask_remove_eattr_entry(sdp, leaf_bh, ea_hdr,
 					      ea_hdr_prev, 0, 0);
 	}
diff --git a/tests/fsck.at b/tests/fsck.at
index fab28a50..727108f4 100644
--- a/tests/fsck.at
+++ b/tests/fsck.at
@@ -59,11 +59,13 @@ AT_SETUP([gfs2 format versions])
 AT_KEYWORDS(fsck.gfs2 fsck)
 GFS_TGT_REGEN
 AT_CHECK([mkfs.gfs2 -O -p lock_nolock ${GFS_TGT}], 0, [ignore], [ignore])
-AT_CHECK(GFS_RUN_OR_SKIP([echo "set sb { sb_fs_format: 1802 }" | gfs2l ${GFS_TGT}]), 0, [ignore], [ignore])
+AT_CHECK(GFS_RUN_OR_SKIP([echo "set sb { sb_fs_format: 1803 }" | gfs2l ${GFS_TGT}]), 0, [ignore], [ignore])
 # Unsupported format, FSCK_USAGE == 16
 AT_CHECK([fsck.gfs2 -y $GFS_TGT], 16, [ignore], [ignore])
 # Format out of range
 AT_CHECK(GFS_RUN_OR_SKIP([echo "set sb { sb_fs_format: 4242 }" | gfs2l ${GFS_TGT}]), 0, [ignore], [ignore])
 AT_CHECK([fsck.gfs2 -y $GFS_TGT], 1, [ignore], [ignore])
 AT_CHECK([fsck.gfs2 -n $GFS_TGT], 0, [ignore], [ignore])
+AT_CHECK([mkfs.gfs2 -O -p lock_nolock -o format=1802 ${GFS_TGT}], 0, [ignore], [ignore])
+AT_CHECK([fsck.gfs2 -n $GFS_TGT], 0, [ignore], [ignore])
 AT_CLEANUP
-- 
2.29.2

