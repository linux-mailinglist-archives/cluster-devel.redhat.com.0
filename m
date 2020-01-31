Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8162514F1EF
	for <lists+cluster-devel@lfdr.de>; Fri, 31 Jan 2020 19:08:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580494111;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BS5qoNNdA7e/WtCk8EgcsOmbVjA168tAz2p0ajo9MrQ=;
	b=GSs04saIhT6/9cM32KIpQPyJa2auGOtIpTKLgIdYko9Ljuo84Df5h/743zawk9ChHKMSqv
	AsUMEdUvGAtSGYGvFt1DWHawAMfH7k4iOLdOU+ClXPsN2AH/2GyFQPCYMvVqH2CWDSy/Nt
	wiToZMKfYonbSl0K2/AzClxJYJWXEQU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-awt3TO3iMfSdR3Mr1misjQ-1; Fri, 31 Jan 2020 13:08:29 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C3D8802CAD;
	Fri, 31 Jan 2020 18:08:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B294100EBA8;
	Fri, 31 Jan 2020 18:08:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1028685CE0;
	Fri, 31 Jan 2020 18:08:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00VI8PWK027109 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 31 Jan 2020 13:08:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2550B60BE1; Fri, 31 Jan 2020 18:08:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E05A660BE0
	for <cluster-devel@redhat.com>; Fri, 31 Jan 2020 18:08:21 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 31 Jan 2020 12:07:23 -0600
Message-Id: <20200131180723.178863-26-rpeterso@redhat.com>
In-Reply-To: <20200131180723.178863-1-rpeterso@redhat.com>
References: <20200131180723.178863-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 25/25] gfs2: flesh out delayed withdraw
	for gfs2_log_flush
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
X-MC-Unique: awt3TO3iMfSdR3Mr1misjQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Function gfs2_log_flush() had a few places where it tried to withdraw
from the file system when errors were encountered. The problem is,
it should delay those withdraws until the log flush lock is no longer
held.

This patch creates a new function just for delayed withdraws for
situations like this. If errors=3Dpanic was specified on mount, we
still want to do it the old fashioned way because the panic it does
not help to delay in that situation.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/log.c  | 12 ++++++++----
 fs/gfs2/util.c | 27 +++++++++++++++++++++------
 fs/gfs2/util.h | 14 ++++++++++++--
 3 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 010c319caade..67465a34954e 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -872,13 +872,17 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2=
_glock *gl, u32 flags)
 =09=09INIT_LIST_HEAD(&tr->tr_ail2_list);
 =09=09tr->tr_first =3D sdp->sd_log_flush_head;
 =09=09if (unlikely (state =3D=3D SFS_FROZEN))
-=09=09=09gfs2_assert_withdraw(sdp, !tr->tr_num_buf_new && !tr->tr_num_data=
buf_new);
+=09=09=09if (gfs2_assert_withdraw_delayed(sdp,
+=09=09=09       !tr->tr_num_buf_new && !tr->tr_num_databuf_new))
+=09=09=09=09goto out;
 =09}
=20
 =09if (unlikely(state =3D=3D SFS_FROZEN))
-=09=09gfs2_assert_withdraw(sdp, !sdp->sd_log_num_revoke);
-=09gfs2_assert_withdraw(sdp,
-=09=09=09sdp->sd_log_num_revoke =3D=3D sdp->sd_log_committed_revoke);
+=09=09if (gfs2_assert_withdraw_delayed(sdp, !sdp->sd_log_num_revoke))
+=09=09=09goto out;
+=09if (gfs2_assert_withdraw_delayed(sdp,
+=09=09=09sdp->sd_log_num_revoke =3D=3D sdp->sd_log_committed_revoke))
+=09=09goto out;
=20
 =09gfs2_ordered_write(sdp);
 =09if (gfs2_withdrawn(sdp))
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 37a89916c755..0250f32445c2 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -295,13 +295,28 @@ int gfs2_withdraw(struct gfs2_sbd *sdp)
  */
=20
 void gfs2_assert_withdraw_i(struct gfs2_sbd *sdp, char *assertion,
-=09=09=09    const char *function, char *file, unsigned int line)
+=09=09=09    const char *function, char *file, unsigned int line,
+=09=09=09    bool delayed)
 {
-=09gfs2_lm(sdp,
-=09=09"fatal: assertion \"%s\" failed\n"
-=09=09"   function =3D %s, file =3D %s, line =3D %u\n",
-=09=09assertion, function, file, line);
-=09gfs2_withdraw(sdp);
+=09if (gfs2_withdrawn(sdp))
+=09=09return;
+
+=09fs_err(sdp,
+=09       "fatal: assertion \"%s\" failed\n"
+=09       "   function =3D %s, file =3D %s, line =3D %u\n",
+=09       assertion, function, file, line);
+
+=09/*
+=09 * If errors=3Dpanic was specified on mount, it won't help to delay the
+=09 * withdraw.
+=09 */
+=09if (sdp->sd_args.ar_errors =3D=3D GFS2_ERRORS_PANIC)
+=09=09delayed =3D false;
+
+=09if (delayed)
+=09=09gfs2_withdraw_delayed(sdp);
+=09else
+=09=09gfs2_withdraw(sdp);
 =09dump_stack();
 }
=20
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index 97117a766bde..a3542560da6f 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -37,14 +37,24 @@ do { \
=20
=20
 void gfs2_assert_withdraw_i(struct gfs2_sbd *sdp, char *assertion,
-=09=09=09    const char *function, char *file, unsigned int line);
+=09=09=09    const char *function, char *file, unsigned int line,
+=09=09=09    bool delayed);
=20
 #define gfs2_assert_withdraw(sdp, assertion) \
 =09({ \
 =09=09bool _bool =3D (assertion); \
 =09=09if (unlikely(!_bool)) \
 =09=09=09gfs2_assert_withdraw_i((sdp), #assertion, \
-=09=09=09=09=09__func__, __FILE__, __LINE__); \
+=09=09=09=09=09__func__, __FILE__, __LINE__, false); \
+=09=09!_bool; \
+=09})
+
+#define gfs2_assert_withdraw_delayed(sdp, assertion) \
+=09({ \
+=09=09bool _bool =3D (assertion); \
+=09=09if (unlikely(!_bool)) \
+=09=09=09gfs2_assert_withdraw_i((sdp), #assertion, \
+=09=09=09=09=09__func__, __FILE__, __LINE__, true); \
 =09=09!_bool; \
 =09})
=20
--=20
2.24.1

