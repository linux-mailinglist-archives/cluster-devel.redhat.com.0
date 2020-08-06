Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0D66B23DACE
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:38:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721106;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jyJY/eC4r4q2ihk59zaQM+UYq+sxXDJ3yMeWKcsD2ao=;
	b=EDj2lzxWsUtd4il1l2I9qXQik6X6hMLbwLJOzAldcoYbFs/XwEh3e1zSa3sN09ZjaYkiQk
	yPcfJRxW8tavBnME0WNsaN5jBJ/WgwShnwz6C20bId0chi04u+Kc/3bHrV4rlEoQtaMsXS
	wODY1G6Jj8ZU5tBHeC0OtpAwfSGao44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-eRDrV-qvMHqPTQ5pzW6OPw-1; Thu, 06 Aug 2020 09:38:24 -0400
X-MC-Unique: eRDrV-qvMHqPTQ5pzW6OPw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22817800138;
	Thu,  6 Aug 2020 13:38:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 026386FEDC;
	Thu,  6 Aug 2020 13:38:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CADB81809557;
	Thu,  6 Aug 2020 13:38:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076DcEHv030624 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1288C60C47; Thu,  6 Aug 2020 13:38:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 615C560BF1
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:13 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:36 +0100
Message-Id: <20200806133807.111280-2-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 01/32] savemeta: Allow saving to /dev/null
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Guard against calling ftruncate() on special files, which is an EINVAL.
This allows test 'saving' to /dev/null e.g. to measure read performance
better.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 8 ++++++--
 tests/edit.at        | 8 ++++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 3bd35843..b44e887e 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -447,6 +447,7 @@ static struct metafd savemetaopen(char *out_fn, int gziplevel)
 	char gzmode[3] = "w9";
 	char dft_fn[] = DFT_SAVE_FILE;
 	mode_t mask = umask(S_IXUSR | S_IRWXG | S_IRWXO);
+	struct stat st;
 
 	mfd.gziplevel = gziplevel;
 
@@ -463,8 +464,11 @@ static struct metafd savemetaopen(char *out_fn, int gziplevel)
 		fprintf(stderr, "Can't open %s: %s\n", out_fn, strerror(errno));
 		exit(1);
 	}
-
-	if (ftruncate(mfd.fd, 0)) {
+	if (fstat(mfd.fd, &st) == -1) {
+		fprintf(stderr, "Failed to stat %s: %s\n", out_fn, strerror(errno));
+		exit(1);
+	}
+	if (S_ISREG(st.st_mode) && ftruncate(mfd.fd, 0)) {
 		fprintf(stderr, "Can't truncate %s: %s\n", out_fn, strerror(errno));
 		exit(1);
 	}
diff --git a/tests/edit.at b/tests/edit.at
index c9c341b9..d70d012e 100644
--- a/tests/edit.at
+++ b/tests/edit.at
@@ -53,3 +53,11 @@ GFS_TGT_REGEN
 AT_CHECK([gfs2_edit restoremeta test.meta $GFS_TGT], 0, [ignore], [ignore])
 AT_CHECK([fsck.gfs2 -n $GFS_TGT], 0, [ignore], [ignore])
 AT_CLEANUP
+
+AT_SETUP([Save metadata to /dev/null])
+AT_KEYWORDS(gfs2_edit edit)
+GFS_TGT_REGEN
+AT_CHECK([$GFS_MKFS -p lock_nolock $GFS_TGT], 0, [ignore], [ignore])
+AT_CHECK([gfs2_edit savemeta -z0 $GFS_TGT /dev/null], 0, [ignore], [ignore])
+AT_CHECK([gfs2_edit savemeta $GFS_TGT /dev/null], 0, [ignore], [ignore])
+AT_CLEANUP
-- 
2.26.2

