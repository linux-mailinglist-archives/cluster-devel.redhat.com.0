Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD73C4CBDD6
	for <lists+cluster-devel@lfdr.de>; Thu,  3 Mar 2022 13:33:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646310789;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0j9w7GJ1FyK/NBPhzv5wV6UV9boRklngeAitia5ZcrE=;
	b=IQRWG2btJFNsUrGpSi3wyhsBlr0ttgEmCXReQc7H9gyDhBWQjpkcenAApdo9NLdwoAgqp3
	SxI7FncZZCBr9/2kUuhxDzIS3CE88Kpi4S/xzQcg0Y2Se8kr5S9HUQxEXSWtR1t7QwVbIu
	qc+DUYWKfvOCJGrMf6jei/sO3FEVlm0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-6gHnyWO7NwqIMdDvSa5Vcg-1; Thu, 03 Mar 2022 07:33:06 -0500
X-MC-Unique: 6gHnyWO7NwqIMdDvSa5Vcg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A31D11091DA0;
	Thu,  3 Mar 2022 12:33:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C7C3838DF;
	Thu,  3 Mar 2022 12:33:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C4B24A701;
	Thu,  3 Mar 2022 12:32:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 223CWoNd015840 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 3 Mar 2022 07:32:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CAB3B838D7; Thu,  3 Mar 2022 12:32:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (unknown [10.2.16.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 834A381F79
	for <cluster-devel@redhat.com>; Thu,  3 Mar 2022 12:32:44 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu,  3 Mar 2022 07:32:43 -0500
Message-Id: <20220303123243.177960-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Remove return value for
	gfs2_indirect_init
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

The return value from function gfs2_indirect_init is never used, so
remove it.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/bmap.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index fbdb7a30470a..39080b2d6cf8 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -606,9 +606,9 @@ static int gfs2_hole_size(struct inode *inode, sector_t lblock, u64 len,
 	return ret;
 }
 
-static inline __be64 *gfs2_indirect_init(struct metapath *mp,
-					 struct gfs2_glock *gl, unsigned int i,
-					 unsigned offset, u64 bn)
+static inline void gfs2_indirect_init(struct metapath *mp,
+				      struct gfs2_glock *gl, unsigned int i,
+				      unsigned offset, u64 bn)
 {
 	__be64 *ptr = (__be64 *)(mp->mp_bh[i - 1]->b_data +
 		       ((i > 1) ? sizeof(struct gfs2_meta_header) :
@@ -621,7 +621,6 @@ static inline __be64 *gfs2_indirect_init(struct metapath *mp,
 	gfs2_buffer_clear_tail(mp->mp_bh[i], sizeof(struct gfs2_meta_header));
 	ptr += offset;
 	*ptr = cpu_to_be64(bn);
-	return ptr;
 }
 
 enum alloc_state {
-- 
2.35.1

