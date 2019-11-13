Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B21E8FBAD2
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Nov 2019 22:30:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573680655;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Uo17Xn6lxOp4aleYZrigKT6sZkAADFPbza7tDCg8Ovg=;
	b=b0lmstumhfCm8hRyXKbycWy7jG+RbvM7X8F+7QT9KSBZMK9BwTmwe5q8bF1igcK4T4mkVa
	k/o+LC1b/oc7RyrzxJlAp+8/+d8mYItrse0bCXTd7Kz9teg6YTK3x8flinjVAEqS32GpIV
	0lHBZouK58p9+jrNIBWvJTz19wc82Tg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-HUdeizb8M1SVlZCgz4pqHg-1; Wed, 13 Nov 2019 16:30:54 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D36F1107B791;
	Wed, 13 Nov 2019 21:30:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD8A85E254;
	Wed, 13 Nov 2019 21:30:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9F1E54BB78;
	Wed, 13 Nov 2019 21:30:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLUkRN005400 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:30:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F12016A509; Wed, 13 Nov 2019 21:30:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-140.phx2.redhat.com [10.3.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD1B26A505
	for <cluster-devel@redhat.com>; Wed, 13 Nov 2019 21:30:46 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 13 Nov 2019 15:30:20 -0600
Message-Id: <20191113213030.237431-23-rpeterso@redhat.com>
In-Reply-To: <20191113213030.237431-1-rpeterso@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 22/32] gfs2: Do log_flush in
	gfs2_ail_empty_gl even if ail list is empty
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
X-MC-Unique: HUdeizb8M1SVlZCgz4pqHg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Before this patch, if gfs2_ail_empty_gl saw there was nothing on
the ail list, it would return and not flush the log. The problem
is that there could still be a revoke for the rgrp sitting on the
sd_log_le_revoke list that's been recently taken off the ail list.
But that revoke still needs to be written, and the rgrp_go_inval
still needs to call log_flush_wait to ensure the revokes are all
properly written to the journal before we relinquish control of
the glock to another node. If we give the glock to another node
before we have this knowledge, the node might crash and its journal
replayed, in which case the missing revoke would allow the journal
replay to replay the rgrp over top of the rgrp we already gave to
another node, thus overwriting its changes and corrupting the
file system.

This patch makes gfs2_ail_empty_gl still call gfs2_log_flush rather
than returning.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glops.c | 26 +++++++++++++++++++++++++-
 fs/gfs2/log.c   |  2 +-
 fs/gfs2/log.h   |  1 +
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index e0219b0e2229..4072f37e4278 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -92,8 +92,31 @@ static void gfs2_ail_empty_gl(struct gfs2_glock *gl)
 =09set_bit(TR_ATTACHED, &tr.tr_flags); /* prevent gfs2_trans_end free */
 =09tr.tr_revokes =3D atomic_read(&gl->gl_ail_count);
=20
-=09if (!tr.tr_revokes)
+=09if (!tr.tr_revokes) {
+=09=09/*
+=09=09 * We have nothing on the ail, but there could be revokes on
+=09=09 * the sdp revoke queue, in which case, we still want to flush
+=09=09 * the log and wait for it to finish.
+=09=09 *
+=09=09 * If the sdp revoke list is empty too, we might still have an
+=09=09 * io outstanding for writing revokes, so we should wait for
+=09=09 * it before returning.
+=09=09 *
+=09=09 * If none of these conditions are true, our revokes are all
+=09=09 * flushed and we can return.
+=09=09 */
+=09=09gfs2_log_lock(sdp);
+=09=09if (!list_empty(&sdp->sd_log_le_revoke)) {
+=09=09=09gfs2_log_unlock(sdp);
+=09=09=09goto flush;
+=09=09} else if (atomic_read(&sdp->sd_log_in_flight)) {
+=09=09=09gfs2_log_unlock(sdp);
+=09=09=09log_flush_wait(sdp);
+=09=09} else {
+=09=09=09gfs2_log_unlock(sdp);
+=09=09}
 =09=09return;
+=09}
=20
 =09/* A shortened, inline version of gfs2_trans_begin()
          * tr->alloced is not set since the transaction structure is
@@ -108,6 +131,7 @@ static void gfs2_ail_empty_gl(struct gfs2_glock *gl)
 =09__gfs2_ail_flush(gl, 0, tr.tr_revokes);
=20
 =09gfs2_trans_end(sdp);
+flush:
 =09gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 =09=09       GFS2_LFC_AIL_EMPTY_GL);
 }
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 11aa65dae761..6b5bac203d6d 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -536,7 +536,7 @@ static void log_pull_tail(struct gfs2_sbd *sdp, unsigne=
d int new_tail)
 }
=20
=20
-static void log_flush_wait(struct gfs2_sbd *sdp)
+void log_flush_wait(struct gfs2_sbd *sdp)
 {
 =09DEFINE_WAIT(wait);
=20
diff --git a/fs/gfs2/log.h b/fs/gfs2/log.h
index 2315fca47a2b..c60f1432bb28 100644
--- a/fs/gfs2/log.h
+++ b/fs/gfs2/log.h
@@ -73,6 +73,7 @@ extern void gfs2_log_flush(struct gfs2_sbd *sdp, struct g=
fs2_glock *gl,
 =09=09=09   u32 type);
 extern void gfs2_log_commit(struct gfs2_sbd *sdp, struct gfs2_trans *trans=
);
 extern void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct writeback_control=
 *wbc);
+extern void log_flush_wait(struct gfs2_sbd *sdp);
=20
 extern void gfs2_log_shutdown(struct gfs2_sbd *sdp);
 extern int gfs2_logd(void *data);
--=20
2.23.0

