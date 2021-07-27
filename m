Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 595123D7C42
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jul 2021 19:37:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627407443;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KtQ++6e5Cdk2nJvHGrPNqXrURQKz4lBwv1B/IRN0UNs=;
	b=H6ipecd7NcHEYMIbxWSyNfL2eFHwUyBDqPt14mc55f+7q/fpU6TCMeRkz1bkw8rE8w8j/X
	rUKZd1u5Wv8x6E/KBX2lC91hE35Vzpkr/N9dVhs1TvD+cdM+XgILD4PuDPpAXkX8OVcHHN
	/zfYQwoavbzJHKAQsmL5hRtpQdbzwWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-QKixKSZdP46EWkwADEhkyA-1; Tue, 27 Jul 2021 13:37:21 -0400
X-MC-Unique: QKixKSZdP46EWkwADEhkyA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1705D87D546;
	Tue, 27 Jul 2021 17:37:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75FA0710C5;
	Tue, 27 Jul 2021 17:37:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E961F180BAB2;
	Tue, 27 Jul 2021 17:37:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16RHbEUD022785 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 27 Jul 2021 13:37:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EAB7E19630; Tue, 27 Jul 2021 17:37:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-120.phx2.redhat.com [10.3.112.120])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BCB271980E
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 17:37:14 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 27 Jul 2021 12:36:55 -0500
Message-Id: <20210727173709.210711-2-rpeterso@redhat.com>
In-Reply-To: <20210727173709.210711-1-rpeterso@redhat.com>
References: <20210727173709.210711-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 01/15] gfs2: Add wrapper for
	iomap_file_buffered_write
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

From: Andreas Gruenbacher <agruenba@redhat.com>

Add a wrapper around iomap_file_buffered_write.  We'll add code for when
the operation needs to be retried here later.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 84ec053d43b4..55ec1cadc9e6 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -876,6 +876,18 @@ static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	return written ? written : ret;
 }
 
+static ssize_t gfs2_file_buffered_write(struct kiocb *iocb, struct iov_iter *from)
+{
+	struct file *file = iocb->ki_filp;
+	struct inode *inode = file_inode(file);
+	ssize_t ret;
+
+	current->backing_dev_info = inode_to_bdi(inode);
+	ret = iomap_file_buffered_write(iocb, from, &gfs2_iomap_ops);
+	current->backing_dev_info = NULL;
+	return ret;
+}
+
 /**
  * gfs2_file_write_iter - Perform a write to a file
  * @iocb: The io context
@@ -927,9 +939,7 @@ static ssize_t gfs2_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 			goto out_unlock;
 
 		iocb->ki_flags |= IOCB_DSYNC;
-		current->backing_dev_info = inode_to_bdi(inode);
-		buffered = iomap_file_buffered_write(iocb, from, &gfs2_iomap_ops);
-		current->backing_dev_info = NULL;
+		buffered = gfs2_file_buffered_write(iocb, from);
 		if (unlikely(buffered <= 0)) {
 			if (!ret)
 				ret = buffered;
@@ -951,9 +961,7 @@ static ssize_t gfs2_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		if (!ret || ret2 > 0)
 			ret += ret2;
 	} else {
-		current->backing_dev_info = inode_to_bdi(inode);
-		ret = iomap_file_buffered_write(iocb, from, &gfs2_iomap_ops);
-		current->backing_dev_info = NULL;
+		ret = gfs2_file_buffered_write(iocb, from);
 		if (likely(ret > 0)) {
 			iocb->ki_pos += ret;
 			ret = generic_write_sync(iocb, ret);
-- 
2.31.1

