Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7FEE0341800
	for <lists+cluster-devel@lfdr.de>; Fri, 19 Mar 2021 10:11:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616145093;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=j9Y4KBnQiZ4KVuGEUDFqGn9ZYSF+9Wh9+F+oFq313CA=;
	b=Kgusww18+fuVAKWU5uPnmiEKGbS5xhO1l7wvH4h49sWDArVAgA5QHo49vcpiMgucg+kw9F
	QMkQFkDTb8Y2O+6aqBgyGDbLxqFBNanZ4Yy1NVb1YRF/hF0ISFXApWi10Sosa2guK515Jd
	bxHW9SalZ9pcKxA2Vp32E4GI9/7USs4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-JPEkC2M0M7qazcw1WgLg9w-1; Fri, 19 Mar 2021 05:11:32 -0400
X-MC-Unique: JPEkC2M0M7qazcw1WgLg9w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD535180FCAB;
	Fri, 19 Mar 2021 09:11:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 114DB5D9F2;
	Fri, 19 Mar 2021 09:11:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 177591800662;
	Fri, 19 Mar 2021 09:11:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12J9BNx8020926 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 19 Mar 2021 05:11:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 13E7D5D72E; Fri, 19 Mar 2021 09:11:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.56])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B72A5D740
	for <cluster-devel@redhat.com>; Fri, 19 Mar 2021 09:11:22 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 19 Mar 2021 09:11:16 +0000
Message-Id: <20210319091116.219088-2-anprice@redhat.com>
In-Reply-To: <20210319091116.219088-1-anprice@redhat.com>
References: <20210319091116.219088-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 2/2] gfs2_jadd: Don't fsync after each block
	written
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

gfs2_jadd has always called fsync() after writing each block of the
journal. There doesn't seem to be any need for that so take the fsync()
call out of the loop.

Add an additional fsync() after preallocation to make sure we're in good
shape before writing the log headers.

In my tests this reduces the time to add one journal from 5 minutes to
9 seconds.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/mkfs/main_jadd.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/gfs2/mkfs/main_jadd.c b/gfs2/mkfs/main_jadd.c
index 0a18bfb2..2bd0f7b0 100644
--- a/gfs2/mkfs/main_jadd.c
+++ b/gfs2/mkfs/main_jadd.c
@@ -537,6 +537,11 @@ static int add_j(struct gfs2_sbd *sdp, struct jadd_opts *opts)
 	if (error != 0)
 		goto close_fd;
 
+	error = fsync(fd);
+	if (error != 0) {
+		perror("Failed to sync journal metadata");
+		goto close_fd;
+	}
 	if ((error = lseek(fd, 0, SEEK_SET)) < 0) {
 		perror("add_j lseek");
 		goto close_fd;
@@ -580,12 +585,12 @@ static int add_j(struct gfs2_sbd *sdp, struct jadd_opts *opts)
 			seq = 0;
 		off += sdp->bsize;
 
-		if ((error = fsync(fd))) {
-			perror("add_j fsync");
-			goto close_fd;
-		}
 	}
-
+	error = fsync(fd);
+	if (error != 0) {
+		perror("Failed to sync journal metadata");
+		goto close_fd;
+	}
 	sprintf(new_name, "journal%u", opts->journals);
 	error = rename2system(opts, opts->jindex, new_name);
 	if (error < 0 && errno != EEXIST){
-- 
2.30.2

