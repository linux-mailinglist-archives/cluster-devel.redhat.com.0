Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 93B87FBACC
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Nov 2019 22:30:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573680651;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mTKmo28qn9pkWxVY3zZId/JUOncVAAI6nRBPoQmcPM8=;
	b=RltON9PEmhHpknwC7K/wIYaSF0Yk0Xt3ddm3O7xEn7sjcbZ5bjk9sjOWza+6P6olf6w5o+
	PBm01tVf0rj+GTuGsl/4yLyOfyk0WhUiM+QPSbZs41TBaBrrYIfqeHJmbg6WgeZ1tDmYip
	WK84PY1TsgEGa9Tjnqlt9z301xFVzCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-Fa8sEMaFMQ-Z3oTQCdd4Pg-1; Wed, 13 Nov 2019 16:30:46 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF70E189DC14;
	Wed, 13 Nov 2019 21:30:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2FC85F795;
	Wed, 13 Nov 2019 21:30:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8876B4E56C;
	Wed, 13 Nov 2019 21:30:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLUdrl005291 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:30:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5D4766973C; Wed, 13 Nov 2019 21:30:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-140.phx2.redhat.com [10.3.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 279B569739
	for <cluster-devel@redhat.com>; Wed, 13 Nov 2019 21:30:39 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 13 Nov 2019 15:30:12 -0600
Message-Id: <20191113213030.237431-15-rpeterso@redhat.com>
In-Reply-To: <20191113213030.237431-1-rpeterso@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 14/32] gfs2: fix infinite loop when checking
	ail item count before go_inval
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
X-MC-Unique: Fa8sEMaFMQ-Z3oTQCdd4Pg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Before this patch, the rgrp_go_inval and inode_go_inval functions each
checked if there were any items left on the ail count (by way of a
count), and if so, did a withdraw. But the withdraw code now uses
glocks when changing the file system to read-only status. So we can
not have glock functions withdrawing or a hang will likely result:
The glocks can't be serviced by the work_func if the work_func is
busy doing its own withdraw.

This patch removes the checks from the go_inval functions and adds
a centralized check in do_xmote to warn about the problem and not
withdraw, but flag the error so it's eventually caught when the logd
daemon eventually runs.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c | 17 +++++++++++++++--
 fs/gfs2/glops.c |  3 ---
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index d8e48b72026e..879625471fe0 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -596,9 +596,22 @@ __acquires(&gl->gl_lockref.lock)
 =09spin_unlock(&gl->gl_lockref.lock);
 =09if (glops->go_sync)
 =09=09glops->go_sync(gl);
-=09if (test_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags))
+=09if (test_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags)) {
+=09=09/*
+=09=09 * The call to go_sync should have cleared out the ail list.
+=09=09 * If there are still items, we have a problem. We ought to
+=09=09 * withdraw, but we can't because the withdraw code also uses
+=09=09 * glocks. Warn about the error, dump the glock, then fall
+=09=09 * through and wait for logd to do the withdraw for us.
+=09=09 */
+=09=09if ((atomic_read(&gl->gl_ail_count) !=3D 0) &&
+=09=09    (!cmpxchg(&sdp->sd_log_error, 0, -EIO))) {
+=09=09=09gfs2_assert_warn(sdp, !atomic_read(&gl->gl_ail_count));
+=09=09=09gfs2_dump_glock(NULL, gl, true);
+=09=09}
 =09=09glops->go_inval(gl, target =3D=3D LM_ST_DEFERRED ? 0 : DIO_METADATA)=
;
-=09clear_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags);
+=09=09clear_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags);
+=09}
=20
 =09gfs2_glock_hold(gl);
 =09if (sdp->sd_lockstruct.ls_ops->lm_lock)=09{
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 3904e4892a65..d8f9ee756c0e 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -187,7 +187,6 @@ static void rgrp_go_inval(struct gfs2_glock *gl, int fl=
ags)
 =09=09gfs2_rgrp_brelse(rgd);
=20
 =09WARN_ON_ONCE(!(flags & DIO_METADATA));
-=09gfs2_assert_withdraw(sdp, !atomic_read(&gl->gl_ail_count));
 =09truncate_inode_pages_range(mapping, gl->gl_vm.start, gl->gl_vm.end);
=20
 =09if (rgd)
@@ -287,8 +286,6 @@ static void inode_go_inval(struct gfs2_glock *gl, int f=
lags)
 {
 =09struct gfs2_inode *ip =3D gfs2_glock2inode(gl);
=20
-=09gfs2_assert_withdraw(gl->gl_name.ln_sbd, !atomic_read(&gl->gl_ail_count=
));
-
 =09if (flags & DIO_METADATA) {
 =09=09struct address_space *mapping =3D gfs2_glock2aspace(gl);
 =09=09truncate_inode_pages(mapping, 0);
--=20
2.23.0

