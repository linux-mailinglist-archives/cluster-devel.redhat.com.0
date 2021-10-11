Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 60A8C4297B7
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Oct 2021 21:40:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633981245;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H1AfBsF5v1UkFwYpRo9A12m5CU7qBa/NKYKUOE1V5vw=;
	b=aIwljv6+ljqbapoMXpT83MvjwUxFOVB+7VWMzKwBZoc6W4MxClRYZgrXrXg/eIRMf9sRPl
	rb3x+fMbsR+sJFEqkPx15pk/X/wwRbGf9YwRSxc3TOMw44+efLWROOZu9a+VuL/Eak6kuM
	XMkwFO1RiDj2ZnAJdTBpHCyXSfeyf/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-ZMNZ8sEOPUCpRDuj6OIlKQ-1; Mon, 11 Oct 2021 15:40:42 -0400
X-MC-Unique: ZMNZ8sEOPUCpRDuj6OIlKQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 153348015C7;
	Mon, 11 Oct 2021 19:40:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 077E95C1A1;
	Mon, 11 Oct 2021 19:40:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 434894EA3A;
	Mon, 11 Oct 2021 19:40:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19BJeXBi028864 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Oct 2021 15:40:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 02D3C2657E; Mon, 11 Oct 2021 19:40:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-2.phx2.redhat.com [10.3.114.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C68FB2657D
	for <cluster-devel@redhat.com>; Mon, 11 Oct 2021 19:40:32 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 11 Oct 2021 14:40:08 -0500
Message-Id: <20211011194008.50097-14-rpeterso@redhat.com>
In-Reply-To: <20211011194008.50097-1-rpeterso@redhat.com>
References: <20211011194008.50097-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v3 PATCH 13/13] gfs2: set glock object after
	nq
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before this patch, function gfs2_create_inode called glock_set_object to
set the gl_object for inode and iopen glocks before the glock was locked.
That's wrong because other competing processes like evict may be
blocked waiting for the glock and still have gl_object set before the
actual eviction can take place.

This patch moves the call to glock_set_object until after the glock is
acquire in function gfs2_create_inode, so it waits for possibly
competing evicts to finish their processing first.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/inode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 700f577fe3ff..aed4f476c97d 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -731,18 +731,17 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 	if (error)
 		goto fail_free_inode;
 	flush_delayed_work(&ip->i_gl->gl_work);
-	glock_set_object(ip->i_gl, ip);
 
 	error = gfs2_glock_get(sdp, ip->i_no_addr, &gfs2_iopen_glops, CREATE, &io_gl);
 	if (error)
 		goto fail_free_inode;
 	gfs2_cancel_delete_work(io_gl);
-	glock_set_object(io_gl, ip);
 
 	error = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, GL_SKIP, ghs + 1);
 	if (error)
 		goto fail_gunlock2;
 
+	glock_set_object(ip->i_gl, ip);
 	error = gfs2_trans_begin(sdp, blocks, 0);
 	if (error)
 		goto fail_gunlock2;
@@ -758,6 +757,7 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 	if (error)
 		goto fail_gunlock2;
 
+	glock_set_object(io_gl, ip);
 	gfs2_set_iop(inode);
 	insert_inode_hash(inode);
 
-- 
2.31.1

