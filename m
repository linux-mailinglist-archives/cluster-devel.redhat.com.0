Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 591CE29EECB
	for <lists+cluster-devel@lfdr.de>; Thu, 29 Oct 2020 15:52:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603983137;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=n4HD8ZgG3Bu3jBAflmfg94uP0JRQjznofG8zrC92F9E=;
	b=Yg8DZdt4es/VStw5pgokZCVoSCIdv4qMhCe6l7pUy5TxGmMfsLu1EHo1xDJ/g0WC8MNPyc
	do1TtAOUACuuHyW5nnrdbdNGGXi1g5SgPywK2ryFDViUKxAwxOnsd6oiCX1JtXdaJUrZfs
	bYGBlovYTkDKkCz5NVVEkg+s0FDYHDs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-GgEHjuLwP_W3zdI-FboXyw-1; Thu, 29 Oct 2020 10:52:15 -0400
X-MC-Unique: GgEHjuLwP_W3zdI-FboXyw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A9871084D71;
	Thu, 29 Oct 2020 14:52:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AE1A5D9EF;
	Thu, 29 Oct 2020 14:52:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1525E181A86E;
	Thu, 29 Oct 2020 14:52:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09TEqAVE021712 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 29 Oct 2020 10:52:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7C4925B4AA; Thu, 29 Oct 2020 14:52:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-113-104.phx2.redhat.com [10.3.113.104])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4ABAA5B4A9
	for <cluster-devel@redhat.com>; Thu, 29 Oct 2020 14:52:10 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 29 Oct 2020 09:52:03 -0500
Message-Id: <20201029145203.451643-5-rpeterso@redhat.com>
In-Reply-To: <20201029145203.451643-1-rpeterso@redhat.com>
References: <20201029145203.451643-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 4/4] gfs2: don't initialize
	statfs_change inodes in spectator mode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before commit 97fd734ba17e, the local statfs_changeX inode was never
initialized for spectator mounts. However, it still checks for
spectator mounts when unmounting everything. There's no good reason to
lookup the statfs_changeX files because spectators cannot perform recovery.
It still, however, needs the master statfs file for statfs calls.
This patch adds the check for spectator mounts to init_statfs.

Fixes: 97fd734ba17e ("gfs2: lookup local statfs inodes prior to journal recovery")
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/ops_fstype.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 1ed4b61e3298..61fce59cb4d3 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -633,8 +633,10 @@ static int init_statfs(struct gfs2_sbd *sdp)
 	if (IS_ERR(sdp->sd_statfs_inode)) {
 		error = PTR_ERR(sdp->sd_statfs_inode);
 		fs_err(sdp, "can't read in statfs inode: %d\n", error);
-		goto fail;
+		goto out;
 	}
+	if (sdp->sd_args.ar_spectator)
+		goto out;
 
 	pn = gfs2_lookup_simple(master, "per_node");
 	if (IS_ERR(pn)) {
@@ -682,15 +684,17 @@ static int init_statfs(struct gfs2_sbd *sdp)
 	iput(pn);
 put_statfs:
 	iput(sdp->sd_statfs_inode);
-fail:
+out:
 	return error;
 }
 
 /* Uninitialize and free up memory used by the list of statfs inodes */
 static void uninit_statfs(struct gfs2_sbd *sdp)
 {
-	gfs2_glock_dq_uninit(&sdp->sd_sc_gh);
-	free_local_statfs_inodes(sdp);
+	if (!sdp->sd_args.ar_spectator) {
+		gfs2_glock_dq_uninit(&sdp->sd_sc_gh);
+		free_local_statfs_inodes(sdp);
+	}
 	iput(sdp->sd_statfs_inode);
 }
 
-- 
2.26.2

