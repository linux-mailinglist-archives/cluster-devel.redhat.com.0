Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0CDCB1A3F2B
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Apr 2020 05:49:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586490594;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=a3o+TUUVdpVUctIf0ztN+tqOtOna18/hSmn4ONb4gak=;
	b=VAolhAqMU79HBIXRBxzw0h2ENCD0k2hWTjj1kL1q21scapRUr6muceRI5asWoaR+CxXXss
	MZ0Yt1qGni8YtDXyxbcH2EsDjwyiW+m7nzQhP/xYKNryOGiQ7jP03C3p3hr/t9cMa9zRP4
	nRw8M1HMErSKEaHzgtNxf1FavJwlIdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-Lnn7TKUXPw6kZEwWGzqwmg-1; Thu, 09 Apr 2020 23:49:52 -0400
X-MC-Unique: Lnn7TKUXPw6kZEwWGzqwmg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CF3A18C35A0;
	Fri, 10 Apr 2020 03:49:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 899BF60BFB;
	Fri, 10 Apr 2020 03:49:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 69F0E93085;
	Fri, 10 Apr 2020 03:49:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03A3nmOj016931 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 9 Apr 2020 23:49:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A8F3610500DF; Fri, 10 Apr 2020 03:49:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4EE01006B27
	for <cluster-devel@redhat.com>; Fri, 10 Apr 2020 03:49:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6B40101A55A
	for <cluster-devel@redhat.com>; Fri, 10 Apr 2020 03:49:46 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-344-j60CrwiLOne6uOblcbbDLQ-1;
	Thu, 09 Apr 2020 23:49:42 -0400
X-MC-Unique: j60CrwiLOne6uOblcbbDLQ-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 18F362137B;
	Fri, 10 Apr 2020 03:49:40 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Thu,  9 Apr 2020 23:48:49 -0400
Message-Id: <20200410034909.8922-26-sashal@kernel.org>
In-Reply-To: <20200410034909.8922-1-sashal@kernel.org>
References: <20200410034909.8922-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03A3nmOj016931
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.4 26/46] gfs2: Do log_flush in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: Bob Peterson <rpeterso@redhat.com>

[ Upstream commit 9ff78289356af640941bbb0dd3f46af2063f0046 ]

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
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/glops.c | 27 ++++++++++++++++++++++++++-
 fs/gfs2/log.c   |  2 +-
 fs/gfs2/log.h   |  1 +
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index ff213690e3648..83cf64da474cb 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -89,8 +89,32 @@ static void gfs2_ail_empty_gl(struct gfs2_glock *gl)
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
@@ -105,6 +129,7 @@ static void gfs2_ail_empty_gl(struct gfs2_glock *gl)
 =09__gfs2_ail_flush(gl, 0, tr.tr_revokes);
=20
 =09gfs2_trans_end(sdp);
+flush:
 =09gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 =09=09       GFS2_LFC_AIL_EMPTY_GL);
 }
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 2aed73666a657..47bc27d4169e6 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -513,7 +513,7 @@ static void log_pull_tail(struct gfs2_sbd *sdp, unsigne=
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
index c762da4945468..52b9bf27e918f 100644
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
2.20.1


