Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 035AD2BFCEB
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Nov 2020 00:10:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606086650;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZNG0YH/ZrLTcEZELKyIz/iyG9kEitgfXuqVqYfCQJMc=;
	b=We8rnni7u/vT8Ng6Akn8kjm3S117ydpFDg9l++Z3Hg4u2QSUhhmyaafHi7pPKwujBn5A1m
	nixhB3IF/AuZN9U1Cjynr7T7bq8DJQKwG4L6IMee6QCTO+xK19F08SIXhqR0c2BRlLyZdz
	voD/ClIHsIUMDvTsLkKUcz9HLqax6X8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-Lcp6bvuANgmM03Lmhdq4bw-1; Sun, 22 Nov 2020 18:10:49 -0500
X-MC-Unique: Lcp6bvuANgmM03Lmhdq4bw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91C775204;
	Sun, 22 Nov 2020 23:10:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 106215C1C4;
	Sun, 22 Nov 2020 23:10:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77868180954D;
	Sun, 22 Nov 2020 23:10:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AMNAhH3024780 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 22 Nov 2020 18:10:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4D3B05D6D7; Sun, 22 Nov 2020 23:10:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-113-14.rdu2.redhat.com [10.10.113.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B62AC5D6D3;
	Sun, 22 Nov 2020 23:10:39 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: cluster-devel@redhat.com
Date: Sun, 22 Nov 2020 18:10:24 -0500
Message-Id: <20201122231024.249253-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH gfs2/for-next] gfs2: Fix deadlock dumping
	resource group glocks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Commit 0e539ca1bbbe ("gfs2: Fix NULL pointer dereference in gfs2_rgrp_dump")
introduced additional locking in gfs2_rgrp_go_dump, which is also used for
dumping resource group glocks via debugfs.  However, on that code path, the
glock spin lock is already taken in dump_glock, and taking it again in
gfs2_glock2rgrp leads to deadlock.  This can be reproduced with:

  $ mkfs.gfs2 -O -p lock_nolock /dev/FOO
  $ mount /dev/FOO /mnt/foo
  $ touch /mnt/foo/bar
  $ cat /sys/kernel/debug/gfs2/FOO/glocks

Fix that by not taking the glock spin lock inside the go_dump callback.

Fixes: 0e539ca1bbbe ("gfs2: Fix NULL pointer dereference in gfs2_rgrp_dump")
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/gfs2/glops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 67f2921ae8d4..6cedeefb7b3f 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -245,7 +245,7 @@ static void rgrp_go_inval(struct gfs2_glock *gl, int flags)
 static void gfs2_rgrp_go_dump(struct seq_file *seq, struct gfs2_glock *gl,
 			      const char *fs_id_buf)
 {
-	struct gfs2_rgrpd *rgd = gfs2_glock2rgrp(gl);
+	struct gfs2_rgrpd *rgd = gl->gl_object;
 
 	if (rgd)
 		gfs2_rgrp_dump(seq, rgd, fs_id_buf);
-- 
2.26.2

