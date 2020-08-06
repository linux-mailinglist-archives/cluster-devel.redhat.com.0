Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id F200323DAEA
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:39:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721141;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ze3wUev0wejv0Tw4pjxUU4tx1hy31cxZBD6zRYBwr9E=;
	b=iE1FlyMDd7rFXfEMijAgwlkjzURmAukFijrPg1GKt0x0/XegZkPk58SsBbGQX1/f7Omw7H
	i1DFFXzP3OSzp08sUGF+AWqoUlwZoRd9+JyivgSUXfW7pvxEQuKoQI8ZD/chbrIDmb6D05
	jiNZyJsmBacmFjI9WcrrLFuD+rMcaiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-jzEbfXu1PGGraJDMwRxhKQ-1; Thu, 06 Aug 2020 09:38:59 -0400
X-MC-Unique: jzEbfXu1PGGraJDMwRxhKQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02E6D1923764;
	Thu,  6 Aug 2020 13:38:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7B2C5DA6A;
	Thu,  6 Aug 2020 13:38:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D4CC196939;
	Thu,  6 Aug 2020 13:38:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076Dctce030999 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7ED6160C47; Thu,  6 Aug 2020 13:38:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D609E60BF1
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:54 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:38:02 +0100
Message-Id: <20200806133807.111280-28-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 27/32] savemeta: Don't trim off trailing
	zeroes when compressing
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

The code that trims the trailing zeroes from blocks before saving them
always features as one of the slow points in performance reports. When
we're compressing the file anyway, the compression algos should do this
much more efficiently than we can, so short circuit it when compression
is enabled.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 76477b79..55f64922 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -532,8 +532,10 @@ static int save_buf(struct metafd *mfd, const char *buf, uint64_t addr, unsigned
 	struct saved_metablock *savedata;
 	size_t outsz;
 
-	/* No need to save trailing zeroes */
-	for (; blklen > 0 && buf[blklen - 1] == '\0'; blklen--);
+	/* No need to save trailing zeroes, but leave that for compression to
+	   deal with when enabled as this adds a significant overhead */
+	if (mfd->gziplevel == 0)
+		for (; blklen > 0 && buf[blklen - 1] == '\0'; blklen--);
 
 	if (blklen == 0) /* No significant data; skip. */
 		return 0;
-- 
2.26.2

