Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1971B1667AD
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Feb 2020 20:54:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582228467;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vvXNbkR+HpFS2s9OQQjCAp+E9HhCx+4ORcwcvzL3+mY=;
	b=HCnA3QpzwTjvFzwge2XQIhFTA622rwbzIGi1h2CQt0A71kr+ZfoUWS3ZHphU1RvLuRKbMl
	nLZ3rbRHqsFMR43tzCrjkTzJzQbvYL5vdHVm8TbZrPudhUfckbY7vnpxBIXju7vrKJ0r9M
	ivkWd9AuYkQ0HuK4V+pnWZ2spXUeXGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-lA96uaSlNwaEsiLdQuil6w-1; Thu, 20 Feb 2020 14:54:26 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6945184B120;
	Thu, 20 Feb 2020 19:54:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D32495C1B0;
	Thu, 20 Feb 2020 19:54:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B91C58B2C8;
	Thu, 20 Feb 2020 19:54:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KJsLrf009320 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 14:54:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A3FA590F57; Thu, 20 Feb 2020 19:54:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C1F490F73
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 19:54:20 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 20 Feb 2020 13:53:21 -0600
Message-Id: <20200220195329.952027-21-rpeterso@redhat.com>
In-Reply-To: <20200220195329.952027-1-rpeterso@redhat.com>
References: <20200220195329.952027-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 20/28] gfs2: Do log_flush in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: lA96uaSlNwaEsiLdQuil6w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glops.c | 27 ++++++++++++++++++++++++++-
 fs/gfs2/log.c   |  2 +-
 fs/gfs2/log.h   |  1 +
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index b58924482d9a..bbbcae8d853c 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -92,8 +92,32 @@ static void gfs2_ail_empty_gl(struct gfs2_glock *gl)
 =09INIT_LIST_HEAD(&tr.tr_databuf);
 =09tr.tr_revokes =3D atomic_read(&gl->gl_ail_count);
=20
-=09if (!tr.tr_revokes)
+=09if (!tr.tr_revokes) {
+=09=09bool have_revokes;
+=09=09bool log_in_flight;
+
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
+=09=09have_revokes =3D !list_empty(&sdp->sd_log_revokes);
+=09=09log_in_flight =3D atomic_read(&sdp->sd_log_in_flight);
+=09=09gfs2_log_unlock(sdp);
+=09=09if (have_revokes)
+=09=09=09goto flush;
+=09=09if (log_in_flight)
+=09=09=09log_flush_wait(sdp);
 =09=09return;
+=09}
=20
 =09/* A shortened, inline version of gfs2_trans_begin()
          * tr->alloced is not set since the transaction structure is
@@ -108,6 +132,7 @@ static void gfs2_ail_empty_gl(struct gfs2_glock *gl)
 =09__gfs2_ail_flush(gl, 0, tr.tr_revokes);
=20
 =09gfs2_trans_end(sdp);
+flush:
 =09gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 =09=09       GFS2_LFC_AIL_EMPTY_GL);
 }
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 578c1e0cd415..c37f81470792 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -537,7 +537,7 @@ static void log_pull_tail(struct gfs2_sbd *sdp, unsigne=
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
index c0a65e5a126b..c1cd6ae17659 100644
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
 extern int gfs2_logd(void *data);
 extern void gfs2_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd)=
;
--=20
2.24.1

