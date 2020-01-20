Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBDC1426D4
	for <lists+cluster-devel@lfdr.de>; Mon, 20 Jan 2020 10:13:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579511628;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pOAkQJWyN5LTg6y+Q7vk4thVWYzQR/D8TRQKtlv71HQ=;
	b=LdRMIFMEirWmeb7Yl+vBjWXjLeZJp4eizcGxf6rY55eBbXx7Xo16JIzJ19xYudIEsccDoI
	LC5HwuZwbfFcG++mJ9PUAnfU6lMr/bF2ItR2tf5MlIrPeozlyiJt8ecVQidcTeNOg4TR79
	4TCbDB/yJ9lZsWuz+lmoSD/TVfZwyXA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-5c4cHrUwMPqGSDSZmdjVjg-1; Mon, 20 Jan 2020 04:13:47 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80AE7A0CD5;
	Mon, 20 Jan 2020 09:13:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FA771001DD7;
	Mon, 20 Jan 2020 09:13:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 58DCA18089CF;
	Mon, 20 Jan 2020 09:13:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00K9DfHT031792 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 04:13:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BEC7E84DAB; Mon, 20 Jan 2020 09:13:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-63.brq.redhat.com [10.40.204.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0001A84D9F;
	Mon, 20 Jan 2020 09:13:40 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 20 Jan 2020 10:13:05 +0100
Message-Id: <20200120091305.24997-12-agruenba@redhat.com>
In-Reply-To: <20200120091305.24997-1-agruenba@redhat.com>
References: <20200120091305.24997-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 11/11] gfs2: Smarter iopen glock waiting
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
X-MC-Unique: 5c4cHrUwMPqGSDSZmdjVjg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

When trying to upgrade the iopen glock from a shared to an exclusive lock i=
n
gfs2_evict_inode, abort the wait when there is contention on the correspond=
ing
inode glock: in that case, the inode must still be in active use on another
node, and we're not guaranteed to get the iopen glock in reasonable time.

To make this work even better, poke the inode glock when we notice contenti=
on
on the iopen glock and we can't evict the corresponsing inode and release t=
he
iopen glock immediately.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 34 ++++++++++++++++++++++++++++++++--
 fs/gfs2/super.c | 11 ++++++++---
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 5c3dfec991f6..b32c800c895e 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -705,6 +705,17 @@ bool gfs2_inode_already_deleted(struct gfs2_glock *gl,=
 u64 generation)
 =09return generation <=3D be64_to_cpu(ri->ri_generation_deleted);
 }
=20
+static void gfs2_glock_poke(struct gfs2_glock *gl)
+{
+=09int flags =3D LM_FLAG_TRY | LM_FLAG_TRY_1CB | LM_FLAG_ANY | GL_SKIP;
+=09struct gfs2_holder gh;
+=09int error;
+
+=09error =3D gfs2_glock_nq_init(gl, LM_ST_SHARED, flags, &gh);
+=09if (!error)
+=09=09gfs2_glock_dq(&gh);
+}
+
 static bool gfs2_try_evict(struct gfs2_glock *gl)
 {
 =09struct gfs2_inode *ip;
@@ -726,6 +737,8 @@ static bool gfs2_try_evict(struct gfs2_glock *gl)
 =09=09ip =3D NULL;
 =09spin_unlock(&gl->gl_lockref.lock);
 =09if (ip) {
+=09=09struct gfs2_glock *inode_gl =3D NULL;
+
 =09=09gl->gl_no_formal_ino =3D ip->i_no_formal_ino;
 =09=09set_bit(GIF_DEFERRED_DELETE, &ip->i_flags);
 =09=09d_prune_aliases(&ip->i_inode);
@@ -734,9 +747,16 @@ static bool gfs2_try_evict(struct gfs2_glock *gl)
 =09=09/* If the inode was evicted, gl->gl_object will now be NULL. */
 =09=09spin_lock(&gl->gl_lockref.lock);
 =09=09ip =3D gl->gl_object;
-=09=09if (ip)
+=09=09if (ip) {
+=09=09=09inode_gl =3D ip->i_gl;
+=09=09=09inode_gl->gl_lockref.count++;
 =09=09=09clear_bit(GIF_DEFERRED_DELETE, &ip->i_flags);
+=09=09}
 =09=09spin_unlock(&gl->gl_lockref.lock);
+=09=09if (inode_gl) {
+=09=09=09gfs2_glock_poke(inode_gl);
+=09=09=09gfs2_glock_put(inode_gl);
+=09=09}
 =09=09evicted =3D !ip;
 =09}
 =09return evicted;
@@ -763,13 +783,23 @@ static void delete_work_func(struct work_struct *work=
)
 =09=09 * has happened.  If we cause contention on the inode glock
 =09=09 * immediately, the remote node will think that we still have
 =09=09 * the inode in use, and so it will give up waiting.
+=09=09 *
+=09=09 * If we can't evict the inode, signal to the remote node that
+=09=09 * the inode is still in use.  We'll later try to delete the
+=09=09 * inode locally in gfs2_evict_inode.
+=09=09 *
+=09=09 * FIXME: We only need to verify that the remote node has
+=09=09 * deleted the inode because nodes before this remote delete
+=09=09 * rework won't cooperate.  At a later time, when we no longer
+=09=09 * care about compatibility with such nodes, we can skip this
+=09=09 * step entirely.
 =09=09 */
 =09=09if (gfs2_try_evict(gl)) {
 =09=09=09if (queue_delayed_work(gfs2_delete_workqueue,
 =09=09=09=09=09       &gl->gl_delete, 5 * HZ))
 =09=09=09=09return;
-=09=09=09goto out;
 =09=09}
+=09=09goto out;
 =09}
=20
 =09inode =3D gfs2_lookup_by_inum(sdp, no_addr, gl->gl_no_formal_ino,
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index d5b44290da7f..942d45e85d5c 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1237,8 +1237,12 @@ static bool gfs2_upgrade_iopen_glock(struct inode *i=
node)
 =09 * If there are no other lock holders, we'll get the lock immediately.
 =09 * Otherwise, the other nodes holding the lock will be notified about
 =09 * our locking request.  If they don't have the inode open, they'll
-=09 * evict the cached inode and release the lock.  As a last resort,
-=09 * we'll eventually time out.
+=09 * evict the cached inode and release the lock.  Otherwise, if they
+=09 * poke the inode glock, we'll take this as an indication that they
+=09 * still need the iopen glock and that they'll take care of deleting
+=09 * the inode when they're done.  As a last resort, if another node
+=09 * keeps holding the iopen glock without showing any activity on the
+=09 * inode glock, we'll eventually time out.
 =09 *
 =09 * Note that we're passing the LM_FLAG_TRY_1CB flag to the first
 =09 * locking request is an optimization to notify lock holders as soon as
@@ -1257,7 +1261,8 @@ static bool gfs2_upgrade_iopen_glock(struct inode *in=
ode)
 =09=09return false;
=20
 =09timeout =3D wait_event_interruptible_timeout(sdp->sd_async_glock_wait,
-=09=09!test_bit(HIF_WAIT, &gh->gh_iflags),
+=09=09!test_bit(HIF_WAIT, &gh->gh_iflags) ||
+=09=09test_bit(GLF_DEMOTE, &ip->i_gl->gl_flags),
 =09=09timeout);
 =09if (!test_bit(HIF_HOLDER, &gh->gh_iflags)) {
 =09=09gfs2_glock_dq(gh);
--=20
2.20.1

