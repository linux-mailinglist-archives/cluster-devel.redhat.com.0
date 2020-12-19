Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 54AE22DF19B
	for <lists+cluster-devel@lfdr.de>; Sat, 19 Dec 2020 21:49:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608410951;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=upgWLLVjyTWB85uXtpOd+es6BFOLRatFQiVHYrwCzlM=;
	b=KiOFCJgJ0PPO2rV/ddeOiyUnsWSId2/cu5STWyy/wPXdYSQ6QlhJhSmJ8W9Lp5I19lgkTn
	C0rCDwbntNfH8RajeelU7kFdYCjjyiEnWlVhUczInVISbmnC2yOxLx7ZXDfxBI5pcVJGgc
	4qOubhhSO9880qNB1ze62/dVXrdBUnI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-BWW7kf-SPWuquWQVg332sg-1; Sat, 19 Dec 2020 15:49:09 -0500
X-MC-Unique: BWW7kf-SPWuquWQVg332sg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2272801AAA;
	Sat, 19 Dec 2020 20:49:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D21065C1C2;
	Sat, 19 Dec 2020 20:49:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BF495002D;
	Sat, 19 Dec 2020 20:49:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BJKmw1m020086 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 19 Dec 2020 15:48:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CB2F939A4E; Sat, 19 Dec 2020 20:48:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (ovpn-115-196.ams2.redhat.com [10.36.115.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 99AB42DAD0;
	Sat, 19 Dec 2020 20:48:57 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Sat, 19 Dec 2020 21:48:29 +0100
Message-Id: <20201219204848.285781-2-agruenba@redhat.com>
In-Reply-To: <20201219204848.285781-1-agruenba@redhat.com>
References: <20201219204848.285781-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v2 01/20] gfs2: Deobfuscate function
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

