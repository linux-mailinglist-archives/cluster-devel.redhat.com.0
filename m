Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DB6CC24DE8C
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Aug 2020 19:34:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598031239;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oWI6qjQFdUujpaqU6yWzIW4wJnhJCgDPRkg/FLo0Yjs=;
	b=WF6dvl3YPY6Te3PRqYEQ7EyZ26P0H49X5ehLc5N2q7nnvv5Mb7s2Jsfo2RpYqMWp9MeFw8
	vJ7vne02XWHZMKnBoQ+Y6TDrJNs3pgn1jSrmxfI4PuwTyUrKoR+vyvdNeQI89kOjC6EIF1
	eLRuI870NoQJwaVpWz9Z5EGmY6qN2vs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-Z8HF0qx6Nnug8KNxwv6zOA-1; Fri, 21 Aug 2020 13:33:58 -0400
X-MC-Unique: Z8HF0qx6Nnug8KNxwv6zOA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10DF481F03A;
	Fri, 21 Aug 2020 17:33:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 015BC7C55A;
	Fri, 21 Aug 2020 17:33:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E03FE181A88C;
	Fri, 21 Aug 2020 17:33:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LHXi7v028423 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 13:33:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 16D2E5DA74; Fri, 21 Aug 2020 17:33:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-102.phx2.redhat.com [10.3.112.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D82775DA78
	for <cluster-devel@redhat.com>; Fri, 21 Aug 2020 17:33:43 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 21 Aug 2020 12:33:33 -0500
Message-Id: <20200821173337.20377-9-rpeterso@redhat.com>
In-Reply-To: <20200821173337.20377-1-rpeterso@redhat.com>
References: <20200821173337.20377-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 08/12] gfs2: don't lock sd_ail_lock in
	gfs2_releasepage
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Patch 380f7c65a7eb3288e4b6812acf3474a1de230707 changed gfs2_releasepage
so that it held the sd_ail_lock spin_lock for most of its processing.
It did this for some mysterious undocumented bug somewhere in the
evict code path. But in the nine years since, evict has been reworked
and fixed many times, and so have the transactions and ail list.
I can't see a reason to hold the sd_ail_lock unless it's protecting
the actual ail lists hung off the transactions. Therefore, this patch
removes the locking to increase speed and efficiency, and to further help
us rework the log flush code to be more concurrent with transactions.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/aops.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index f6e36a33b392..5c1914c8968f 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -744,7 +744,6 @@ int gfs2_releasepage(struct page *page, gfp_t gfp_mask)
 	 */
 
 	gfs2_log_lock(sdp);
-	spin_lock(&sdp->sd_ail_lock);
 	head = bh = page_buffers(page);
 	do {
 		if (atomic_read(&bh->b_count))
@@ -756,7 +755,6 @@ int gfs2_releasepage(struct page *page, gfp_t gfp_mask)
 			goto cannot_release;
 		bh = bh->b_this_page;
 	} while(bh != head);
-	spin_unlock(&sdp->sd_ail_lock);
 
 	head = bh = page_buffers(page);
 	do {
@@ -782,7 +780,6 @@ int gfs2_releasepage(struct page *page, gfp_t gfp_mask)
 	return try_to_free_buffers(page);
 
 cannot_release:
-	spin_unlock(&sdp->sd_ail_lock);
 	gfs2_log_unlock(sdp);
 	return 0;
 }
-- 
2.26.2

