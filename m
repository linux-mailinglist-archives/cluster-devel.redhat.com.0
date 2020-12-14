Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB862D945D
	for <lists+cluster-devel@lfdr.de>; Mon, 14 Dec 2020 09:55:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607936102;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=upgWLLVjyTWB85uXtpOd+es6BFOLRatFQiVHYrwCzlM=;
	b=cTShNdSXEYY/1paUhUclxMWY2wG5RZLAbfdJH+VvVBOhJG1L8nXSndEKq+H6epxL/XgLKN
	rgrEBdG9MWrIFcM9zg88aB3C7sPNB2k1XZjqBvm1dK+PBO6JwqFMiE27vbr0tXP+kmEi9Z
	Tc30NDt6biRCVDuxN3hfECr9nlz1WP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-7IjwGWdBMAqVoAPTpvBp9g-1; Mon, 14 Dec 2020 03:55:00 -0500
X-MC-Unique: 7IjwGWdBMAqVoAPTpvBp9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA95F801AC0;
	Mon, 14 Dec 2020 08:54:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7083671CAA;
	Mon, 14 Dec 2020 08:54:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8700E180954D;
	Mon, 14 Dec 2020 08:54:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BE8sneG016377 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 14 Dec 2020 03:54:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6681062688; Mon, 14 Dec 2020 08:54:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.194])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9FD186267C;
	Mon, 14 Dec 2020 08:54:48 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 14 Dec 2020 09:54:31 +0100
Message-Id: <20201214085442.45467-2-agruenba@redhat.com>
In-Reply-To: <20201214085442.45467-1-agruenba@redhat.com>
References: <20201214085442.45467-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 01/12] gfs2: Deobfuscate function
	jdesc_find_i
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

Clean up this function to show that it is trivial.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/super.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index b3d951ab8068..08aef061b29d 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -81,19 +81,12 @@ void gfs2_jindex_free(struct gfs2_sbd *sdp)
 static struct gfs2_jdesc *jdesc_find_i(struct list_head *head, unsigned int jid)
 {
 	struct gfs2_jdesc *jd;
-	int found = 0;
 
 	list_for_each_entry(jd, head, jd_list) {
-		if (jd->jd_jid == jid) {
-			found = 1;
-			break;
-		}
+		if (jd->jd_jid == jid)
+			return jd;
 	}
-
-	if (!found)
-		jd = NULL;
-
-	return jd;
+	return NULL;
 }
 
 struct gfs2_jdesc *gfs2_jdesc_find(struct gfs2_sbd *sdp, unsigned int jid)
-- 
2.26.2

