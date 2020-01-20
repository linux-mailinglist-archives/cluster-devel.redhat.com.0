Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 406421426CF
	for <lists+cluster-devel@lfdr.de>; Mon, 20 Jan 2020 10:13:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579511620;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eqxvQkjgIDasVfV8Gvn9STaWfqXhRGd7r5eGc3NJme4=;
	b=hLRMo3Ei0TvWKspAi/W7IwzGQnOPJZX7rosQ4kjIBvl/KsIoxEdv4L4JYVAdPISf2KjwL3
	n+UBijy/qYdPOGl7KpvCqw3STduM7b65rghU4CU9sIWunXEmEjaLVeRE/Y9sC+JgW16O6G
	etgn95gEJ3sg2lr4L7Va/YW5Ik/JQt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-FpfNgGurOUmG9ggHHpEa1A-1; Mon, 20 Jan 2020 04:13:39 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9491A800D50;
	Mon, 20 Jan 2020 09:13:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80FE45C299;
	Mon, 20 Jan 2020 09:13:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 556508196C;
	Mon, 20 Jan 2020 09:13:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00K9DYpX031742 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 04:13:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 52E0384D9F; Mon, 20 Jan 2020 09:13:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-63.brq.redhat.com [10.40.204.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0E18F84DAB;
	Mon, 20 Jan 2020 09:13:26 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 20 Jan 2020 10:13:00 +0100
Message-Id: <20200120091305.24997-7-agruenba@redhat.com>
In-Reply-To: <20200120091305.24997-1-agruenba@redhat.com>
References: <20200120091305.24997-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 06/11] gfs2: Try harder to delete inodes
	locally
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
X-MC-Unique: FpfNgGurOUmG9ggHHpEa1A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

When an inode's link count drops to zero and the inode is cached on
other nodes, the current behavior of gfs2 is to immediately give up and
to rely on the other node(s) to delete the inode if there is iopen glock
contention.  This leads to resource group glock bouncing and the loss of
caching.  With the previous patches in place, we can fix that by not
giving up immediately.

When the inode is still open on other nodes, those nodes won't be able
to evict the inode and give up the iopen glock.  In that case, our lock
conversion request will time out.  The unlink system call will block for
the duration of the iopen lock conversion request.  We're also holding
the inode glock in EX mode for an extended duration, so other nodes
won't be able to make progress on the inode, either.

This is worse than what we had before, but we can prevent other nodes
from getting stuck by aborting our iopen locking request if there is
contention on the inode glock, and we can also switch to performing the
delete asynchronously in that case.  Those will the the subjects of
future patches.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/super.c | 53 +++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 874949b17495..d5b44290da7f 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1222,6 +1222,50 @@ static void gfs2_glock_put_eventually(struct gfs2_gl=
ock *gl)
 =09=09gfs2_glock_put(gl);
 }
=20
+static bool gfs2_upgrade_iopen_glock(struct inode *inode)
+{
+=09struct gfs2_inode *ip =3D GFS2_I(inode);
+=09struct gfs2_sbd *sdp =3D GFS2_SB(inode);
+=09struct gfs2_holder *gh =3D &ip->i_iopen_gh;
+=09long timeout =3D 5 * HZ;
+=09int error;
+
+=09gh->gh_flags |=3D GL_NOCACHE;
+=09gfs2_glock_dq_wait(gh);
+
+=09/*
+=09 * If there are no other lock holders, we'll get the lock immediately.
+=09 * Otherwise, the other nodes holding the lock will be notified about
+=09 * our locking request.  If they don't have the inode open, they'll
+=09 * evict the cached inode and release the lock.  As a last resort,
+=09 * we'll eventually time out.
+=09 *
+=09 * Note that we're passing the LM_FLAG_TRY_1CB flag to the first
+=09 * locking request is an optimization to notify lock holders as soon as
+=09 * possible.  Without that flag, they'd be notified implicitly by the
+=09 * second locking request.
+=09 */
+
+=09gfs2_holder_reinit(LM_ST_EXCLUSIVE, LM_FLAG_TRY | LM_FLAG_TRY_1CB | GL_=
NOCACHE, gh);
+=09error =3D gfs2_glock_nq(gh);
+=09if (error !=3D GLR_TRYFAILED)
+=09=09return !error;
+
+=09gfs2_holder_reinit(LM_ST_EXCLUSIVE, GL_ASYNC | GL_NOCACHE, gh);
+=09error =3D gfs2_glock_nq(gh);
+=09if (error)
+=09=09return false;
+
+=09timeout =3D wait_event_interruptible_timeout(sdp->sd_async_glock_wait,
+=09=09!test_bit(HIF_WAIT, &gh->gh_iflags),
+=09=09timeout);
+=09if (!test_bit(HIF_HOLDER, &gh->gh_iflags)) {
+=09=09gfs2_glock_dq(gh);
+=09=09return false;
+=09}
+=09return true;
+}
+
 /**
  * gfs2_evict_inode - Remove an inode from cache
  * @inode: The inode to evict
@@ -1303,13 +1347,10 @@ static void gfs2_evict_inode(struct inode *inode)
 out_delete:
 =09if (gfs2_holder_initialized(&ip->i_iopen_gh) &&
 =09    test_bit(HIF_HOLDER, &ip->i_iopen_gh.gh_iflags)) {
-=09=09ip->i_iopen_gh.gh_flags |=3D GL_NOCACHE;
-=09=09gfs2_glock_dq_wait(&ip->i_iopen_gh);
-=09=09gfs2_holder_reinit(LM_ST_EXCLUSIVE, LM_FLAG_TRY_1CB | GL_NOCACHE,
-=09=09=09=09   &ip->i_iopen_gh);
-=09=09error =3D gfs2_glock_nq(&ip->i_iopen_gh);
-=09=09if (error)
+=09=09if (!gfs2_upgrade_iopen_glock(inode)) {
+=09=09=09gfs2_holder_uninit(&ip->i_iopen_gh);
 =09=09=09goto out_truncate;
+=09=09}
 =09}
=20
 =09if (S_ISDIR(inode->i_mode) &&
--=20
2.20.1

