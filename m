Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 63E32141003
	for <lists+cluster-devel@lfdr.de>; Fri, 17 Jan 2020 18:40:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579282826;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GqOg6KUcDhb8samIBxACiJwGnDc+B98tMapEXuRbBQg=;
	b=ctz0tsluHcmKKVQRovHNYaeE9PpduVWKl48Eseggx5v+oQD1//HA8cg+RI1DqVQg2IV0xs
	AqjmJsyNWt/AldpyuVsHWDWteTrO+BuYYY9gAA7jrC2orYSsy9PMK0q/mxHTtyrDz4dmsm
	B6AF2NY8zoGeK7w17pRf4b1pOmZz8rE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-QrxVr_3vPXu_ZUIr9VUSTA-1; Fri, 17 Jan 2020 12:40:24 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66E3518CA241;
	Fri, 17 Jan 2020 17:40:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 276DA89D22;
	Fri, 17 Jan 2020 17:40:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC37218089CE;
	Fri, 17 Jan 2020 17:40:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00HHeJwr025172 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 17 Jan 2020 12:40:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B6C8519481; Fri, 17 Jan 2020 17:40:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-63.brq.redhat.com [10.40.204.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED58519C7F;
	Fri, 17 Jan 2020 17:40:16 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 17 Jan 2020 18:40:14 +0100
Message-Id: <20200117174014.16485-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Don't add glocks to the LRU while
	still in use
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: QrxVr_3vPXu_ZUIr9VUSTA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Only add glocks to the LRU once they're no longer in use.  They will outliv=
e
the inode they are associated with if they are cached (not GL_NOCACHE) or i=
f
they have some pending work attached.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 2 +-
 fs/gfs2/glock.h | 1 -
 fs/gfs2/super.c | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index cabffdc126fd..2aa21bab8e1c 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -178,7 +178,7 @@ static int demote_ok(const struct gfs2_glock *gl)
 }
=20
=20
-void gfs2_glock_add_to_lru(struct gfs2_glock *gl)
+static void gfs2_glock_add_to_lru(struct gfs2_glock *gl)
 {
 =09if (!(gl->gl_ops->go_flags & GLOF_LRU))
 =09=09return;
diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
index b8adaf80e4c5..dc23cbf6ae7a 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -238,7 +238,6 @@ extern void gfs2_glock_complete(struct gfs2_glock *gl, =
int ret);
 extern void gfs2_gl_hash_clear(struct gfs2_sbd *sdp);
 extern void gfs2_glock_finish_truncate(struct gfs2_inode *ip);
 extern void gfs2_glock_thaw(struct gfs2_sbd *sdp);
-extern void gfs2_glock_add_to_lru(struct gfs2_glock *gl);
 extern void gfs2_glock_free(struct gfs2_glock *gl);
=20
 extern int __init gfs2_glock_init(void);
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 68cc7c291a81..2621d925812b 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1378,7 +1378,6 @@ static void gfs2_evict_inode(struct inode *inode)
 =09gfs2_dir_hash_inval(ip);
 =09glock_clear_object(ip->i_gl, ip);
 =09wait_on_bit_io(&ip->i_flags, GIF_GLOP_PENDING, TASK_UNINTERRUPTIBLE);
-=09gfs2_glock_add_to_lru(ip->i_gl);
 =09gfs2_glock_put_eventually(ip->i_gl);
 =09ip->i_gl =3D NULL;
 =09if (gfs2_holder_initialized(&ip->i_iopen_gh)) {
--=20
2.20.1

