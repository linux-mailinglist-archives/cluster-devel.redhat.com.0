Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B6050526BCC
	for <lists+cluster-devel@lfdr.de>; Fri, 13 May 2022 22:48:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652474907;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cz5HGJkI1E7+HhOjV5KeKAWzB/fVn3b1Wj8PdS64+Ks=;
	b=gQIZJtIEiRGJN+WjBD8xmYlkCjTY17RaGdNa6XvlUkPOyluDjEad0xGHmKXuEGoGyy1rah
	7GwRLA39AhhanMzsLUwst2SlGDqQz89Nmwq9Gtd/qbhJy/0fUy2duMePigN8pS/hQ821EZ
	ZBZS862/7tHxDHXAFSbGvoJyYvxH50s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-nnXTw8CnPPmSg13JWnYC8w-1; Fri, 13 May 2022 16:48:20 -0400
X-MC-Unique: nnXTw8CnPPmSg13JWnYC8w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA5133C025AD;
	Fri, 13 May 2022 20:48:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5734F416157;
	Fri, 13 May 2022 20:48:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C196A1932238;
	Fri, 13 May 2022 20:48:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0C5141932211 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 13 May 2022 20:48:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F3E542024CB9; Fri, 13 May 2022 20:48:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.194.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A6DC2024CB7;
 Fri, 13 May 2022 20:48:16 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 13 May 2022 22:48:04 +0200
Message-Id: <20220513204810.4123139-2-agruenba@redhat.com>
In-Reply-To: <20220513204810.4123139-1-agruenba@redhat.com>
References: <20220513204810.4123139-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Cluster-devel] [PATCH 1/7] gfs2: Fix filesystem block deallocation
 for short writes
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

When a write cannot be carried out in full, gfs2_iomap_end() releases
blocks that have been allocated for this write but haven't been used.

To compute the end of the allocation, gfs2_iomap_end() incorrectly
rounded the end of the attempted write down to the next block boundary
to arrive at the end of the allocation.  It would have to round up, but
the end of the allocation is also available as iomap->offset +
iomap->length, so just use that instead.

In addition, use round_up() for computing the start of the unused range.

Fixes: 64bc06bb32ee ("gfs2: iomap buffered write support")
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 39080b2d6cf8..b6697333bb2b 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1153,13 +1153,12 @@ static int gfs2_iomap_end(struct inode *inode, loff_t pos, loff_t length,
 
 	if (length != written && (iomap->flags & IOMAP_F_NEW)) {
 		/* Deallocate blocks that were just allocated. */
-		loff_t blockmask = i_blocksize(inode) - 1;
-		loff_t end = (pos + length) & ~blockmask;
+		loff_t hstart = round_up(pos + written, i_blocksize(inode));
+		loff_t hend = iomap->offset + iomap->length;
 
-		pos = (pos + written + blockmask) & ~blockmask;
-		if (pos < end) {
-			truncate_pagecache_range(inode, pos, end - 1);
-			punch_hole(ip, pos, end - pos);
+		if (hstart < hend) {
+			truncate_pagecache_range(inode, hstart, hend - 1);
+			punch_hole(ip, hstart, hend - hstart);
 		}
 	}
 
-- 
2.35.1

