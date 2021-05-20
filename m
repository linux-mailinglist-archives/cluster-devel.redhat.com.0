Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0386E38AC43
	for <lists+cluster-devel@lfdr.de>; Thu, 20 May 2021 13:37:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621510637;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LfVW6WJSeNeDIsQXeAqZ6bIL6ZYm/dJ0TpqzhKG3vIg=;
	b=Y/fckCgvXH8ie7X4H6csGFfJz3REg2mPndiOcAEaNPo+I3fRknFOad7W+wZe2UwUJVZ3Op
	IvWZccrsYA0PUbHkSIFB2zdIe1lo+uwupIK0Zjc0OG7cb2UeXPoWRicJT8squcHNhg2eQ+
	F3x3QsQe1P8FtTN1eNzv8nT1etnLXok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-B-l44FSyOvqT1N6P0v8lEw-1; Thu, 20 May 2021 07:37:15 -0400
X-MC-Unique: B-l44FSyOvqT1N6P0v8lEw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28E3B101371B;
	Thu, 20 May 2021 11:37:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 191545D9DC;
	Thu, 20 May 2021 11:37:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 049DC1800BB4;
	Thu, 20 May 2021 11:37:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14KBXXEA026575 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 May 2021 07:33:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C3215687FD; Thu, 20 May 2021 11:33:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.195.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 064386A04D;
	Thu, 20 May 2021 11:33:29 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 20 May 2021 13:33:27 +0200
Message-Id: <20210520113327.1595090-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Fix mmap locking for write faults
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

When a write fault occurs, we need to take the inode glock of the underlying
inode in exclusive mode.  Otherwise, there's no guarantee that the dirty page
will be written back to disk.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 493a83e3f590..8a35a0196b6d 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -540,9 +540,11 @@ static vm_fault_t gfs2_fault(struct vm_fault *vmf)
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_holder gh;
 	vm_fault_t ret;
+	u16 state;
 	int err;
 
-	gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
+	state = (vmf->flags & FAULT_FLAG_WRITE) ? LM_ST_EXCLUSIVE : LM_ST_SHARED;
+	gfs2_holder_init(ip->i_gl, state, 0, &gh);
 	err = gfs2_glock_nq(&gh);
 	if (err) {
 		ret = block_page_mkwrite_return(err);
-- 
2.26.3

