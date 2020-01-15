Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3CCC613BB7C
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jan 2020 09:50:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579078213;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L7mMMd65AsySWXIBhOhJm1auExZ0lUOpF/Ap7teFRK0=;
	b=jSKqbZ2edSHji/St3wBLe/cX+3LBToLpyNkkwI6s5FzLde6acLDqndNRHUDyHLwsIXikOR
	Boeopr0Jq9RjhiPIponEF4UN8+kl5K0nwEtC6tT9AHUDHzHy+LgnGGGfvQBOEfFffNhIH3
	m3ekikC6y3S213LcEyXpcclPmLN1O+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-8p75g-5WP2e1VY8qtCX8sg-1; Wed, 15 Jan 2020 03:50:08 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C27D7107ACCD;
	Wed, 15 Jan 2020 08:50:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05ED660BE0;
	Wed, 15 Jan 2020 08:50:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2335C18089CD;
	Wed, 15 Jan 2020 08:50:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00F8o2Fg018771 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 03:50:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0AB0E84322; Wed, 15 Jan 2020 08:50:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-63.brq.redhat.com [10.40.204.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B5BC8248B;
	Wed, 15 Jan 2020 08:49:58 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 15 Jan 2020 09:49:56 +0100
Message-Id: <20200115084956.7405-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] Move struct gfs2_rgrp_lvb out of
	gfs2_ondisk.h
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
X-MC-Unique: 8p75g-5WP2e1VY8qtCX8sg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

There's no point in sharing the internal structure of lock value blocks
with user space.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.h                  |  1 +
 fs/gfs2/incore.h                 |  1 +
 fs/gfs2/rgrp.c                   | 10 ++++++++++
 include/uapi/linux/gfs2_ondisk.h | 10 ----------
 4 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
index b8adaf80e4c5..d2f2dba05a94 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -306,4 +306,5 @@ static inline void glock_clear_object(struct gfs2_glock=
 *gl, void *object)
 =09spin_unlock(&gl->gl_lockref.lock);
 }
=20
+
 #endif /* __GLOCK_DOT_H__ */
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index b5d9c11f4901..5155389e9b5c 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -33,6 +33,7 @@ struct gfs2_trans;
 struct gfs2_jdesc;
 struct gfs2_sbd;
 struct lm_lockops;
+struct gfs2_rgrp_lvb;
=20
 typedef void (*gfs2_glop_bh_t) (struct gfs2_glock *gl, unsigned int ret);
=20
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 2466bb44a23c..1165627274cf 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -46,6 +46,16 @@
 #define LBITSKIP00 (0x0000000000000000UL)
 #endif
=20
+struct gfs2_rgrp_lvb {
+=09__be32 rl_magic;
+=09__be32 rl_flags;
+=09__be32 rl_free;
+=09__be32 rl_dinodes;
+=09__be64 rl_igeneration;
+=09__be32 rl_unlinked;
+=09__be32 __pad;
+};
+
 /*
  * These routines are used by the resource group routines (rgrp.c)
  * to keep track of block allocation.  Each block is represented by two
diff --git a/include/uapi/linux/gfs2_ondisk.h b/include/uapi/linux/gfs2_ond=
isk.h
index 2dc10a034de1..4e9a80941bec 100644
--- a/include/uapi/linux/gfs2_ondisk.h
+++ b/include/uapi/linux/gfs2_ondisk.h
@@ -171,16 +171,6 @@ struct gfs2_rindex {
 #define GFS2_RGF_NOALLOC=090x00000008
 #define GFS2_RGF_TRIMMED=090x00000010
=20
-struct gfs2_rgrp_lvb {
-=09__be32 rl_magic;
-=09__be32 rl_flags;
-=09__be32 rl_free;
-=09__be32 rl_dinodes;
-=09__be64 rl_igeneration;
-=09__be32 rl_unlinked;
-=09__be32 __pad;
-};
-
 struct gfs2_rgrp {
 =09struct gfs2_meta_header rg_header;
=20
--=20
2.20.1

