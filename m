Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 23A0B197D4E
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Mar 2020 15:46:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585576010;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1iES/pjGX9op7YkbQK+OdtQ70UOVc0MiMJLmAjapdfM=;
	b=P2vB6X+tn+aJqId3dqgmzFJtYqv8U4zmHeufnp1TqDm7Ge9daCpYMonPHtdkP7OisuDT/4
	xAxlOUn1czC2n5YxSZHE+3O1HWZo4azj3B350aBdZY49BzI0nD6XoYv7nH1TVz3gT8cAT1
	ZpP3cSSiJCimpoTBprSQQFxIh+/HIuk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-rRydHwQjN5yzALn5B_v3zw-1; Mon, 30 Mar 2020 09:46:47 -0400
X-MC-Unique: rRydHwQjN5yzALn5B_v3zw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87CB18018AD;
	Mon, 30 Mar 2020 13:46:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74F041001B07;
	Mon, 30 Mar 2020 13:46:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5E0B0944DA;
	Mon, 30 Mar 2020 13:46:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UDkUpV020179 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 09:46:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8612C48; Mon, 30 Mar 2020 13:46:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4AD785C1A8
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 13:46:30 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 30 Mar 2020 08:45:50 -0500
Message-Id: <20200330134624.259349-6-rpeterso@redhat.com>
In-Reply-To: <20200330134624.259349-1-rpeterso@redhat.com>
References: <20200330134624.259349-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 05/39] gfs2: Return bool from
	gfs2_assert functions
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: Andreas Gruenbacher <agruenba@redhat.com>

The gfs2_assert functions only print messages when the filesystem hasn't be=
en
withdrawn yet, and they indicate whether or not they've printed something i=
n
their return value.  However, none of the callers use that information, so
simply return whether or not the assert has failed.

(The gfs2_assert functions are still backwards; they return false when an
assertion is true.)

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/util.c | 21 ++++++---------------
 fs/gfs2/util.h | 28 ++++++++++++++++++----------
 2 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 698eb5952438..ec8e8c5ce848 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -84,37 +84,30 @@ int gfs2_withdraw(struct gfs2_sbd *sdp)
=20
 /**
  * gfs2_assert_withdraw_i - Cause the machine to withdraw if @assertion is=
 false
- * Returns: -1 if this call withdrew the machine,
- *          -2 if it was already withdrawn
  */
=20
-int gfs2_assert_withdraw_i(struct gfs2_sbd *sdp, char *assertion,
-=09=09=09   const char *function, char *file, unsigned int line)
+void gfs2_assert_withdraw_i(struct gfs2_sbd *sdp, char *assertion,
+=09=09=09    const char *function, char *file, unsigned int line)
 {
-=09int me;
-
 =09gfs2_lm(sdp,
 =09=09"fatal: assertion \"%s\" failed\n"
 =09=09"   function =3D %s, file =3D %s, line =3D %u\n",
 =09=09assertion, function, file, line);
-=09me =3D gfs2_withdraw(sdp);
+=09gfs2_withdraw(sdp);
 =09dump_stack();
-=09return (me) ? -1 : -2;
 }
=20
 /**
  * gfs2_assert_warn_i - Print a message to the console if @assertion is fa=
lse
- * Returns: -1 if we printed something
- *          -2 if we didn't
  */
=20
-int gfs2_assert_warn_i(struct gfs2_sbd *sdp, char *assertion,
-=09=09       const char *function, char *file, unsigned int line)
+void gfs2_assert_warn_i(struct gfs2_sbd *sdp, char *assertion,
+=09=09=09const char *function, char *file, unsigned int line)
 {
 =09if (time_before(jiffies,
 =09=09=09sdp->sd_last_warning +
 =09=09=09gfs2_tune_get(sdp, gt_complain_secs) * HZ))
-=09=09return -2;
+=09=09return;
=20
 =09if (sdp->sd_args.ar_errors =3D=3D GFS2_ERRORS_WITHDRAW)
 =09=09fs_warn(sdp, "warning: assertion \"%s\" failed at function =3D %s, f=
ile =3D %s, line =3D %u\n",
@@ -132,8 +125,6 @@ int gfs2_assert_warn_i(struct gfs2_sbd *sdp, char *asse=
rtion,
 =09=09      sdp->sd_fsname, function, file, line);
=20
 =09sdp->sd_last_warning =3D jiffies;
-
-=09return -1;
 }
=20
 /**
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index 93e089327216..572399e75ce6 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -36,21 +36,29 @@ do { \
 } while (0)
=20
=20
-int gfs2_assert_withdraw_i(struct gfs2_sbd *sdp, char *assertion,
-=09=09=09   const char *function, char *file, unsigned int line);
+void gfs2_assert_withdraw_i(struct gfs2_sbd *sdp, char *assertion,
+=09=09=09    const char *function, char *file, unsigned int line);
=20
 #define gfs2_assert_withdraw(sdp, assertion) \
-((likely(assertion)) ? 0 : gfs2_assert_withdraw_i((sdp), #assertion, \
-=09=09=09=09=09__func__, __FILE__, __LINE__))
+=09({ \
+=09=09bool _bool =3D (assertion); \
+=09=09if (unlikely(!_bool)) \
+=09=09=09gfs2_assert_withdraw_i((sdp), #assertion, \
+=09=09=09=09=09__func__, __FILE__, __LINE__); \
+=09=09!_bool; \
+=09})
=20
-
-int gfs2_assert_warn_i(struct gfs2_sbd *sdp, char *assertion,
-=09=09       const char *function, char *file, unsigned int line);
+void gfs2_assert_warn_i(struct gfs2_sbd *sdp, char *assertion,
+=09=09=09const char *function, char *file, unsigned int line);
=20
 #define gfs2_assert_warn(sdp, assertion) \
-((likely(assertion)) ? 0 : gfs2_assert_warn_i((sdp), #assertion, \
-=09=09=09=09=09__func__, __FILE__, __LINE__))
-
+=09({ \
+=09=09bool _bool =3D (assertion); \
+=09=09if (unlikely(!_bool)) \
+=09=09=09gfs2_assert_warn_i((sdp), #assertion, \
+=09=09=09=09=09__func__, __FILE__, __LINE__); \
+=09=09!_bool; \
+=09})
=20
 void gfs2_consist_i(struct gfs2_sbd *sdp,
 =09=09    const char *function, char *file, unsigned int line);
--=20
2.25.1

