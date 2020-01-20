Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id EAE051426CA
	for <lists+cluster-devel@lfdr.de>; Mon, 20 Jan 2020 10:13:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579511604;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pSPKOln3mxDp1N6bTtN++GkbQ8KW2Y0+1zO4bzG8v+Y=;
	b=TeXJmOalouw3TuVQLDxRgDj2lONzYY6oIZ47R1iWsvYJNv4aJKALQOwCkhCPURh2L+GeHo
	qtNZ9RS9WDfGU45UkiaeyGoNT/LAADzzvdC6hLae9nCGd+NZtmV8CIRXs2/Vi2PrRKj7UK
	x7mr66W0vg/RLoWx/6hkLxP32TJ1iFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-qFvX66jeNya5AZc55dX55A-1; Mon, 20 Jan 2020 04:13:23 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 209901085925;
	Mon, 20 Jan 2020 09:13:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9072385720;
	Mon, 20 Jan 2020 09:13:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CEB768196C;
	Mon, 20 Jan 2020 09:13:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00K9DCc2031660 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 04:13:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E082384DAC; Mon, 20 Jan 2020 09:13:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-63.brq.redhat.com [10.40.204.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E500484D9F;
	Mon, 20 Jan 2020 09:13:11 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 20 Jan 2020 10:12:55 +0100
Message-Id: <20200120091305.24997-2-agruenba@redhat.com>
In-Reply-To: <20200120091305.24997-1-agruenba@redhat.com>
References: <20200120091305.24997-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 01/11] gfs2: Allow ASPACE glocks to also
	have an lvb
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: qFvX66jeNya5AZc55dX55A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: Bob Peterson <rpeterso@redhat.com>

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index b7123de7c180..cabffdc126fd 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -125,12 +125,11 @@ static void gfs2_glock_dealloc(struct rcu_head *rcu)
 {
 =09struct gfs2_glock *gl =3D container_of(rcu, struct gfs2_glock, gl_rcu);
=20
-=09if (gl->gl_ops->go_flags & GLOF_ASPACE) {
+=09kfree(gl->gl_lksb.sb_lvbptr);
+=09if (gl->gl_ops->go_flags & GLOF_ASPACE)
 =09=09kmem_cache_free(gfs2_glock_aspace_cachep, gl);
-=09} else {
-=09=09kfree(gl->gl_lksb.sb_lvbptr);
+=09else
 =09=09kmem_cache_free(gfs2_glock_cachep, gl);
-=09}
 }
=20
 void gfs2_glock_free(struct gfs2_glock *gl)
--=20
2.20.1

