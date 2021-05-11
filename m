Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 73D6A37A819
	for <lists+cluster-devel@lfdr.de>; Tue, 11 May 2021 15:49:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620740969;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xlYUYivVwZu0HgRsx1CoZu2G2/J6YkrE3+YrJXbAxyc=;
	b=b9qpNOcVL34hjhI7pmS9IBJRHqvowlGoqvozzt90ivf7Al+nQuKyY1IzGRU+h8w3hiQkXw
	i1AixozTrBEdDoTnDMCkA8I15Xma2EZEpJx6vz5jowCN/suXdAG7mcsJKxayVxuZYEsO57
	1S8EBcl/GdB4fZMPJRB15fM1BG59vJs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-wzPPfZpEMwuwCd-Jm1G-wQ-1; Tue, 11 May 2021 09:49:24 -0400
X-MC-Unique: wzPPfZpEMwuwCd-Jm1G-wQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25401801AEE;
	Tue, 11 May 2021 13:49:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E49D019CBF;
	Tue, 11 May 2021 13:49:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5210A1806D0E;
	Tue, 11 May 2021 13:49:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14BDnBeS031551 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 11 May 2021 09:49:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 64DC45F724; Tue, 11 May 2021 13:49:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.195.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 485EE5C1A3;
	Tue, 11 May 2021 13:49:10 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 11 May 2021 15:49:08 +0200
Message-Id: <20210511134908.1225322-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, stable@vger.kernel.org
Subject: [Cluster-devel] [PATCH] gfs2: Fix mmap + page fault deadlock
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Commit 20f829999c38 has moved the inode glock taking from gfs2_readpage and
gfs2_readahead into gfs2_file_read_iter and gfs2_fault.  In gfs2_fault, we
didn't take into account that page faults can occur while holding the inode
glock, for example,

  gfs2_file_read_iter
    [grabs inode glock]
    generic_file_read_iter
      filemap_read
        copy_page_to_iter
          gfs2_fault
            [tries to grab inode glock again]

  gfs2_file_write_iter
    iomap_file_buffered_write
      iomap_apply
        iomap_ops->iomap_begin
          [grabs inode glock]
        iomap_write_actor
          iov_iter_fault_in_readable
            gfs2_fault
              [tries to grab inode glock again]

Fix that by checking if we're holding the inode glock already.

Reported-by: Jan Kara <jack@suse.cz>
Fixes: 20f829999c38 ("gfs2: Rework read and page fault locking")
Cc: stable@vger.kernel.org # v5.8+
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 3ebc9af39a04..658fed79d65a 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -538,18 +538,22 @@ static vm_fault_t gfs2_fault(struct vm_fault *vmf)
 {
 	struct inode *inode = file_inode(vmf->vma->vm_file);
 	struct gfs2_inode *ip = GFS2_I(inode);
+	bool recursive = gfs2_glock_is_locked_by_me(ip->i_gl);
 	struct gfs2_holder gh;
 	vm_fault_t ret;
 	int err;
 
 	gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
-	err = gfs2_glock_nq(&gh);
-	if (err) {
-		ret = block_page_mkwrite_return(err);
-		goto out_uninit;
+	if (likely(!recursive)) {
+		err = gfs2_glock_nq(&gh);
+		if (err) {
+			ret = block_page_mkwrite_return(err);
+			goto out_uninit;
+		}
 	}
 	ret = filemap_fault(vmf);
-	gfs2_glock_dq(&gh);
+	if (likely(!recursive))
+		gfs2_glock_dq(&gh);
 out_uninit:
 	gfs2_holder_uninit(&gh);
 	return ret;
-- 
2.26.3

