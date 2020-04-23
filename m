Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B9A951B648E
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Apr 2020 21:35:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587670535;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=d4/BffosqjmtKcWLZqNOwaAVvpdeXI2JrmFpJn7PwX8=;
	b=f+xUtzgr1NtdfktRcPrO6QgN8EbfGdJby8pfoOzkUoXCoObOUuZubfvxXr5a/M3dVKaezY
	jeI13hV6dkHAntiYlVfgBMs2lpIYJt6FZjEb/EMXGgPt7+W9khIY4iefB09VvOCHHn69mh
	SBPxpztfioUPGWwXyzmlxgqUYBqZ3N4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-NAAGEbPFNTCdYSCpyXkRTw-1; Thu, 23 Apr 2020 15:35:33 -0400
X-MC-Unique: NAAGEbPFNTCdYSCpyXkRTw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1446180B711;
	Thu, 23 Apr 2020 19:35:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE7A05C1D0;
	Thu, 23 Apr 2020 19:35:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 93A571809543;
	Thu, 23 Apr 2020 19:35:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03NJZMdK031450 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 Apr 2020 15:35:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 40A2A1001DC2; Thu, 23 Apr 2020 19:35:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A45A10016DA
	for <cluster-devel@redhat.com>; Thu, 23 Apr 2020 19:35:19 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A3D494CA95
	for <cluster-devel@redhat.com>; Thu, 23 Apr 2020 19:35:19 +0000 (UTC)
Date: Thu, 23 Apr 2020 15:35:19 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <799785403.24440483.1587670519606.JavaMail.zimbra@redhat.com>
In-Reply-To: <2023765258.24440482.1587670514858.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.238, 10.4.195.14]
Thread-Topic: gfs2: Fix error exit in do_xmote
Thread-Index: 2YkgtWG6KgF+tke1u+x/DVexgMEFCA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: Fix error exit in do_xmote
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

Before this patch , if an error was detected from glock function go_sync by
function do_xmote, it would return. But the function had temporarily
unlocked the gl_lockref spin_lock, and it never re-locked it.
When the caller of do_xmote tried to unlock it again, it was already
unlocked, which resulted in a corrupted spin_lock value.

This patch changes the "return" to "goto out" so the spin_lock gets
proper re-locked upon exit.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 29f9b6684b74..a1c5f245553f 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -613,7 +613,7 @@ __acquires(&gl->gl_lockref.lock)
 				fs_err(sdp, "Error %d syncing glock \n", ret);
 				gfs2_dump_glock(NULL, gl, true);
 			}
-			return;
+			goto out;
 		}
 	}
 	if (test_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags)) {

