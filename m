Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 01568FE04C
	for <lists+cluster-devel@lfdr.de>; Fri, 15 Nov 2019 15:42:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573828974;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=KPXmYHu1wLgAzzYqTXdVrg01wbg4kl9LXg2R7MlXDDI=;
	b=DhWivNZ/BUNgKoVl1VwYc8TwZS48QEOr9jLmW4yehpc/FFSf4PKmN27nS0gDwx7ar9CLhZ
	coPyMWOQAsuCXu8iGzyrdVWpWtZZUMrBcusTZ4COeqhAilTaUnXdage9s7xv9nCkYR/t4u
	KUNBdqKgKCwrBhTg+0d/Jp949u6KfGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-kVdko4LoM2W0tHHxDxdAsA-1; Fri, 15 Nov 2019 09:42:53 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D64EDBE5;
	Fri, 15 Nov 2019 14:42:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CFFD5C1C3;
	Fri, 15 Nov 2019 14:42:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D99C74BB65;
	Fri, 15 Nov 2019 14:42:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAFEgniT002698 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 15 Nov 2019 09:42:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 51F165E262; Fri, 15 Nov 2019 14:42:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C5455DC1B
	for <cluster-devel@redhat.com>; Fri, 15 Nov 2019 14:42:46 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D537218089C8
	for <cluster-devel@redhat.com>; Fri, 15 Nov 2019 14:42:46 +0000 (UTC)
Date: Fri, 15 Nov 2019 09:42:46 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1945050534.30233372.1573828966829.JavaMail.zimbra@redhat.com>
In-Reply-To: <1083483282.30233245.1573828936820.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.60, 10.4.195.26]
Thread-Topic: gfs2: Abort gfs2_freeze if io error is seen
Thread-Index: 53+7HxRvM9BqiEfOFogXhFd5hbCSRw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v2] gfs2: Abort gfs2_freeze if io error
	is seen
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
X-MC-Unique: kVdko4LoM2W0tHHxDxdAsA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Revised to implement Andreas's suggestions.

Bob
---
Before this patch, an io error, such as -EIO writing to the journal
would cause function gfs2_freeze to go into an infinite loop,
continuously retrying the freeze operation. But nothing ever clears
the -EIO except unmount after withdraw, which is impossible if the
freeze operation never ends (fails). Instead you get:

[ 6499.767994] gfs2: fsid=3Ddm-32.0: error freezing FS: -5
[ 6499.773058] gfs2: fsid=3Ddm-32.0: retrying...
[ 6500.791957] gfs2: fsid=3Ddm-32.0: error freezing FS: -5
[ 6500.797015] gfs2: fsid=3Ddm-32.0: retrying...

This patch adds a check for -EIO in gfs2_freeze, and if seen, it
dequeues the freeze glock, aborts the loop and returns the error.
Also, there's no need to pass the freeze holder to function
gfs2_lock_fs_check_clean since it's only called in one place and
it's a well-known superblock pointer, so this simplifies that.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 8154c38e488b..68cc7c291a81 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -399,8 +399,7 @@ struct lfcc {
  * Returns: errno
  */
=20
-static int gfs2_lock_fs_check_clean(struct gfs2_sbd *sdp,
-=09=09=09=09    struct gfs2_holder *freeze_gh)
+static int gfs2_lock_fs_check_clean(struct gfs2_sbd *sdp)
 {
 =09struct gfs2_inode *ip;
 =09struct gfs2_jdesc *jd;
@@ -425,7 +424,9 @@ static int gfs2_lock_fs_check_clean(struct gfs2_sbd *sd=
p,
 =09}
=20
 =09error =3D gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_EXCLUSIVE,
-=09=09=09=09   GL_NOCACHE, freeze_gh);
+=09=09=09=09   GL_NOCACHE, &sdp->sd_freeze_gh);
+=09if (error)
+=09=09goto out;
=20
 =09list_for_each_entry(jd, &sdp->sd_jindex_list, jd_list) {
 =09=09error =3D gfs2_jdesc_check(jd);
@@ -441,7 +442,7 @@ static int gfs2_lock_fs_check_clean(struct gfs2_sbd *sd=
p,
 =09}
=20
 =09if (error)
-=09=09gfs2_glock_dq_uninit(freeze_gh);
+=09=09gfs2_glock_dq_uninit(&sdp->sd_freeze_gh);
=20
 out:
 =09while (!list_empty(&list)) {
@@ -767,15 +768,19 @@ static int gfs2_freeze(struct super_block *sb)
 =09=09=09goto out;
 =09=09}
=20
-=09=09error =3D gfs2_lock_fs_check_clean(sdp, &sdp->sd_freeze_gh);
+=09=09error =3D gfs2_lock_fs_check_clean(sdp);
 =09=09if (!error)
 =09=09=09break;
=20
 =09=09if (error =3D=3D -EBUSY)
 =09=09=09fs_err(sdp, "waiting for recovery before freeze\n");
-=09=09else
+=09=09else if (error =3D=3D -EIO) {
+=09=09=09fs_err(sdp, "Fatal IO error: cannot freeze gfs2 due "
+=09=09=09       "to recovery error.\n");
+=09=09=09goto out;
+=09=09} else {
 =09=09=09fs_err(sdp, "error freezing FS: %d\n", error);
-
+=09=09}
 =09=09fs_err(sdp, "retrying...\n");
 =09=09msleep(1000);
 =09}

