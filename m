Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0230135DFAF
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Apr 2021 15:06:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618319180;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DmD9vbtL3EF54GkgleaJFGRe4jgkdlj/bDG6+iQXCk0=;
	b=I3pUo7L0pxvGhOgyo3BGuBLq0HtseDu1RRJwkj8v5+rLZT96+kdbvoql57DiYYJNbXcQNm
	WqkPz2I4h9a9cD1dQw69hi1P8/+5czAXvJILxo9Za3lwNg1DiozPV1VjilzffTT6VVNfqD
	nymP5OcYh4eeQhW++Joa1mfCgdfpDPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-GyjMJW_bMv6tnWOJQfhpDw-1; Tue, 13 Apr 2021 09:06:18 -0400
X-MC-Unique: GyjMJW_bMv6tnWOJQfhpDw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E09F58030A1;
	Tue, 13 Apr 2021 13:06:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE963104C477;
	Tue, 13 Apr 2021 13:06:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 892731806D16;
	Tue, 13 Apr 2021 13:06:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13DD6AIv031059 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Apr 2021 09:06:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DBFCC1042A9C; Tue, 13 Apr 2021 13:06:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.36.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D88810589BE
	for <cluster-devel@redhat.com>; Tue, 13 Apr 2021 13:06:09 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 13 Apr 2021 14:05:30 +0100
Message-Id: <20210413130532.1277163-4-anprice@redhat.com>
In-Reply-To: <20210413130532.1277163-1-anprice@redhat.com>
References: <20210413130532.1277163-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 3/5] fsck.gfs2: Rename ri_update to
	read_rgrps
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

Give it a name that matches what it does.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/fsck/initialize.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index 5be561f8..4c266d9a 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -675,7 +675,7 @@ static unsigned gfs2_rgrp_reada(struct gfs2_sbd *sdp, unsigned cur_window,
 }
 
 /**
- * ri_update - attach rgrps to the super block
+ * read_rgrps - attach rgrps to the super block
  * @sdp: incore superblock data
  * @expected: number of resource groups expected (rindex entries)
  *
@@ -684,7 +684,7 @@ static unsigned gfs2_rgrp_reada(struct gfs2_sbd *sdp, unsigned cur_window,
  *
  * Returns: 0 on success, -1 on failure.
  */
-static int ri_update(struct gfs2_sbd *sdp, uint64_t expected)
+static int read_rgrps(struct gfs2_sbd *sdp, uint64_t expected)
 {
 	struct rgrp_tree *rgd;
 	struct gfs2_rindex *ri;
@@ -754,7 +754,7 @@ static int fetch_rgrps_level(struct gfs2_sbd *sdp, enum rgindex_trust_level lvl,
 	if (rindex_read(sdp, count, ok) != 0)
 		goto fail;
 
-	ret = ri_update(sdp, *count);
+	ret = read_rgrps(sdp, *count);
 	if (ret != 0)
 		goto fail;
 
-- 
2.30.2

