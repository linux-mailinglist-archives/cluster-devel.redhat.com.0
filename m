Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 04CB434927C
	for <lists+cluster-devel@lfdr.de>; Thu, 25 Mar 2021 13:57:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616677043;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qBTxGvnSAzFallYZYFoHVLeRbbN4PyabguSOdot4Z3w=;
	b=ALOwCxwrx45WoP7I5Bfp6H8fh2Q6UEXeZ9C3D+FMk3GIefhN/e7hya5ks80s4v4tpuNepP
	ZLEbs97L89uAUO+9EdwjBtW0Y9yR7wlibxeD9B08Ecpp7ct8kWtanW9X/hXYlTXfjiXp3C
	vzg5eRfmYRfo5XHSK7KCub0mulu0brE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-ApdrS5OhO2mIIHqIZv5GSw-1; Thu, 25 Mar 2021 08:57:19 -0400
X-MC-Unique: ApdrS5OhO2mIIHqIZv5GSw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 094FA1093C33;
	Thu, 25 Mar 2021 12:57:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB2C1189BB;
	Thu, 25 Mar 2021 12:57:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CFA511809C83;
	Thu, 25 Mar 2021 12:57:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12PCv0Am002759 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 25 Mar 2021 08:57:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 75D0B189CE; Thu, 25 Mar 2021 12:57:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E03D189BB
	for <cluster-devel@redhat.com>; Thu, 25 Mar 2021 12:57:00 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 636114BB7B
	for <cluster-devel@redhat.com>; Thu, 25 Mar 2021 12:57:00 +0000 (UTC)
Date: Thu, 25 Mar 2021 08:57:00 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1959594708.1601322.1616677020367.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.85, 10.4.195.24]
Thread-Topic: gfs2: don't create empty buffers for NO_CREATE
Thread-Index: dadOoVMNhZG3z2UU6qa3ON8ZTXD/9Q==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: don't create empty buffers for
	NO_CREATE
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Before this patch, function gfs2_getbuf would create empty buffers when
it was given the NO_CREATE directive from gfs2_journal_wipe. This is a
waste of time: the buffer_head is only used by gfs2_remove_from_journal
to determine if the buffer is pinned (which it won't be if it's newly
created) and if there's an associated bd element (same story).
This patch removes the useless buffer assignment.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/meta_io.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
index 2db573e31f78..c38e3805f468 100644
--- a/fs/gfs2/meta_io.c
+++ b/fs/gfs2/meta_io.c
@@ -131,16 +131,19 @@ struct buffer_head *gfs2_getbuf(struct gfs2_glock *gl, u64 blkno, int create)
 				break;
 			yield();
 		}
+		if (!page_has_buffers(page))
+			create_empty_buffers(page, sdp->sd_sb.sb_bsize, 0);
 	} else {
 		page = find_get_page_flags(mapping, index,
 						FGP_LOCK|FGP_ACCESSED);
 		if (!page)
 			return NULL;
+		if (!page_has_buffers(page)) {
+			bh = NULL;
+			goto out_unlock;
+		}
 	}
 
-	if (!page_has_buffers(page))
-		create_empty_buffers(page, sdp->sd_sb.sb_bsize, 0);
-
 	/* Locate header for our buffer within our page */
 	for (bh = page_buffers(page); bufnum--; bh = bh->b_this_page)
 		/* Do nothing */;
@@ -149,6 +152,7 @@ struct buffer_head *gfs2_getbuf(struct gfs2_glock *gl, u64 blkno, int create)
 	if (!buffer_mapped(bh))
 		map_bh(bh, sdp->sd_vfs, blkno);
 
+out_unlock:
 	unlock_page(page);
 	put_page(page);
 

