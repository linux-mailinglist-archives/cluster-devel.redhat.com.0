Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8810D1426CC
	for <lists+cluster-devel@lfdr.de>; Mon, 20 Jan 2020 10:13:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579511606;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KbCCQo8k4PMPH+ZskOcYIIERuoDjxY3K8DQLY7jxNJI=;
	b=ioBDTOX247WnWmNNTt3BV+yW0SqdLpDhmopPEKPrqY/2jl+mMXQtcXVOMCL10jjKhd2syT
	GyoeAcwpaWzo8HuHHDfdnJ5kefWYPz381UkyPlI3eWMAVCXSY1iJv6LTYBT1hNJhQFggl9
	IqNfkp1mG09Qc7S+kNmg9zujAFihOXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-lIv7NNnvORCchlDyuXzkjw-1; Mon, 20 Jan 2020 04:13:25 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5C871085929;
	Mon, 20 Jan 2020 09:13:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF9E410013A7;
	Mon, 20 Jan 2020 09:13:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B225118089CD;
	Mon, 20 Jan 2020 09:13:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00K9DLok031694 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 04:13:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 33D5D84DAD; Mon, 20 Jan 2020 09:13:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-63.brq.redhat.com [10.40.204.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D4C3484DAF;
	Mon, 20 Jan 2020 09:13:15 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 20 Jan 2020 10:12:58 +0100
Message-Id: <20200120091305.24997-5-agruenba@redhat.com>
In-Reply-To: <20200120091305.24997-1-agruenba@redhat.com>
References: <20200120091305.24997-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 04/11] gfs2: Turn gl_delete into a delayed
	work
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
X-MC-Unique: lIv7NNnvORCchlDyuXzkjw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

We'll want to queue a delayed work in a future patch.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c  | 5 +++--
 fs/gfs2/glops.c  | 3 ++-
 fs/gfs2/incore.h | 4 ++--
 fs/gfs2/rgrp.c   | 3 ++-
 fs/gfs2/super.c  | 3 ++-
 5 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 3a9502af895b..e71f23ebb99b 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -698,7 +698,8 @@ bool gfs2_inode_already_deleted(struct gfs2_glock *gl, =
u64 generation)
=20
 static void delete_work_func(struct work_struct *work)
 {
-=09struct gfs2_glock *gl =3D container_of(work, struct gfs2_glock, gl_dele=
te);
+=09struct delayed_work *dwork =3D to_delayed_work(work);
+=09struct gfs2_glock *gl =3D container_of(dwork, struct gfs2_glock, gl_del=
ete);
 =09struct gfs2_sbd *sdp =3D gl->gl_name.ln_sbd;
 =09struct inode *inode;
 =09u64 no_addr =3D gl->gl_name.ln_number;
@@ -871,7 +872,7 @@ int gfs2_glock_get(struct gfs2_sbd *sdp, u64 number,
 =09gl->gl_object =3D NULL;
 =09gl->gl_hold_time =3D GL_GLOCK_DFT_HOLD;
 =09INIT_DELAYED_WORK(&gl->gl_work, glock_work_func);
-=09INIT_WORK(&gl->gl_delete, delete_work_func);
+=09INIT_DELAYED_WORK(&gl->gl_delete, delete_work_func);
=20
 =09mapping =3D gfs2_glock2aspace(gl);
 =09if (mapping) {
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 4b4676fb8c3e..3534878db98d 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -577,7 +577,8 @@ static void iopen_go_callback(struct gfs2_glock *gl, bo=
ol remote)
 =09if (gl->gl_demote_state =3D=3D LM_ST_UNLOCKED &&
 =09    gl->gl_state =3D=3D LM_ST_SHARED && ip) {
 =09=09gl->gl_lockref.count++;
-=09=09if (queue_work(gfs2_delete_workqueue, &gl->gl_delete) =3D=3D 0)
+=09=09if (!queue_delayed_work(gfs2_delete_workqueue,
+=09=09=09=09=09&gl->gl_delete, 0))
 =09=09=09gl->gl_lockref.count--;
 =09}
 }
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 5f89c515f5bb..d7282356cbf5 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -375,8 +375,8 @@ struct gfs2_glock {
 =09atomic_t gl_revokes;
 =09struct delayed_work gl_work;
 =09union {
-=09=09/* For inode and iopen glocks only */
-=09=09struct work_struct gl_delete;
+=09=09/* For iopen glocks only */
+=09=09struct delayed_work gl_delete;
 =09=09/* For rgrp glocks only */
 =09=09struct {
 =09=09=09loff_t start;
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 2466bb44a23c..34a8fab53e5b 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1873,7 +1873,8 @@ static void try_rgrp_unlink(struct gfs2_rgrpd *rgd, u=
64 *last_unlinked, u64 skip
 =09=09 */
 =09=09ip =3D gl->gl_object;
=20
-=09=09if (ip || queue_work(gfs2_delete_workqueue, &gl->gl_delete) =3D=3D 0=
)
+=09=09if (ip || !queue_delayed_work(gfs2_delete_workqueue,
+=09=09=09=09=09      &gl->gl_delete, 0))
 =09=09=09gfs2_glock_put(gl);
 =09=09else
 =09=09=09found++;
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index b108b6379fb7..1a029beaaaca 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1017,7 +1017,8 @@ static int gfs2_drop_inode(struct inode *inode)
 =09=09struct gfs2_glock *gl =3D ip->i_iopen_gh.gh_gl;
=20
 =09=09gfs2_glock_hold(gl);
-=09=09if (queue_work(gfs2_delete_workqueue, &gl->gl_delete) =3D=3D 0)
+=09=09if (!queue_delayed_work(gfs2_delete_workqueue,
+=09=09=09=09=09&gl->gl_delete, 0))
 =09=09=09gfs2_glock_queue_put(gl);
 =09=09return false;
 =09}
--=20
2.20.1

