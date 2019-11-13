Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 99DADFBADB
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Nov 2019 22:31:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573680668;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6C5naysHyA8sNeNHgXDwAEhoBAZiiXxisdbMKI8BauI=;
	b=KjjO7xLmpROvL0Ui6GS1W9gIoKUrgOF6K5FHesJbJ/WoNazg5oPqB0RUvLFl6xdAWcZsPn
	uRCqWo6A/cRikPOJm55BK/gPCjPYgU20JBo5X3w8xO8v+KDQcC7w65P/wGssEmyNQo6/tn
	5Wy+WTLBQniX8D1Z8yudVf5dvYnTd9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-IyHsTaMGNd2DnWjiURdiTw-1; Wed, 13 Nov 2019 16:31:06 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 245C610103B4;
	Wed, 13 Nov 2019 21:31:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F00D60470;
	Wed, 13 Nov 2019 21:31:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E878D4BB78;
	Wed, 13 Nov 2019 21:31:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLV2aI005499 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:31:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 62E4569320; Wed, 13 Nov 2019 21:31:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-140.phx2.redhat.com [10.3.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2DCC969739
	for <cluster-devel@redhat.com>; Wed, 13 Nov 2019 21:31:02 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 13 Nov 2019 15:30:30 -0600
Message-Id: <20191113213030.237431-33-rpeterso@redhat.com>
In-Reply-To: <20191113213030.237431-1-rpeterso@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 32/32] gfs2: fix glock reference problem in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: IyHsTaMGNd2DnWjiURdiTw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Patch 9287c6452d2 fixed a situation in which gfs2 could use a glock
after it had been freed. To fix that, it temporarily added a new
glock reference by calling gfs2_glock_hold in function gfs2_add_revoke.
However, if the bd element was removed by gfs2_trans_add_unrevoke
it failed to drop the additional reference.

This patch adds logic to gfs2_trans_add_unrevoke so that it can
properly drop the additional glock reference.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/trans.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index 88209a81c7bb..f1ad6345d91f 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -272,6 +272,11 @@ void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp, u6=
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
--=20
2.23.0

