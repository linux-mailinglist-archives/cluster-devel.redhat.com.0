Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A97F432B91C
	for <lists+cluster-devel@lfdr.de>; Wed,  3 Mar 2021 17:12:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614787941;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=n5gzn0pdFXaYBku1Cve/2IOUIdp67VJRaOg/WXQ3zoo=;
	b=XD/gdVvJgwR1HcZ5La4A5BnZpIomA2lephpYsG2qu2F+vy5EBqtxb/D7rteQnpA5tKu9S1
	hY0LITb1baQwOxEE2Q+wjaCQ/Lt01cBiC8Bpzr1rQRrTnhXeBC7h6aI9gYtzhbvE9mSnjF
	rFDd8y6zaW1SdB8sSDXZvAyHuyWU1HM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-qPsO5eVjPmqN0qyLpx4iew-1; Wed, 03 Mar 2021 11:12:18 -0500
X-MC-Unique: qPsO5eVjPmqN0qyLpx4iew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6A331E561;
	Wed,  3 Mar 2021 16:12:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 413F96091B;
	Wed,  3 Mar 2021 16:12:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4A7F318095CB;
	Wed,  3 Mar 2021 16:12:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 123GC31w019889 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 3 Mar 2021 11:12:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 31FAA5D745; Wed,  3 Mar 2021 16:12:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFD5F5D705;
	Wed,  3 Mar 2021 16:11:59 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B64464BB40;
	Wed,  3 Mar 2021 16:11:59 +0000 (UTC)
Date: Wed, 3 Mar 2021 11:11:59 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <353695111.59314152.1614787919661.JavaMail.zimbra@redhat.com>
In-Reply-To: <677297398.59314116.1614787840714.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.116, 10.4.195.16]
Thread-Topic: gfs2: fix use-after-free in trans_drain
Thread-Index: ekcVwyijrlb+svbFPSVJid34XXGZrA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: fix use-after-free in trans_drain
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This patch adds code to function trans_drain to remove drained
bd elements from the ail lists, if queued, before freeing the bd.
If we don't remove the bd from the ail, function ail_drain will
try to reference the bd after it has been freed by trans_drain.

Thanks to Andy Price for his analysis of the problem.

Reported-by: Andy Price <anprice@redhat.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c   | 4 ++++
 fs/gfs2/trans.c | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 16937ebb2a3e..760af666576c 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -998,12 +998,16 @@ static void trans_drain(struct gfs2_trans *tr)
 	while (!list_empty(head)) {
 		bd = list_first_entry(head, struct gfs2_bufdata, bd_list);
 		list_del_init(&bd->bd_list);
+		if (!list_empty(&bd->bd_ail_st_list))
+			gfs2_remove_from_ail(bd);
 		kmem_cache_free(gfs2_bufdata_cachep, bd);
 	}
 	head = &tr->tr_databuf;
 	while (!list_empty(head)) {
 		bd = list_first_entry(head, struct gfs2_bufdata, bd_list);
 		list_del_init(&bd->bd_list);
+		if (!list_empty(&bd->bd_ail_st_list))
+			gfs2_remove_from_ail(bd);
 		kmem_cache_free(gfs2_bufdata_cachep, bd);
 	}
 }
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index ab96cf0bf26b..63fec11ef2ce 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -169,6 +169,8 @@ static struct gfs2_bufdata *gfs2_alloc_bufdata(struct gfs2_glock *gl,
 	bd->bd_bh = bh;
 	bd->bd_gl = gl;
 	INIT_LIST_HEAD(&bd->bd_list);
+	INIT_LIST_HEAD(&bd->bd_ail_st_list);
+	INIT_LIST_HEAD(&bd->bd_ail_gl_list);
 	bh->b_private = bd;
 	return bd;
 }

