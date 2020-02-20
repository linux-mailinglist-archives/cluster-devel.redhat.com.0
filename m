Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 67811166797
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Feb 2020 20:53:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582228433;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=atOv450KRQT+9WXmWXOXfPqH1wTNI0/IWMCd5MGLJAk=;
	b=fk+kIFku+FOlSyP/fpe6CBChdG5T0TFlJAqx7l44axYENbTkAICuuegD5tCRq/q4vvHFML
	X5fHSBgkkOOuB5zpbQKPx185mQvWvXrXO722ZYr/AzbwpzBhMGirgLassGRVwyLx3cxLcj
	uR161HKhr9Oi3Mct7oII0mGGwYXmk98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-lxCKYsPnMMCsXv7T_GRcug-1; Thu, 20 Feb 2020 14:53:51 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 916FE100DFC0;
	Thu, 20 Feb 2020 19:53:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79A3F90F73;
	Thu, 20 Feb 2020 19:53:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5437B18089CE;
	Thu, 20 Feb 2020 19:53:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KJrkn8009107 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 14:53:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7E60F90F79; Thu, 20 Feb 2020 19:53:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A8C4890F57
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 19:53:45 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 20 Feb 2020 13:53:06 -0600
Message-Id: <20200220195329.952027-6-rpeterso@redhat.com>
In-Reply-To: <20200220195329.952027-1-rpeterso@redhat.com>
References: <20200220195329.952027-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 05/28] gfs2: Return bool from
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: lxCKYsPnMMCsXv7T_GRcug-1
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
2.24.1

