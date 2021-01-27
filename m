Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D3FE43065AD
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Jan 2021 22:11:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611781916;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fKERDgnrY0Z0A45gCzk6CfCr815JuS8wh2q3ps2foDY=;
	b=U1oZh1d7ke/EYhQD+sG0peD54MqPyNleoY2YeQ+m80V8EFhS8Q3fb9eN+SO6ty5BrJep17
	Izeha9rdfHhYyPpDzbSN0hnJIKmMPQB6v4eNZZdnLR19w358H4aImhMIYSDNSxBL7emPBt
	YoruVxDyLqCJmVmyatrP85A6yKYHhkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-SGHn9IfkOKeJFPeAH2kujw-1; Wed, 27 Jan 2021 16:11:52 -0500
X-MC-Unique: SGHn9IfkOKeJFPeAH2kujw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D13F5911E8;
	Wed, 27 Jan 2021 21:11:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD4F65D9C6;
	Wed, 27 Jan 2021 21:11:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 99EDC50036;
	Wed, 27 Jan 2021 21:11:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10RL7qPX013746 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 Jan 2021 16:07:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9C9B56F451; Wed, 27 Jan 2021 21:07:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D1A226F923;
	Wed, 27 Jan 2021 21:07:51 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 27 Jan 2021 22:07:27 +0100
Message-Id: <20210127210746.16958-2-agruenba@redhat.com>
In-Reply-To: <20210127210746.16958-1-agruenba@redhat.com>
References: <20210127210746.16958-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v3 01/20] gfs2: Un-obfuscate function
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
index 2f56acc41c04..ed7a829e9ffe 100644
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

