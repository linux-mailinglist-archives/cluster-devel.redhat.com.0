Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 53DE62C2D2F
	for <lists+cluster-devel@lfdr.de>; Tue, 24 Nov 2020 17:43:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606236181;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OI4LLgGlt3vf5cMeZVQQ9DQxc+4p8xbSogehNzscOGc=;
	b=Min4AHEHMYP+rYb6CJTtdlQdJZUwzfyqZpwT6U5w+spm6wNFwKAGulc/gB/njQVUuPQwsi
	itnRu6oLyopImDMwbQJSzfrdin7ZThF/QfzP+j5PmqU4KoGuz43iPoZCMBwiJXuWoN3+/m
	t2mxchZGs6ugqajcgoWXKB9XzNivLy8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-9OHCqHWcPVqHm2siwmDICA-1; Tue, 24 Nov 2020 11:42:59 -0500
X-MC-Unique: 9OHCqHWcPVqHm2siwmDICA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E35DF1007465;
	Tue, 24 Nov 2020 16:42:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA4A063BA7;
	Tue, 24 Nov 2020 16:42:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 31CF34A7C6;
	Tue, 24 Nov 2020 16:42:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AOGgkk2015864 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 24 Nov 2020 11:42:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8D98A5C1BD; Tue, 24 Nov 2020 16:42:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C47045C1A3;
	Tue, 24 Nov 2020 16:42:42 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 24 Nov 2020 17:42:40 +0100
Message-Id: <20201124164240.436553-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Take inode glock exclusively when
	mounted without noatime
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Commit 20f829999c38 ("gfs2: Rework read and page fault locking") has lifted the
glock lock taking from the low-level ->readpage and ->readahead address space
operations to the higher-level ->read_iter file and ->fault vm operations.  The
glocks are still taken in LM_ST_SHARED mode only.  On filesystems mounted
without the noatime option, ->read_iter needs to update the atime as well
though, so we currently run into a failed locking mode assertion in
gfs2_dirty_inode.  Fix that by taking the glock in LM_ST_EXCLUSIVE mode on
filesystems mounted without the noatime mount option.

Faulting in pages doesn't update the atime, so in the ->fault vm operation,
taking the glock in LM_ST_SHARED mode is enough.

Reported-by: Alexander Aring <aahringo@redhat.com>
Fixes: 20f829999c38 ("gfs2: Rework read and page fault locking")
Cc: stable@vger.kernel.org # v5.8+
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index b39b339feddc..162a81873dcd 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -849,6 +849,7 @@ static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	struct gfs2_inode *ip;
 	struct gfs2_holder gh;
 	size_t written = 0;
+	unsigned int state;
 	ssize_t ret;
 
 	if (iocb->ki_flags & IOCB_DIRECT) {
@@ -871,7 +872,8 @@ static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 			return ret;
 	}
 	ip = GFS2_I(iocb->ki_filp->f_mapping->host);
-	gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
+	state = IS_NOATIME(&ip->i_inode) ? LM_ST_SHARED : LM_ST_EXCLUSIVE;
+	gfs2_holder_init(ip->i_gl, state, 0, &gh);
 	ret = gfs2_glock_nq(&gh);
 	if (ret)
 		goto out_uninit;

