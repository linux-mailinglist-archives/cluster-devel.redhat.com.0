Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2F8FBABD
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Nov 2019 22:30:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573680645;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2lzvZpOo5Rx2BMsIHVcfT/JwxNo1yPSbWCBGFRTFMJk=;
	b=O6kWrge9/DH9Y5u2J0LeR67PsSPT6135T9zhCfxoNQ3UpuguGcm9U5vDPz8GCZg1TYcB3Z
	GCoi/rf0fORkoVtWCIEuZqJK0BgIM9iBrRELgxBref0tW84DXncSm1wozeVkPCIC0BvT94
	ssw+7nSkev/7v0UINsvev+1pYy2iIfw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-WK9UceIBPN66xv8SpPCzDg-1; Wed, 13 Nov 2019 16:30:43 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09437DBF6;
	Wed, 13 Nov 2019 21:30:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA8BD5F78A;
	Wed, 13 Nov 2019 21:30:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 92A8E18034ED;
	Wed, 13 Nov 2019 21:30:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLUbpA005246 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:30:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8C4A469739; Wed, 13 Nov 2019 21:30:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-140.phx2.redhat.com [10.3.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 57CFF5C1BB
	for <cluster-devel@redhat.com>; Wed, 13 Nov 2019 21:30:37 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 13 Nov 2019 15:30:07 -0600
Message-Id: <20191113213030.237431-10-rpeterso@redhat.com>
In-Reply-To: <20191113213030.237431-1-rpeterso@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 09/32] gfs2: Allow some glocks to be used
	during withdraw
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
X-MC-Unique: WK9UceIBPN66xv8SpPCzDg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

We need to allow some glocks to be enqueued, dequeued, promoted, and demote=
d
when we're withdrawn. For example, to maintain metadata integrity, we shoul=
d
disallow the use of inode and rgrp glocks when withdrawn. Other glocks, lik=
e
iopen or the transaction glocks may be safely used because none of their
metadata goes through the journal. So in general, we should disallow all
glocks with an address space, and allow all the others. One exception is:
we need to allow our active journal to be demoted so others may recover it.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c  | 29 +++++++++++++++++++++++++++--
 fs/gfs2/glops.c  |  4 ++--
 fs/gfs2/incore.h |  1 +
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 809f9cf4239d..15ff968e8192 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -133,6 +133,31 @@ static void gfs2_glock_dealloc(struct rcu_head *rcu)
 =09}
 }
=20
+/**
+ * allow_while_withdrawn - determine if we can use this glock while withdr=
awn
+ * @gl: the glock
+ *
+ * We need to allow some glocks to be enqueued, dequeued, promoted, and de=
moted
+ * when we're withdrawn. For example, to maintain metadata integrity, we s=
hould
+ * disallow the use of inode and rgrp glocks when withdrawn. Other glocks,=
 like
+ * iopen or the transaction glocks may be safely used because none of thei=
r
+ * metadata goes through the journal. So in general, we should disallow al=
l
+ * glocks that are journaled, and allow all the others. One exception is:
+ * we need to allow our active journal to be demoted so others may recover=
 it.
+ */
+static bool allow_while_withdrawn(struct gfs2_glock *gl)
+{
+=09struct gfs2_sbd *sdp;
+
+=09if (!(gl->gl_ops->go_flags & GLOF_JOURNALED))
+=09=09return true;
+
+=09sdp =3D gl->gl_name.ln_sbd;
+=09if (!sdp->sd_jdesc || gl->gl_object =3D=3D sdp->sd_jdesc->jd_inode)
+=09=09return true;
+=09return false;
+}
+
 void gfs2_glock_free(struct gfs2_glock *gl)
 {
 =09struct gfs2_sbd *sdp =3D gl->gl_name.ln_sbd;
@@ -549,7 +574,7 @@ __acquires(&gl->gl_lockref.lock)
 =09unsigned int lck_flags =3D (unsigned int)(gh ? gh->gh_flags : 0);
 =09int ret;
=20
-=09if (unlikely(gfs2_withdrawn(sdp)) &&
+=09if (unlikely(gfs2_withdrawn(sdp)) && !allow_while_withdrawn(gl) &&
 =09    target !=3D LM_ST_UNLOCKED)
 =09=09return;
 =09lck_flags &=3D (LM_FLAG_TRY | LM_FLAG_TRY_1CB | LM_FLAG_NOEXP |
@@ -1190,7 +1215,7 @@ int gfs2_glock_nq(struct gfs2_holder *gh)
 =09struct gfs2_sbd *sdp =3D gl->gl_name.ln_sbd;
 =09int error =3D 0;
=20
-=09if (unlikely(gfs2_withdrawn(sdp)))
+=09if (unlikely(gfs2_withdrawn(sdp)) && !allow_while_withdrawn(gl))
 =09=09return -EIO;
=20
 =09if (test_bit(GLF_LRU, &gl->gl_flags))
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index dec5e245b991..04f55e5b8bf1 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -587,7 +587,7 @@ const struct gfs2_glock_operations gfs2_inode_glops =3D=
 {
 =09.go_lock =3D inode_go_lock,
 =09.go_dump =3D inode_go_dump,
 =09.go_type =3D LM_TYPE_INODE,
-=09.go_flags =3D GLOF_ASPACE | GLOF_LRU,
+=09.go_flags =3D GLOF_ASPACE | GLOF_LRU | GLOF_JOURNALED,
 };
=20
 const struct gfs2_glock_operations gfs2_rgrp_glops =3D {
@@ -596,7 +596,7 @@ const struct gfs2_glock_operations gfs2_rgrp_glops =3D =
{
 =09.go_lock =3D gfs2_rgrp_go_lock,
 =09.go_dump =3D gfs2_rgrp_dump,
 =09.go_type =3D LM_TYPE_RGRP,
-=09.go_flags =3D GLOF_LVB,
+=09.go_flags =3D GLOF_LVB | GLOF_JOURNALED,
 };
=20
 const struct gfs2_glock_operations gfs2_freeze_glops =3D {
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index d37698502d5d..f6ec52776408 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -247,6 +247,7 @@ struct gfs2_glock_operations {
 #define GLOF_ASPACE 1
 #define GLOF_LVB    2
 #define GLOF_LRU    4
+#define GLOF_JOURNALED 8 /* goes through the journal */
 };
=20
 enum {
--=20
2.23.0

