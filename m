Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 00FE4FBAD8
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Nov 2019 22:31:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573680668;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QQEq//C5pivLamYg8aK0XanB+KJjpmIkuC4QDec3rZM=;
	b=dRJOoyItlaKCUenUc5YiiUDZBeiKhtRqUinY71jp/WIyTXU6Orss7e4i7wGidDJ+3ObmHl
	8MZ2vyo0B2gkyfpyhdBRU99PCyXMjsDzVRobgbXwhNGVDoyJtIRm/WQjC6fTAfmoAMaYku
	gYiz6iZ/vtWvqo2anQn3C8XDJiEu7ww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-KFL0q1IgNACtD0H6Ne6HMQ-1; Wed, 13 Nov 2019 16:31:05 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE8208C75E4;
	Wed, 13 Nov 2019 21:31:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABA9F1059FD5;
	Wed, 13 Nov 2019 21:31:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90A9D4BB65;
	Wed, 13 Nov 2019 21:31:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLV0hi005463 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:31:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9A87169739; Wed, 13 Nov 2019 21:31:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-140.phx2.redhat.com [10.3.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 63C1B69320
	for <cluster-devel@redhat.com>; Wed, 13 Nov 2019 21:30:55 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 13 Nov 2019 15:30:25 -0600
Message-Id: <20191113213030.237431-28-rpeterso@redhat.com>
In-Reply-To: <20191113213030.237431-1-rpeterso@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 27/32] gfs2: make gfs2_log_shutdown static
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: KFL0q1IgNACtD0H6Ne6HMQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Function gfs2_log_shutdown is only called from within log.c. This
patch removes the extern declaration and makes it static.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 4 +++-
 fs/gfs2/log.h | 1 -
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index c4c832f6b6a3..49ed80e4bd0f 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -32,6 +32,8 @@
 #include "trace_gfs2.h"
 #include "trans.h"
=20
+static void gfs2_log_shutdown(struct gfs2_sbd *sdp);
+
 /**
  * gfs2_struct2blk - compute stuff
  * @sdp: the filesystem
@@ -1034,7 +1036,7 @@ void gfs2_log_commit(struct gfs2_sbd *sdp, struct gfs=
2_trans *tr)
  *
  */
=20
-void gfs2_log_shutdown(struct gfs2_sbd *sdp)
+static void gfs2_log_shutdown(struct gfs2_sbd *sdp)
 {
 =09gfs2_assert_withdraw(sdp, !sdp->sd_log_blks_reserved);
 =09gfs2_assert_withdraw(sdp, !sdp->sd_log_num_revoke);
diff --git a/fs/gfs2/log.h b/fs/gfs2/log.h
index c60f1432bb28..b661d0747047 100644
--- a/fs/gfs2/log.h
+++ b/fs/gfs2/log.h
@@ -75,7 +75,6 @@ extern void gfs2_log_commit(struct gfs2_sbd *sdp, struct =
gfs2_trans *trans);
 extern void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct writeback_control=
 *wbc);
 extern void log_flush_wait(struct gfs2_sbd *sdp);
=20
-extern void gfs2_log_shutdown(struct gfs2_sbd *sdp);
 extern int gfs2_logd(void *data);
 extern void gfs2_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd)=
;
 extern void gfs2_write_revokes(struct gfs2_sbd *sdp);
--=20
2.23.0

