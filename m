Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 88E9B299D6E
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Oct 2020 01:07:33 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-Xk6rEvjIPo-k5CdUtEHTVg-1; Mon, 26 Oct 2020 20:07:30 -0400
X-MC-Unique: Xk6rEvjIPo-k5CdUtEHTVg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCD53803F4C;
	Tue, 27 Oct 2020 00:07:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DDFA6EF50;
	Tue, 27 Oct 2020 00:07:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 552F8181A06C;
	Tue, 27 Oct 2020 00:07:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09QNpjkT020547 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Oct 2020 19:51:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0459985CC1; Mon, 26 Oct 2020 23:51:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1B929458A
	for <cluster-devel@redhat.com>; Mon, 26 Oct 2020 23:51:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B80BD8D6329
	for <cluster-devel@redhat.com>; Mon, 26 Oct 2020 23:51:42 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-301-4Fus4cWNNKq0ftsLOMPjoA-1;
	Mon, 26 Oct 2020 19:51:38 -0400
X-MC-Unique: 4Fus4cWNNKq0ftsLOMPjoA-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A56F821BE5;
	Mon, 26 Oct 2020 23:51:35 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon, 26 Oct 2020 19:48:41 -0400
Message-Id: <20201026234905.1022767-123-sashal@kernel.org>
In-Reply-To: <20201026234905.1022767-1-sashal@kernel.org>
References: <20201026234905.1022767-1-sashal@kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09QNpjkT020547
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.9 123/147] gfs2: call
	truncate_inode_pages_final for address space glocks
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
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 8bit

From: Bob Peterson <rpeterso@redhat.com>

[ Upstream commit ee1e2c773e4f4ce2213f9d77cc703b669ca6fa3f ]

Before this patch, we were not calling truncate_inode_pages_final for the
address space for glocks, which left the possibility of a leak. We now
take care of the problem instead of complaining, and we do it during
glock tear-down..

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/glock.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index f13b136654cae..3554e71be06ec 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -270,7 +270,12 @@ static void __gfs2_glock_put(struct gfs2_glock *gl)
 	gfs2_glock_remove_from_lru(gl);
 	spin_unlock(&gl->gl_lockref.lock);
 	GLOCK_BUG_ON(gl, !list_empty(&gl->gl_holders));
-	GLOCK_BUG_ON(gl, mapping && mapping->nrpages && !gfs2_withdrawn(sdp));
+	if (mapping) {
+		truncate_inode_pages_final(mapping);
+		if (!gfs2_withdrawn(sdp))
+			GLOCK_BUG_ON(gl, mapping->nrpages ||
+				     mapping->nrexceptional);
+	}
 	trace_gfs2_glock_put(gl);
 	sdp->sd_lockstruct.ls_ops->lm_put_lock(gl);
 }
-- 
2.25.1


