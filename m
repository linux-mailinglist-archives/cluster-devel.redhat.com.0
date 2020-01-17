Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3B432141001
	for <lists+cluster-devel@lfdr.de>; Fri, 17 Jan 2020 18:39:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579282752;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1x0jwgSXnUQUwa189/Y4gfZZ5DyE3+tCrazUsfD9rjw=;
	b=d78gs+vVNh33NSgkc24ft9pewGcEYH9p7LKTurnOnwballqWNsmox3nDQ6MVhdff6nsxFA
	mcrj+DOlEiEvF9i0173EwB1R6/6nGygOz1EQUn/861eqO08sd27Sv1Z3JenDilL08F9set
	gjK3Y/iA2NJKaZhf8K0wFDr+217/ptA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-5-4gqglWMOi3Zz2indXpKQ-1; Fri, 17 Jan 2020 12:39:10 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4A2418CA241;
	Fri, 17 Jan 2020 17:39:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D9D61BC6D;
	Fri, 17 Jan 2020 17:39:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1CED787092;
	Fri, 17 Jan 2020 17:39:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00HHd1n8025104 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 17 Jan 2020 12:39:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0518C675AF; Fri, 17 Jan 2020 17:39:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-63.brq.redhat.com [10.40.204.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A8741BC6D;
	Fri, 17 Jan 2020 17:38:57 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 17 Jan 2020 18:38:55 +0100
Message-Id: <20200117173855.16256-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Remove GFS2_MIN_LVB_SIZE define
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
X-MC-Unique: 5-4gqglWMOi3Zz2indXpKQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

The dlm lockspace is set up to have lock value blocks of GDLM_LVB_SIZE byte=
s,
and dlm is the only lock manager we support, so there is no point in claimi=
ng
that the lock value block could have any other size.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c  | 2 +-
 fs/gfs2/incore.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 2aa21bab8e1c..5bd2bcab6e25 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -825,7 +825,7 @@ int gfs2_glock_get(struct gfs2_sbd *sdp, u64 number,
 =09memset(&gl->gl_lksb, 0, sizeof(struct dlm_lksb));
=20
 =09if (glops->go_flags & GLOF_LVB) {
-=09=09gl->gl_lksb.sb_lvbptr =3D kzalloc(GFS2_MIN_LVB_SIZE, GFP_NOFS);
+=09=09gl->gl_lksb.sb_lvbptr =3D kzalloc(GDLM_LVB_SIZE, GFP_NOFS);
 =09=09if (!gl->gl_lksb.sb_lvbptr) {
 =09=09=09kmem_cache_free(cachep, gl);
 =09=09=09return -ENOMEM;
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 5f89c515f5bb..9ae44b989562 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -387,8 +387,6 @@ struct gfs2_glock {
 =09struct rhash_head gl_node;
 };
=20
-#define GFS2_MIN_LVB_SIZE 32=09/* Min size of LVB that gfs2 supports */
-
 enum {
 =09GIF_INVALID=09=09=3D 0,
 =09GIF_QD_LOCKED=09=09=3D 1,
--=20
2.20.1

