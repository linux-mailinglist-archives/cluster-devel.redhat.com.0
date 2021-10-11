Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AD68F4297AB
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Oct 2021 21:40:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633981239;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YLwxVEoNIIY6OXAsy1ZmN21zjk5M8lntWWEPP3ZivLc=;
	b=SIfJU5YdI4cKPZWJ8a68L6CaV2YCuBQN9NetxTm4LqC+W366KONl+IV266Jz1hwFdPtowx
	uNwVBkAFJx7RRPdAX7QBlUUKo5bUmgaZMVGRl5EHOd+EtH+oH9Iz7jJ+mmJKIB6yLiIw/E
	g1VsgM/LNQW15c4gwyJAGU8KU2vSBnw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-Piw0QdNLO5ynxz7AjbyRqA-1; Mon, 11 Oct 2021 15:40:36 -0400
X-MC-Unique: Piw0QdNLO5ynxz7AjbyRqA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88E24CF983;
	Mon, 11 Oct 2021 19:40:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B5651106AC4;
	Mon, 11 Oct 2021 19:40:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 39F7B4E590;
	Mon, 11 Oct 2021 19:40:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19BJeTsp028767 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Oct 2021 15:40:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A3B7626DFD; Mon, 11 Oct 2021 19:40:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-2.phx2.redhat.com [10.3.114.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 72A2626DE2
	for <cluster-devel@redhat.com>; Mon, 11 Oct 2021 19:40:29 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 11 Oct 2021 14:39:58 -0500
Message-Id: <20211011194008.50097-4-rpeterso@redhat.com>
In-Reply-To: <20211011194008.50097-1-rpeterso@redhat.com>
References: <20211011194008.50097-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v3 PATCH 03/13] gfs2: dequeue iopen holder in
	gfs2_inode_lookup error
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

Before this patch, if function gfs2_inode_lookup encountered an error
after it had locked the iopen glock, it never unlocked it, relying on
the evict code to do the cleanup.  The evict code then took the
inode glock while holding the iopen glock, which violates the locking
order.  For example,

 (1) node A does a gfs2_inode_lookup that fails, leaving the iopen glock
     locked.

 (2) node B calls delete_work_func -> gfs2_lookup_by_inum ->
     gfs2_inode_lookup.  It locks the inode glock and blocks trying to
     lock the iopen glock, which is held by node A.

 (3) node A eventually calls gfs2_evict_inode -> evict_should_delete.
     It blocks trying to lock the inode glock, which is now held by
     node B.

This patch introduces error handling to function gfs2_inode_lookup
so it properly dequeues held iopen glocks on errors.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/inode.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 6e15434b23ac..4f8e5c2bcf1f 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -225,6 +225,10 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
 	return inode;
 
 fail:
+	if (gfs2_holder_initialized(&ip->i_iopen_gh)) {
+		glock_clear_object(ip->i_iopen_gh.gh_gl, ip);
+		gfs2_glock_dq_uninit(&ip->i_iopen_gh);
+	}
 	if (io_gl)
 		gfs2_glock_put(io_gl);
 	if (gfs2_holder_initialized(&i_gh))
-- 
2.31.1

