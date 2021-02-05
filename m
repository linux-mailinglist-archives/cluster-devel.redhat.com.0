Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3A06A310E71
	for <lists+cluster-devel@lfdr.de>; Fri,  5 Feb 2021 18:17:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612545451;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ihSyqYfW0nGFsoTHzFvhp8JA++HG2ehzL7hWbqCwMZA=;
	b=ELdfT2bp+nLbWAwFX3xzdQqcbNV1gzl/bphOLcfue/JoODSYk4Uh66NXEG46DF2lZuqkMu
	1Skek9itXxIbHvp9KAZ5KPV+N8Cz3W5fJ3v5TleO5sR6v+qkhAfRzQ+LZaVia5Y9tGpYhL
	WcudRCSM+ddC11LCyAixV42pI5sjU5I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-gK54lQxMOTiuXsvi1-ZpiQ-1; Fri, 05 Feb 2021 12:17:29 -0500
X-MC-Unique: gK54lQxMOTiuXsvi1-ZpiQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06C8F180A0A3;
	Fri,  5 Feb 2021 17:17:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBB405D9D2;
	Fri,  5 Feb 2021 17:17:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20AA357DF9;
	Fri,  5 Feb 2021 17:17:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 115HHBbF001080 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Feb 2021 12:17:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1DD4929152; Fri,  5 Feb 2021 17:17:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-112-155.ams2.redhat.com [10.36.112.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0AAEA5D9D2;
	Fri,  5 Feb 2021 17:17:09 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri,  5 Feb 2021 18:17:08 +0100
Message-Id: <20210205171708.326048-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: stable@vger.kernel.org
Subject: [Cluster-devel] [PATCH] gfs2: Lock imbalance on error path in
	gfs2_recover_one
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

In gfs2_recover_one, fix a sd_log_flush_lock imbalance when a recovery
pass fails.

Fixes: c9ebc4b73799 ("gfs2: allow journal replay to hold sd_log_flush_lock")
Cc: stable@vger.kernel.org # v5.7+
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/recovery.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index a3eae2c76b70..f15f9b86e8a7 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -511,8 +511,10 @@ static void gfs2_recover_one(struct gfs2_jdesc *jd)
 			error = foreach_descriptor(jd, head.lh_tail,
 						   head.lh_blkno, pass);
 			lops_after_scan(jd, error, pass);
-			if (error)
+			if (error) {
+				up_read(&sdp->sd_log_flush_lock);
 				goto fail_gunlock_thaw;
+			}
 		}
 
 		recover_local_statfs(jd, &head);
-- 
2.26.2

