Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B2E5B28015C
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Oct 2020 16:34:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601562898;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cajs05Par6+Fa9MYY5nJroRz3oicKEdrn+TsWf2KRzE=;
	b=YUpAagMRkdx2SW/JA6d17l9/lwxrXBTrh6Kq0SvBIFbxJpdLy3in1JWSgVjLGQJMm5E0Iq
	wgV9Es9GbFyfkjObIut8XGRHjHM0mQd31t88am95DfNc/W4R3wBY0yfBYBWEL5UvwWM+Qx
	hQnkcRYa2YJ1vj5qp/GxAXAJTKHuoiw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-YExdxVhRNCuoqoI07n7g_w-1; Thu, 01 Oct 2020 10:34:55 -0400
X-MC-Unique: YExdxVhRNCuoqoI07n7g_w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA515104D3E0;
	Thu,  1 Oct 2020 14:34:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C0547367B;
	Thu,  1 Oct 2020 14:34:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 36AD744A58;
	Thu,  1 Oct 2020 14:34:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 091EWH29001433 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 1 Oct 2020 10:32:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 486897367E; Thu,  1 Oct 2020 14:32:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 954F173671
	for <cluster-devel@redhat.com>; Thu,  1 Oct 2020 14:32:16 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  1 Oct 2020 15:32:08 +0100
Message-Id: <20201001143208.1893890-3-anprice@redhat.com>
In-Reply-To: <20201001143208.1893890-1-anprice@redhat.com>
References: <20201001143208.1893890-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 3/3] mkfs.gfs2: Check for negative -j option
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

When a bad -j argument like -j -2 is given, mkfs.gfs2 prints a confusing
error that the fs will not fit on the disk. Add a specific check and
error message for that case.

Tidy up some other bad option error messages while we're at it.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/mkfs/main_mkfs.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index b8aa22b4..17643e59 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -119,7 +119,7 @@ struct mkfs_opts {
 	unsigned long sunit;
 	unsigned long swidth;
 	uint64_t fssize;
-	uint32_t journals;
+	int journals;
 	const char *lockproto;
 	const char *locktable;
 	struct mkfs_dev dev;
@@ -582,22 +582,25 @@ static int opts_check(struct mkfs_opts *opts)
 	if (GFS2_MIN_RGSIZE > opts->rgsize || opts->rgsize > GFS2_MAX_RGSIZE) {
 		/* Translators: gfs2 file systems are split into equal sized chunks called
 		   resource groups. We're checking that the user gave a valid size for them. */
-		fprintf(stderr, _("bad resource group size\n"));
+		fprintf(stderr, _("Bad resource group size\n"));
 		return -1;
 	}
 
 	if (!opts->journals) {
-		fprintf(stderr, _("no journals specified\n"));
+		fprintf(stderr, _("No journals specified\n"));
+		return -1;
+	}
+	if (opts->journals < 0) {
+		fprintf(stderr, _("Number of journals cannot be negative: %d\n"), opts->journals);
 		return -1;
 	}
-
 	if (opts->jsize < GFS2_MIN_JSIZE || opts->jsize > GFS2_MAX_JSIZE) {
-		fprintf(stderr, _("bad journal size\n"));
+		fprintf(stderr, _("Bad journal size\n"));
 		return -1;
 	}
 
 	if (!opts->qcsize || opts->qcsize > 64) {
-		fprintf(stderr, _("bad quota change size\n"));
+		fprintf(stderr, _("Bad quota change size\n"));
 		return -1;
 	}
 
-- 
2.26.2

