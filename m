Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2F433B289
	for <lists+cluster-devel@lfdr.de>; Mon, 15 Mar 2021 13:24:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615811062;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o0JiwVutROb/L5qfgvUNHgNEH2+OKS7hhAu3uEq5ZWg=;
	b=V0JSZ8C7TJtf2aiyTBfldWQ7MaHwyh1RsETHytWyHZdVqDaibNRIUoLZmDn8V50u2Nq1GC
	NJNirYZJhm5j/H7zNc3dwqXTSg1PMX92r/xky9GWnfGrg2wEf5GB304v1SJJIyXMMwrId+
	3C2cFmfQmmxaZIFbNEFsTA5ZFmQ2ze0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-Gb7PU8ueP_qhmwbFrB870Q-1; Mon, 15 Mar 2021 08:24:20 -0400
X-MC-Unique: Gb7PU8ueP_qhmwbFrB870Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E975118460E0;
	Mon, 15 Mar 2021 12:24:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B799A19D7C;
	Mon, 15 Mar 2021 12:24:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CCDBE1800B72;
	Mon, 15 Mar 2021 12:24:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12FCO91n027857 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 15 Mar 2021 08:24:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5E81F100F49F; Mon, 15 Mar 2021 12:24:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (ovpn-115-218.ams2.redhat.com
	[10.36.115.218])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DE3C10190A7;
	Mon, 15 Mar 2021 12:24:02 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 15 Mar 2021 12:24:00 +0000
Message-Id: <20210315122400.1636159-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Flag a withdraw if init_threads()
	fails
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Interrupting mount with ^C quickly enough can cause the kthread_run()
calls in gfs2's init_threads() to fail and the error path leads to a
deadlock on the s_umount rwsem. The abridged chain of events is:

  [mount path]
  get_tree_bdev()
    sget_fc()
      alloc_super()
        down_write_nested(&s->s_umount, SINGLE_DEPTH_NESTING); [acquired]
    gfs2_fill_super()
      gfs2_make_fs_rw()
        init_threads()
          kthread_run()
            ( Interrupted )
      [Error path]
      gfs2_gl_hash_clear()
        flush_workqueue(glock_workqueue)
          wait_for_completion()

  [workqueue context]
  glock_work_func()
    run_queue()
      do_xmote()
        freeze_go_sync()
          freeze_super()
            down_write(&sb->s_umount) [deadlock]

In freeze_go_sync() there is a gfs2_withdrawn() check that we can use to
make sure freeze_super() is not called in the error path, so add a
gfs2_withdraw_delayed() call when init_threads() fails.

Ref: https://bugzilla.kernel.org/show_bug.cgi?id=212231

Reported-by: Alexander Aring <aahringo@redhat.com>
Signed-off-by: Andrew Price <anprice@redhat.com>
---
 fs/gfs2/super.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 97076d3f562f..9e91c9d92bd6 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -162,8 +162,10 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
 	int error;
 
 	error = init_threads(sdp);
-	if (error)
+	if (error) {
+		gfs2_withdraw_delayed(sdp);
 		return error;
+	}
 
 	j_gl->gl_ops->go_inval(j_gl, DIO_METADATA);
 	if (gfs2_withdrawn(sdp)) {
-- 
2.29.2

