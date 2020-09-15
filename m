Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id DC15F26A73D
	for <lists+cluster-devel@lfdr.de>; Tue, 15 Sep 2020 16:38:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600180713;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=a63Q9aqpXL0Hv6oS1VJDEVqxMIR8qVWUUT1fWPc6P2Q=;
	b=N/M71NpAxCR2NsFBJynGA41DVIRtlLEiM6wsMAPbtM7dwGNTSOoFYeVrPLl2PgR/a0ahqg
	K58PzDvvxVYXfExIHlDZAZ6T77dyy7/voob46yN5DTZHPC0oz9qVnT0zyOFtA6rxxi8OOd
	CzPxoFqN8r+eANwapvYNaAj0UxkHrtk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-CqYrQmglPByxKEOSdfzbuw-1; Tue, 15 Sep 2020 10:38:32 -0400
X-MC-Unique: CqYrQmglPByxKEOSdfzbuw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BACD48797D4;
	Tue, 15 Sep 2020 14:38:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9C6860C0F;
	Tue, 15 Sep 2020 14:38:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9264144A56;
	Tue, 15 Sep 2020 14:38:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08FEcO3J013104 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 10:38:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D23F860BE2; Tue, 15 Sep 2020 14:38:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-23.phx2.redhat.com [10.3.112.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A2A0860E1C
	for <cluster-devel@redhat.com>; Tue, 15 Sep 2020 14:38:24 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 15 Sep 2020 09:38:22 -0500
Message-Id: <20200915143822.16485-6-rpeterso@redhat.com>
In-Reply-To: <20200915143822.16485-1-rpeterso@redhat.com>
References: <20200915143822.16485-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 5/5] gfs2: simplify the logic in
	gfs2_evict_inode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Now that we've factored out the deleted and undeleted dinode cases
in gfs2_evict_inode, we can greatly simplify the logic. Now the function
is easy to read and understand.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 46260f370090..a1b72c371622 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1498,16 +1498,11 @@ static void gfs2_evict_inode(struct inode *inode)
 	ret = may_delete_evicted(inode, &gh);
 	if (ret == -EEXIST)
 		goto out;
-	if (!ret)
-		goto out_truncate;
-
-	ret = delete_evicted_inode(inode);
-	goto out_unlock;
-
-out_truncate:
-	evict_saved_inode(inode);
+	if (ret)
+		ret = delete_evicted_inode(inode);
+	else
+		evict_saved_inode(inode);
 
-out_unlock:
 	if (gfs2_rs_active(&ip->i_res))
 		gfs2_rs_deltree(&ip->i_res);
 
-- 
2.26.2

