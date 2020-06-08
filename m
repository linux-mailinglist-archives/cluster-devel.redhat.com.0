Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D1EE21F1C94
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jun 2020 18:01:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591632063;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LAyH/mfpVC/BtisupOfXGQDVfTsgYrlMD2Jv1Ow273w=;
	b=MnukLXY5FE77FP5g6rPMt7t2Jr91KVLp5vUUNAmJS97gwXUJnvwNYnn6q1NvjpiXvs884E
	sKW9BclRK2mVfkek2Ba2ESBJwpSKAd2Sp9jXeFw1U2egRoht6BwGJtqoXDAGroDjXXqixp
	G0sJLjANNf1kNhKWNR07/+eRmisRUOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-HHKyHAn-NtekGojjvtzBIA-1; Mon, 08 Jun 2020 12:01:01 -0400
X-MC-Unique: HHKyHAn-NtekGojjvtzBIA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D406EC1A0;
	Mon,  8 Jun 2020 16:00:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B7421A8EA;
	Mon,  8 Jun 2020 16:00:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 378871809554;
	Mon,  8 Jun 2020 16:00:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058G0uYx011668 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 12:00:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 176D41CA; Mon,  8 Jun 2020 16:00:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B1788926C;
	Mon,  8 Jun 2020 16:00:54 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon,  8 Jun 2020 18:00:27 +0200
Message-Id: <20200608160039.549204-9-agruenba@redhat.com>
In-Reply-To: <20200608160039.549204-1-agruenba@redhat.com>
References: <20200608160039.549204-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 08/20] gfs2: Allow ASPACE glocks to also
	have an lvb
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

From: Bob Peterson <rpeterso@redhat.com>

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index bf70e3b14938..86e9e621f346 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -125,12 +125,11 @@ static void gfs2_glock_dealloc(struct rcu_head *rcu)
 {
 	struct gfs2_glock *gl = container_of(rcu, struct gfs2_glock, gl_rcu);
 
-	if (gl->gl_ops->go_flags & GLOF_ASPACE) {
+	kfree(gl->gl_lksb.sb_lvbptr);
+	if (gl->gl_ops->go_flags & GLOF_ASPACE)
 		kmem_cache_free(gfs2_glock_aspace_cachep, gl);
-	} else {
-		kfree(gl->gl_lksb.sb_lvbptr);
+	else
 		kmem_cache_free(gfs2_glock_cachep, gl);
-	}
 }
 
 /**
-- 
2.26.2

