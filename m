Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 83E9233E564
	for <lists+cluster-devel@lfdr.de>; Wed, 17 Mar 2021 02:03:59 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-dNuZL9h6PP-mpNIAO0gktA-1; Tue, 16 Mar 2021 21:03:56 -0400
X-MC-Unique: dNuZL9h6PP-mpNIAO0gktA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20A0E801984;
	Wed, 17 Mar 2021 01:03:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D301B5D739;
	Wed, 17 Mar 2021 01:03:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E790D57DC0;
	Wed, 17 Mar 2021 01:03:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12H13oT0031543 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Mar 2021 21:03:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4E86A1003210; Wed, 17 Mar 2021 01:03:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A7591005B82
	for <cluster-devel@redhat.com>; Wed, 17 Mar 2021 01:03:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CA7880A0B0
	for <cluster-devel@redhat.com>; Wed, 17 Mar 2021 01:03:47 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-350-DjVmIUx8MJ2uBfUzaesX3w-1;
	Tue, 16 Mar 2021 21:03:43 -0400
X-MC-Unique: DjVmIUx8MJ2uBfUzaesX3w-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99B5B64F96;
	Wed, 17 Mar 2021 00:55:58 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Tue, 16 Mar 2021 20:54:52 -0400
Message-Id: <20210317005536.724046-18-sashal@kernel.org>
In-Reply-To: <20210317005536.724046-1-sashal@kernel.org>
References: <20210317005536.724046-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 12H13oT0031543
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.11 18/61] gfs2: fix use-after-free
	in trans_drain
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 8bit

From: Bob Peterson <rpeterso@redhat.com>

[ Upstream commit 1a5a2cfd34c17db73c53ef127272c8c1ae220485 ]

This patch adds code to function trans_drain to remove drained
bd elements from the ail lists, if queued, before freeing the bd.
If we don't remove the bd from the ail, function ail_drain will
try to reference the bd after it has been freed by trans_drain.

Thanks to Andy Price for his analysis of the problem.

Reported-by: Andy Price <anprice@redhat.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/log.c   | 4 ++++
 fs/gfs2/trans.c | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 2e9314091c81..1955dea999f7 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -935,12 +935,16 @@ static void trans_drain(struct gfs2_trans *tr)
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
index 6d4bf7ea7b3b..7f850ff6a05d 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -134,6 +134,8 @@ static struct gfs2_bufdata *gfs2_alloc_bufdata(struct gfs2_glock *gl,
 	bd->bd_bh = bh;
 	bd->bd_gl = gl;
 	INIT_LIST_HEAD(&bd->bd_list);
+	INIT_LIST_HEAD(&bd->bd_ail_st_list);
+	INIT_LIST_HEAD(&bd->bd_ail_gl_list);
 	bh->b_private = bd;
 	return bd;
 }
-- 
2.30.1


