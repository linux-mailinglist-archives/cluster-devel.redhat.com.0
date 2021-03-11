Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6847F337D8C
	for <lists+cluster-devel@lfdr.de>; Thu, 11 Mar 2021 20:21:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615490466;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IqL9EvHTGDK0ZXd9UMm1kWHXyU1NmhcglHcWvw5+hYk=;
	b=X7QtnCXcvEVVUDKbwUPknOg7dlRdE2GaMGZ+jxGTU28OSIcBSKIYxFH3xUVV6CykSSqb/f
	yfVLseOGY4n3BfkdUYcK+8wgFDVkES2SA67xrkGQGJY6gFi7Swo+Pnud6Zp7ybC4OUXglr
	x5h2r+5WsAb0wvDPKeO3z1B0ConJpFk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-LE7ikUAKOGKybc98dr93fQ-1; Thu, 11 Mar 2021 14:21:04 -0500
X-MC-Unique: LE7ikUAKOGKybc98dr93fQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F24CE640A9;
	Thu, 11 Mar 2021 19:21:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 361B65DAA5;
	Thu, 11 Mar 2021 19:21:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DEFB018155DE;
	Thu, 11 Mar 2021 19:20:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12BJKrJu001941 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 11 Mar 2021 14:20:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 17E9F2C159; Thu, 11 Mar 2021 19:20:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-117-91.rdu2.redhat.com [10.10.117.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AEC0F50A8A;
	Thu, 11 Mar 2021 19:20:52 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: anprice@redhat.com
Date: Thu, 11 Mar 2021 14:20:35 -0500
Message-Id: <20210311192036.17218-2-aahringo@redhat.com>
In-Reply-To: <20210311192036.17218-1-aahringo@redhat.com>
References: <20210311192036.17218-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH gfs2-utils 1/2] glocktop: use MAX_LINES for
	dlmwlines
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch uses MAX_LINES to handle 100 DLM waiters and above. There is
still a limitation but very unlikely to hit.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 gfs2/glocktop/glocktop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gfs2/glocktop/glocktop.c b/gfs2/glocktop/glocktop.c
index bd7fcf02..9df87d18 100644
--- a/gfs2/glocktop/glocktop.c
+++ b/gfs2/glocktop/glocktop.c
@@ -159,7 +159,7 @@ struct mount_point {
 	struct gfs2_sb sb;
 };
 struct mount_point *mounts;
-char dlmwlines[100][96]; /* waiters lines */
+char dlmwlines[MAX_LINES][96]; /* waiters lines */
 char dlmglines[MAX_LINES][97]; /* granted lines */
 char contended_filenames[MAX_FILES][PATH_MAX];
 unsigned long long contended_blocks[MAX_FILES];
-- 
2.26.2

