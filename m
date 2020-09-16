Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0D43D26C3F2
	for <lists+cluster-devel@lfdr.de>; Wed, 16 Sep 2020 17:00:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600268442;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aJvsF0BH6us1O8J9LVH5Lx9AlIRUutfnZa+PjTDeH84=;
	b=HMuyWv9SxeztK+U3dQ01R/sIXrz6fpbYpArO6CSv77aEPCjXqn1QhNZ+KgH5w+rLnfJmiO
	gpvmL0czdupJ5OPFeFwPi/PQhPKVHTqQMCz3zoRjRVgKfaUBIdKi6Uso9YV9QWyzkOSZRu
	1ZTsXd0jA7PeamIS5zhGoKsIZkhlj+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-4cbl8twFOam6w1SpmeZnoQ-1; Wed, 16 Sep 2020 11:00:40 -0400
X-MC-Unique: 4cbl8twFOam6w1SpmeZnoQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4832B81C463;
	Wed, 16 Sep 2020 15:00:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02C5775141;
	Wed, 16 Sep 2020 15:00:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4BD38183D030;
	Wed, 16 Sep 2020 15:00:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08GF0VFt018947 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 11:00:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C29154D; Wed, 16 Sep 2020 15:00:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-23.phx2.redhat.com [10.3.112.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 902D85DE51
	for <cluster-devel@redhat.com>; Wed, 16 Sep 2020 15:00:31 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 16 Sep 2020 10:00:19 -0500
Message-Id: <20200916150020.36582-6-rpeterso@redhat.com>
In-Reply-To: <20200916150020.36582-1-rpeterso@redhat.com>
References: <20200916150020.36582-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 5/6] gfs2: simplify the logic in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
index 9fc4135a35c0..e07399110cd0 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1496,16 +1496,11 @@ static void gfs2_evict_inode(struct inode *inode)
 	ret = evict_should_delete(inode, &gh);
 	if (ret == SHOULD_DEFER_EVICTION)
 		goto out;
-	if (ret == SHOULD_NOT_DELETE_DINODE)
-		goto out_truncate;
-
-	ret = evict_deleted_inode(inode);
-	goto out_unlock;
-
-out_truncate:
-	ret = evict_saved_inode(inode);
+	if (ret == SHOULD_DELETE_DINODE)
+		ret = evict_deleted_inode(inode);
+	else
+		ret = evict_saved_inode(inode);
 
-out_unlock:
 	if (gfs2_rs_active(&ip->i_res))
 		gfs2_rs_deltree(&ip->i_res);
 
-- 
2.26.2

