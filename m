Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E61C024DE87
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Aug 2020 19:33:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598031237;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Wd7nms4ab0ef8bgVNOva+UMEQH5SneuHsYJN8xKZelk=;
	b=B+R2EMg18QQp9AD5wb/UZHPUhkAY82d2C10hmpMFNRQh89YcVnC9lYVN5MzRlJ0tIQfKGc
	RNgnVM2O2Qvv6yRQIXtalgXdsLHlZ1oCP7Kj0iqpdC2d9QJ8oqym+FUS0w9TPgSvfWcr8W
	pN25fNGFozp11WZ3eRopdmc2H0AR+04=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-dMvAig_cNAiTvvxGYD3Dug-1; Fri, 21 Aug 2020 13:33:56 -0400
X-MC-Unique: dMvAig_cNAiTvvxGYD3Dug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0AB380733B;
	Fri, 21 Aug 2020 17:33:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFF9F19D7D;
	Fri, 21 Aug 2020 17:33:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CBB3F662C9;
	Fri, 21 Aug 2020 17:33:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LHXhTu028404 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 13:33:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 10F4A5DA75; Fri, 21 Aug 2020 17:33:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-102.phx2.redhat.com [10.3.112.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D19EB5DA74
	for <cluster-devel@redhat.com>; Fri, 21 Aug 2020 17:33:42 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 21 Aug 2020 12:33:30 -0500
Message-Id: <20200821173337.20377-6-rpeterso@redhat.com>
In-Reply-To: <20200821173337.20377-1-rpeterso@redhat.com>
References: <20200821173337.20377-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 05/12] gfs2: Calculate number of
	revokes during evict
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Before this patch, function gfs2_evict_inode would start a transaction
in order to write some unknown number of revokes. Instead of calculating
the value, it used sdp->sd_jdesc->jd_blocks, the number of blocks in the
entire journal. You can fit a lot of revokes in a block (in a 4K block
you can fit 503 of them). For a 512MB journal has 131072 blocks, it would
ask for 261 free blocks.

This patch changes it to calculate the number of revokes based on the
nrpages values of the address space plus glock address space. Note that
since it does this after clearing out the ail list, we don't need to
use the number of (old) revokes in the calculation. We calculate it from
the number of standing new items that need revoking.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 9f4d9e7be839..80ac446f0110 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1336,6 +1336,7 @@ static void gfs2_evict_inode(struct inode *inode)
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_holder gh;
 	struct address_space *metamapping;
+	int nr_revokes;
 	int error;
 
 	if (test_bit(GIF_FREE_VFS_INODE, &ip->i_flags)) {
@@ -1434,7 +1435,11 @@ static void gfs2_evict_inode(struct inode *inode)
 	write_inode_now(inode, 1);
 	gfs2_ail_flush(ip->i_gl, 0);
 
-	error = gfs2_trans_begin(sdp, 0, sdp->sd_jdesc->jd_blocks);
+	nr_revokes = inode->i_mapping->nrpages + metamapping->nrpages;
+	if (!nr_revokes)
+		goto out_unlock;
+
+	error = gfs2_trans_begin(sdp, 0, nr_revokes);
 	if (error)
 		goto out_unlock;
 	/* Needs to be done before glock release & also in a transaction */
-- 
2.26.2

