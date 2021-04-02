Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1A32E3529AB
	for <lists+cluster-devel@lfdr.de>; Fri,  2 Apr 2021 12:22:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617358968;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C14zLUTVBuogohvYXKmeCK0TybGMt0lNf9kFYhhMI2Y=;
	b=hwcRanvgLx4CgI7xFTpsIMDowGg0bZ+BP9ax2lKY09qzTqWJIODZ7anA53c8v4LulCY5ud
	wAbdTVX8cYw+X6xJjstIOVJTy9WSylLD9qB6IHB7UsE3QzMOkUeQmhENajdnUw8yENeNKM
	Z7mRC+4hLRSIqi9pBNxpylNvnx784bY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-igMnaqRBMWC8Bk8c0IVRZQ-1; Fri, 02 Apr 2021 06:22:46 -0400
X-MC-Unique: igMnaqRBMWC8Bk8c0IVRZQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11401800D53;
	Fri,  2 Apr 2021 10:22:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2580B1001281;
	Fri,  2 Apr 2021 10:22:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BAAB51809C83;
	Fri,  2 Apr 2021 10:22:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 132AMZaJ010168 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 2 Apr 2021 06:22:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0F4FE19D9B; Fri,  2 Apr 2021 10:22:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.194.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B88019C59;
	Fri,  2 Apr 2021 10:22:30 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri,  2 Apr 2021 12:22:28 +0200
Message-Id: <20210402102228.2286715-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Remove unused variable sb_format
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

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/incore.h     | 1 -
 fs/gfs2/ops_fstype.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 0957119f7744..8ff70b519687 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -625,7 +625,6 @@ struct gfs2_inum_host {
 struct gfs2_sb_host {
 	u32 sb_magic;
 	u32 sb_type;
-	u32 sb_format;
 
 	u32 sb_fs_format;
 	u32 sb_multihost_format;
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index aa4136055a83..56e7a064fe07 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -204,7 +204,6 @@ static void gfs2_sb_in(struct gfs2_sbd *sdp, const void *buf)
 
 	sb->sb_magic = be32_to_cpu(str->sb_header.mh_magic);
 	sb->sb_type = be32_to_cpu(str->sb_header.mh_type);
-	sb->sb_format = be32_to_cpu(str->sb_header.mh_format);
 	sb->sb_fs_format = be32_to_cpu(str->sb_fs_format);
 	sb->sb_multihost_format = be32_to_cpu(str->sb_multihost_format);
 	sb->sb_bsize = be32_to_cpu(str->sb_bsize);
-- 
2.26.2

