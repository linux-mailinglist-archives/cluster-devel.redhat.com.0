Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 08B44FC936
	for <lists+cluster-devel@lfdr.de>; Thu, 14 Nov 2019 15:49:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573742960;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=knSaNnvUtDyiIeuJVIQYU5CZpk7FjO34CSQTIL7027A=;
	b=SPCZO4T+5BI4xj708Zib0FYlhu4+jUFrdEtStOY5hoAl926c3mUhSUBSj7KNBzyNMIB5C+
	pTG6cAlodAzEDl1sBOC5qNOhwgR8BZ8ABnjTF71cc6ScyrOqoP1ry3dgt0XMy9jJG+exlC
	3MeJ5ICH+VSroMeZBDIrw/lmSOtQxmI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-NYrOO7J2ORazIe0SRXigTg-1; Thu, 14 Nov 2019 09:49:19 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C84A818B5FA2;
	Thu, 14 Nov 2019 14:49:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87A505F769;
	Thu, 14 Nov 2019 14:49:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 49D0B4BB65;
	Thu, 14 Nov 2019 14:49:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAEEnEsU023172 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 Nov 2019 09:49:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1A44F5F76C; Thu, 14 Nov 2019 14:49:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1537F5F76B
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 14:49:11 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7EA1C18089C8
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 14:49:11 +0000 (UTC)
Date: Thu, 14 Nov 2019 09:49:11 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <637183661.29709718.1573742951472.JavaMail.zimbra@redhat.com>
In-Reply-To: <1468555282.29709714.1573742943057.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.140, 10.4.195.5]
Thread-Topic: gfs2: fix glock reference problem in gfs2_trans_add_unrevoke
Thread-Index: VtOaHjW7t8bH5sH0vc1FmzZUrgAPyw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: fix glock reference problem in
 gfs2_trans_add_unrevoke
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
X-MC-Unique: NYrOO7J2ORazIe0SRXigTg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Patch 9287c6452d2 fixed a situation in which gfs2 could use a glock
after it had been freed. To fix that, it temporarily added a new
glock reference by calling gfs2_glock_hold in function gfs2_add_revoke.
However, if the bd element was removed by gfs2_trans_add_unrevoke
it failed to drop the additional reference.

This patch adds logic to gfs2_trans_add_unrevoke so that it can
properly drop the additional glock reference.

Fixes: 9287c6452d2b1f24ea8e84bd3cf6f3c6f267f712
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Cc: stable@vger.kernel.org # v5.2+
---
 fs/gfs2/trans.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index 35e3059255fe..0eb3c5198c2b 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -262,6 +262,11 @@ void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp, u6=
4 blkno, unsigned int len)
 =09=09=09list_del_init(&bd->bd_list);
 =09=09=09gfs2_assert_withdraw(sdp, sdp->sd_log_num_revoke);
 =09=09=09sdp->sd_log_num_revoke--;
+=09=09=09if (bd->bd_gl &&
+=09=09=09    atomic_dec_return(&bd->bd_gl->gl_revokes) =3D=3D 0) {
+=09=09=09=09clear_bit(GLF_LFLUSH, &bd->bd_gl->gl_flags);
+=09=09=09=09gfs2_glock_queue_put(bd->bd_gl);
+=09=09=09}
 =09=09=09kmem_cache_free(gfs2_bufdata_cachep, bd);
 =09=09=09tr->tr_num_revoke--;
 =09=09=09if (--n =3D=3D 0)

