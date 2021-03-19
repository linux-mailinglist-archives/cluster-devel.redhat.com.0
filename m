Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5A26D341801
	for <lists+cluster-devel@lfdr.de>; Fri, 19 Mar 2021 10:11:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616145095;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=f1Dgk+cSyxy8JaMZKTv1IdlgNRjq4EPY9Izyj3ffsbM=;
	b=caPMiqTFf0T/0Wuac+MXtK+Xr1+i62wcNyOidcP551DVKwpyLiDyemLDaZimMai5FR542V
	WlqHB2NRN1URaNmTVy9LMtptPiG8FXoiUMxF6cwMMVdqqWwnpT9WPty1KHVRWNjrHgJNcb
	RFmW3PU+6k9vLFOQtibDE6OT8C82Nt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-8zQRJBO1NIu24mR7MfcASA-1; Fri, 19 Mar 2021 05:11:33 -0400
X-MC-Unique: 8zQRJBO1NIu24mR7MfcASA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82629107AFA5;
	Fri, 19 Mar 2021 09:11:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E6BB10013D7;
	Fri, 19 Mar 2021 09:11:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B6B41800216;
	Fri, 19 Mar 2021 09:11:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12J9BMUu020921 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 19 Mar 2021 05:11:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 35D495D740; Fri, 19 Mar 2021 09:11:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.56])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97C075D72E
	for <cluster-devel@redhat.com>; Fri, 19 Mar 2021 09:11:18 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 19 Mar 2021 09:11:15 +0000
Message-Id: <20210319091116.219088-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 1/2] gfs2_jadd: Use fallocate to preallocate
	journals
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

Fall back to writes for ancient kernels and use larger writes in that
case to reduce the chance of fragmentation.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/mkfs/main_jadd.c | 48 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 8 deletions(-)

diff --git a/gfs2/mkfs/main_jadd.c b/gfs2/mkfs/main_jadd.c
index 7583ba0f..0a18bfb2 100644
--- a/gfs2/mkfs/main_jadd.c
+++ b/gfs2/mkfs/main_jadd.c
@@ -480,6 +480,43 @@ static uint64_t find_block_address(int fd, off_t offset, unsigned bsize)
 }
 #endif
 
+static int alloc_new_journal(int fd, unsigned bytes)
+{
+#define ALLOC_BUF_SIZE (4 << 20)
+	unsigned left = bytes;
+	int error;
+	char *buf;
+
+	error = fallocate(fd, 0, 0, bytes);
+	if (error == 0)
+	       return 0;
+	if (errno != EOPNOTSUPP)
+		goto out_errno;
+
+	/* No fallocate support, fall back to writes */
+	buf = calloc(1, ALLOC_BUF_SIZE);
+	if (buf == NULL)
+		goto out_errno;
+
+	while (left > 0) {
+		unsigned sz = ALLOC_BUF_SIZE;
+
+		if (left < ALLOC_BUF_SIZE)
+			sz = left;
+
+		if (pwrite(fd, buf, sz, bytes - left) != sz) {
+			free(buf);
+			goto out_errno;
+		}
+		left -= sz;
+	}
+	free(buf);
+	return 0;
+out_errno:
+	perror("Failed to allocate space for new journal");
+	return -1;
+}
+
 static int add_j(struct gfs2_sbd *sdp, struct jadd_opts *opts)
 {
 	int fd, error = 0;
@@ -496,14 +533,9 @@ static int add_j(struct gfs2_sbd *sdp, struct jadd_opts *opts)
 	if ((error = set_flags(fd, JA_FL_CLEAR, FS_JOURNAL_DATA_FL)))
 		goto close_fd;
 
-	memset(buf, 0, sdp->bsize);
-	for (x=0; x<blocks; x++) {
-		if (write(fd, buf, sdp->bsize) != sdp->bsize) {
-			perror("add_j write");
-			error = -1;
-			goto close_fd;
-		}
-	}
+	error = alloc_new_journal(fd, sdp->jsize << 20);
+	if (error != 0)
+		goto close_fd;
 
 	if ((error = lseek(fd, 0, SEEK_SET)) < 0) {
 		perror("add_j lseek");
-- 
2.30.2

