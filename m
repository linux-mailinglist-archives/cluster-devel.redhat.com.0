Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2E22C3DBE15
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Jul 2021 20:07:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627668459;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bC8Y/F1QLQScTv+u+sAoqDVu8v8l/XKrMCkacQ6AEbw=;
	b=ShFRlbM28Ctk8DJH0PuxGcQZDOGU8V1CAEtqnrSQY7RkAW9mLkR3mc5TqVvBdDSW1eUIz6
	rQ8KzdwKKg/hi0woluHImTo4OE6XC2ZTJUgx3OShXYbqpk9OfRDiSrPKhKVGdCNpkgDV8Q
	+c6p+LYbQZ42NtgzLMCse1mt4UwnDOw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-cp2Jok6jNGajnbZrsT_jpQ-1; Fri, 30 Jul 2021 14:07:37 -0400
X-MC-Unique: cp2Jok6jNGajnbZrsT_jpQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D9BC802C99;
	Fri, 30 Jul 2021 18:07:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B1765D6A1;
	Fri, 30 Jul 2021 18:07:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A3F834BB7C;
	Fri, 30 Jul 2021 18:07:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16UI1OIv020754 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Jul 2021 14:01:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 999715D9DD; Fri, 30 Jul 2021 18:01:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-104.phx2.redhat.com [10.3.112.104])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6ACD35D9CA
	for <cluster-devel@redhat.com>; Fri, 30 Jul 2021 18:01:21 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 30 Jul 2021 13:01:20 -0500
Message-Id: <20210730180120.427234-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Eliminate vestigial HIF_FIRST
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Holder flag HIF_FIRST is no longer used or needed, so remove it.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c  | 2 --
 fs/gfs2/incore.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 9f94d6b13363..f0b846ba5cc8 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -2067,8 +2067,6 @@ static const char *hflags2str(char *buf, u16 flags, unsigned long iflags)
 		*p++ = 'H';
 	if (test_bit(HIF_WAIT, &iflags))
 		*p++ = 'W';
-	if (test_bit(HIF_FIRST, &iflags))
-		*p++ = 'F';
 	*p = 0;
 	return buf;
 }
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 6f31a067a5f2..04ac1537fee7 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -252,7 +252,6 @@ struct gfs2_lkstats {
 enum {
 	/* States */
 	HIF_HOLDER		= 6,  /* Set for gh that "holds" the glock */
-	HIF_FIRST		= 7,
 	HIF_WAIT		= 10,
 };
 
-- 
2.31.1

