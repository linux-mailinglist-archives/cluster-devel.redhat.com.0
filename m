Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C3568FC92B
	for <lists+cluster-devel@lfdr.de>; Thu, 14 Nov 2019 15:48:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573742921;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=nzdW/g1XN4ps9pV8bKbn7laLHHsPJU8dGBompFcNR2o=;
	b=U9/HtTBcQOpqkZeR3nDjIZ5CLmpW676QcnZlU1YW6+rlP3ipEfjPnwHYJp8sCK7OMk7R68
	kc/hdDSbH5PIwcxY5dSwrptwvX+7bHUI8iFUyzp1D4ROx0d1lK6ibArcgW14era8Y04Jyv
	IzuYvPwyU7GJjP9cb53VeOut/BkEt/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-CdvuCE7dOGuTDs_EBXsfkg-1; Thu, 14 Nov 2019 09:48:40 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B368107ACC7;
	Thu, 14 Nov 2019 14:48:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAF9B5F769;
	Thu, 14 Nov 2019 14:48:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B8E7818089CD;
	Thu, 14 Nov 2019 14:48:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAEEmTpM023089 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 Nov 2019 09:48:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7F6573DB2; Thu, 14 Nov 2019 14:48:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AA4A472E7
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 14:48:27 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F30C118089C8
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 14:48:26 +0000 (UTC)
Date: Thu, 14 Nov 2019 09:48:26 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1576076797.29709674.1573742906961.JavaMail.zimbra@redhat.com>
In-Reply-To: <102655333.29709633.1573742889712.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.140, 10.4.195.5]
Thread-Topic: gfs2: make gfs2_log_shutdown static
Thread-Index: WtfznLeUCjtFlbWgxfCw3w7B3XXzjQ==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: make gfs2_log_shutdown static
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: CdvuCE7dOGuTDs_EBXsfkg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Function gfs2_log_shutdown is only called from within log.c. This
patch removes the extern declaration and makes it static.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 4 +++-
 fs/gfs2/log.h | 1 -
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 162246fafc2e..4a7713c62f04 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -31,6 +31,8 @@
 #include "dir.h"
 #include "trace_gfs2.h"
=20
+static void gfs2_log_shutdown(struct gfs2_sbd *sdp);
+
 /**
  * gfs2_struct2blk - compute stuff
  * @sdp: the filesystem
@@ -949,7 +951,7 @@ void gfs2_log_commit(struct gfs2_sbd *sdp, struct gfs2_=
trans *tr)
  *
  */
=20
-void gfs2_log_shutdown(struct gfs2_sbd *sdp)
+static void gfs2_log_shutdown(struct gfs2_sbd *sdp)
 {
 =09gfs2_assert_withdraw(sdp, !sdp->sd_log_blks_reserved);
 =09gfs2_assert_withdraw(sdp, !sdp->sd_log_num_revoke);
diff --git a/fs/gfs2/log.h b/fs/gfs2/log.h
index 2315fca47a2b..2421181dbfb9 100644
--- a/fs/gfs2/log.h
+++ b/fs/gfs2/log.h
@@ -74,7 +74,6 @@ extern void gfs2_log_flush(struct gfs2_sbd *sdp, struct g=
fs2_glock *gl,
 extern void gfs2_log_commit(struct gfs2_sbd *sdp, struct gfs2_trans *trans=
);
 extern void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct writeback_control=
 *wbc);
=20
-extern void gfs2_log_shutdown(struct gfs2_sbd *sdp);
 extern int gfs2_logd(void *data);
 extern void gfs2_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd)=
;
 extern void gfs2_write_revokes(struct gfs2_sbd *sdp);

