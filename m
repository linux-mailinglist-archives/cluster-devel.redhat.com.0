Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id EB95729B785
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Oct 2020 16:40:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603813238;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NkSJINKIwwQKIRhuZlfvHAQSvrMYWu8cvHWwVjQciDI=;
	b=NkKzDWRyMPGhfYgZ4llVHpKW8nqaWPP1uqjRzrVE+XP8G0F2swDrUQUq5oUCy2RbY7Q/1w
	Nl+edaEeQkLcZkuH0L1U8O28nTN390N7fSv8F24TZj3LIirO+dTyb1ft5H5BI7gQ+95Rv5
	AvpTi2mp7AC7M1F84Q4ZKx7OiHsbZnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-XmszbUo3Prm2KVkpH9WEqQ-1; Tue, 27 Oct 2020 11:40:37 -0400
X-MC-Unique: XmszbUo3Prm2KVkpH9WEqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED3768015F7;
	Tue, 27 Oct 2020 15:40:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBEDE60C11;
	Tue, 27 Oct 2020 15:40:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A6C2F1832FC2;
	Tue, 27 Oct 2020 15:40:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09RFA7Lh008060 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 27 Oct 2020 11:10:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B27145B4BB; Tue, 27 Oct 2020 15:10:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-113-104.phx2.redhat.com [10.3.113.104])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 827685B4B2
	for <cluster-devel@redhat.com>; Tue, 27 Oct 2020 15:10:07 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 27 Oct 2020 10:10:03 -0500
Message-Id: <20201027151003.363949-4-rpeterso@redhat.com>
In-Reply-To: <20201027151003.363949-1-rpeterso@redhat.com>
References: <20201027151003.363949-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 3/3] gfs2: Use filemap_fdatawrite_range
	for gfs2_meta_sync
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before this patch, function gfs2_meta_sync called filemap_fdatawrite to write
the address space for the metadata being synced. That's great for inodes, but
for resource groups, they all point to the same superblock-address space,
sdp->sd_aspace, with their own range. That meant every time an rgrp's metadata
was synced, it would write all of them instead of just the range.

This patch changes function gfs2_meta_sync so that instead it calls
filemap_fdatawrite_range and filemap_fdatawait_range with a range of addresses
appropriate to the object. For inodes, it specifies the whole range, as
per filemap_fdatawrite. For rgrps, it uses only the range required.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>

12345678901234567890123456789012345678901234567890123456789012345678901234567890
---
 fs/gfs2/lops.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index ed69298dd824..94b0e89ee7b2 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -827,13 +827,21 @@ void gfs2_meta_sync(struct gfs2_glock *gl)
 {
 	struct address_space *mapping = gfs2_glock2aspace(gl);
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
+	loff_t start = 0;
+	loff_t end = LLONG_MAX;
 	int error;
 
-	if (mapping == NULL)
+	if (mapping == NULL) {
+		struct gfs2_rgrpd *rgd = gfs2_glock2rgrp(gl);
+		const unsigned bsize = sdp->sd_sb.sb_bsize;
+
 		mapping = &sdp->sd_aspace;
+		start = (rgd->rd_addr * bsize) & PAGE_MASK;
+		end = PAGE_ALIGN((rgd->rd_addr + rgd->rd_length) * bsize) - 1;
+	}
 
-	filemap_fdatawrite(mapping);
-	error = filemap_fdatawait(mapping);
+	filemap_fdatawrite_range(mapping, start, end);
+	error = filemap_fdatawait_range(mapping, start, end);
 
 	if (error)
 		gfs2_io_error(gl->gl_name.ln_sbd);
-- 
2.26.2

