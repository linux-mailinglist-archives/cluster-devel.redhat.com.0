Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6AD1CDD70
	for <lists+cluster-devel@lfdr.de>; Mon, 11 May 2020 16:41:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589208107;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tLPFH/NzA5lHIrtpMPqkNsMoTTiPAeKl5RIHe/FfvoM=;
	b=G4ygvwF4TTjLd0HC+n8DBDNOkcvQo7n0i19DVjSpbgpvh8mJxulipy+OlAEiPGN7n9150E
	ILlYrxzitkMdttD9smEsyrOBDsAJSZIBlhYVJMz0kBNqpqC+YNMU5B/tjdfbCqkScxgkia
	HOZMTZ5T9P7rwQlQ0kv9dZDa0OPA2OI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-2WKZddZqPF2sex9_RYOnxA-1; Mon, 11 May 2020 10:41:45 -0400
X-MC-Unique: 2WKZddZqPF2sex9_RYOnxA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 951A71054F9A;
	Mon, 11 May 2020 14:41:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86E3875274;
	Mon, 11 May 2020 14:41:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 71864180954D;
	Mon, 11 May 2020 14:41:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BEffOW005627 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 10:41:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5EE9260CD1; Mon, 11 May 2020 14:41:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.212])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EC1660BF4
	for <cluster-devel@redhat.com>; Mon, 11 May 2020 14:41:40 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 11 May 2020 15:41:25 +0100
Message-Id: <20200511144125.350891-6-anprice@redhat.com>
In-Reply-To: <20200511144125.350891-1-anprice@redhat.com>
References: <20200511144125.350891-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 5/5] savemeta: Use larger buffers for gzip
	compression
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Increase the buffer size that zlib will use for (de)compression. This
results in a measurable speed-up of the save/restoremeta part of the
testsuite.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 7dc506a2..3bd35843 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -121,6 +121,7 @@ static int restore_try_gzip(struct metafd *mfd)
 	mfd->gzfd = gzdopen(mfd->fd, "rb");
 	if (!mfd->gzfd)
 		return 1;
+	gzbuffer(mfd->gzfd, (1<<20)); /* Increase zlib's buffers to 1MB */
 	restore_left = mfd->read(mfd, restore_buf, RESTORE_BUF_SIZE);
 	if (restore_left < 512)
 		return -1;
@@ -475,6 +476,7 @@ static struct metafd savemetaopen(char *out_fn, int gziplevel)
 			fprintf(stderr, "gzdopen error: %s\n", strerror(errno));
 			exit(1);
 		}
+		gzbuffer(mfd.gzfd, (1<<20)); /* Increase zlib's buffers to 1MB */
 	}
 
 	return mfd;
-- 
2.26.2

