Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 223842648B2
	for <lists+cluster-devel@lfdr.de>; Thu, 10 Sep 2020 17:26:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599751614;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Sy1cuxHZ2LHqZwyDv9VsdGzs5OTnaKh9NvYLRBmIaGs=;
	b=dqyecHzNDuwwZlEQzHGjviykFpEtu+NX4wSEsjzBcsgfaYNQrfOWFYN/ypNOQ0F8bB4F5F
	dnNeFscwQkoNku6DsTRc5cIB6f1ahp4MtOS82qt26uKQr8VlNd7q7Gj0QnSMnIYW0iPR8h
	o+JWAEXrlErJgckGCJoy+Jl7U/Joiws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-My9bpvKVMMy49IInrtbfeQ-1; Thu, 10 Sep 2020 11:26:50 -0400
X-MC-Unique: My9bpvKVMMy49IInrtbfeQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51C3580EF9D;
	Thu, 10 Sep 2020 15:26:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 069A97EB7A;
	Thu, 10 Sep 2020 15:26:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A9CC7922E1;
	Thu, 10 Sep 2020 15:26:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08AFQaFm029111 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 11:26:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EF9F419C71; Thu, 10 Sep 2020 15:26:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EAAE919C66
	for <cluster-devel@redhat.com>; Thu, 10 Sep 2020 15:26:34 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3439379DBA
	for <cluster-devel@redhat.com>; Thu, 10 Sep 2020 15:26:34 +0000 (UTC)
Date: Thu, 10 Sep 2020 11:26:34 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <883057823.16586032.1599751594154.JavaMail.zimbra@redhat.com>
In-Reply-To: <454279735.16583317.1599751575623.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.23, 10.4.195.14]
Thread-Topic: gfs2: truncate glock address space pages during evict
Thread-Index: CgWFYMiz4wPRPbTyfXSB7BeobFcJKg==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: truncate glock address space
	pages during evict
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

Before this patch, function gfs2_evict_inode would truncate the pages
for the inode's address space, but the address space associated with its
glock was only truncated if the inode was deleted. In that case, it
needs to do the truncate within a transaction because of this calling
sequence:

truncate_inode_pages
   truncate_inode_pages_range
      gfs2_invalidatepage
         gfs2_discard
            gfs2_remove_from_journal
               gfs2_trans_add_revoke <------- Needs a transaction

If, however, the inode is not deleted, it might still have pages for
the glock's address space because gfs2_getbuf() reads them in that way.
This may happen, for example, if a file is unlinked by another node and
this node discovers that fact by reading the dinode using its glock
during the process of doing delete_work_func -> create -> put -> evict.
But if the inode is not deleted, the truncate_inode_pages for the glock
address space was bypassed.

The problem is, in some circumstances (such as the system quota file during
unmount) an inode can have pages still queued to its glock's address space.
That causes a kernel panic when __gfs2_glock_put for the inode glock does:

    GLOCK_BUG_ON(gl, mapping && mapping->nrpages && !gfs2_withdrawn(sdp));

At that point, it is too late to start a transaction for the truncate
because the file system is then read-only, so trans_begin will return an
error.

When we free the glock, the pages shouldn't be dirty anyway, so this
patch adds truncate_inode_pages_final for the glock's address space,
metamapping.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 19add2da1013..3ced8d895eca 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1456,6 +1456,10 @@ static void gfs2_evict_inode(struct inode *inode)
 		fs_warn(sdp, "gfs2_evict_inode: %d\n", error);
 out:
 	truncate_inode_pages_final(&inode->i_data);
+	if (ip->i_gl) {
+		metamapping = gfs2_glock2aspace(ip->i_gl);
+		truncate_inode_pages_final(metamapping);
+	}
 	if (ip->i_qadata)
 		gfs2_assert_warn(sdp, ip->i_qadata->qa_ref == 0);
 	gfs2_rs_delete(ip, NULL);

