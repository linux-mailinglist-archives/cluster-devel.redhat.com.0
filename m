Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 81819197D4B
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Mar 2020 15:46:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585576008;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LayhZj7P0jyIb7DRLL1nPqP+AKLi78jP4/vXP3/9Aao=;
	b=Qek2NjH7bX8x136UcdJk2f25DZLsnhTcwzJ5ef3xJW/wWdkcubPbwSA/qYeUeVNNvv0knF
	IW0BXJdRe2DViI3RZ2FlbuQ6seZ92hvMX45rIAhZJfN9DRueztSwURwHA7O4sa6EbxZV/T
	RLJQrQYXqoVt+g1CGNxn5LQy0XvBdcg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-tfXlDqIyNsOWgULlnxRYoQ-1; Mon, 30 Mar 2020 09:46:46 -0400
X-MC-Unique: tfXlDqIyNsOWgULlnxRYoQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A442818FE861;
	Mon, 30 Mar 2020 13:46:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 911BDD7682;
	Mon, 30 Mar 2020 13:46:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 76DA6944DC;
	Mon, 30 Mar 2020 13:46:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UDkVdI020222 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 09:46:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 534E45C1A8; Mon, 30 Mar 2020 13:46:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 17CE348
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 13:46:31 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 30 Mar 2020 08:45:52 -0500
Message-Id: <20200330134624.259349-8-rpeterso@redhat.com>
In-Reply-To: <20200330134624.259349-1-rpeterso@redhat.com>
References: <20200330134624.259349-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 07/39] gfs2: clear ail1 list when gfs2
	withdraws
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This patch fixes a bug in which function gfs2_log_flush can get into
an infinite loop when a gfs2 file system is withdrawn. The problem
is the infinite loop "for (;;)" in gfs2_log_flush which would never
finish because the io error and subsequent withdraw prevented the
items from being taken off the ail list.

This patch tries to clean up the mess by allowing withdraw situations
to move not-in-flight buffer_heads to the ail2 list, where they will
be dealt with later.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/log.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index d1ab04135b2f..9ebec6f93fa3 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -103,16 +103,22 @@ __acquires(&sdp->sd_ail_lock)
 =09=09gfs2_assert(sdp, bd->bd_tr =3D=3D tr);
=20
 =09=09if (!buffer_busy(bh)) {
-=09=09=09if (!buffer_uptodate(bh) &&
-=09=09=09    !test_and_set_bit(SDF_AIL1_IO_ERROR,
+=09=09=09if (buffer_uptodate(bh)) {
+=09=09=09=09list_move(&bd->bd_ail_st_list,
+=09=09=09=09=09  &tr->tr_ail2_list);
+=09=09=09=09continue;
+=09=09=09}
+=09=09=09if (!test_and_set_bit(SDF_AIL1_IO_ERROR,
 =09=09=09=09=09      &sdp->sd_flags)) {
 =09=09=09=09gfs2_io_error_bh(sdp, bh);
 =09=09=09=09gfs2_withdraw_delayed(sdp);
 =09=09=09}
-=09=09=09list_move(&bd->bd_ail_st_list, &tr->tr_ail2_list);
-=09=09=09continue;
 =09=09}
=20
+=09=09if (gfs2_withdrawn(sdp)) {
+=09=09=09gfs2_remove_from_ail(bd);
+=09=09=09continue;
+=09=09}
 =09=09if (!buffer_dirty(bh))
 =09=09=09continue;
 =09=09if (gl =3D=3D bd->bd_gl)
@@ -859,6 +865,8 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_g=
lock *gl, u32 flags)
 =09=09=09=09if (gfs2_ail1_empty(sdp))
 =09=09=09=09=09break;
 =09=09=09}
+=09=09=09if (gfs2_withdrawn(sdp))
+=09=09=09=09goto out;
 =09=09=09atomic_dec(&sdp->sd_log_blks_free); /* Adjust for unreserved buff=
er */
 =09=09=09trace_gfs2_log_blocks(sdp, -1);
 =09=09=09log_write_header(sdp, flags);
@@ -871,6 +879,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_g=
lock *gl, u32 flags)
 =09=09=09atomic_set(&sdp->sd_freeze_state, SFS_FROZEN);
 =09}
=20
+out:
 =09trace_gfs2_log_flush(sdp, 0, flags);
 =09up_write(&sdp->sd_log_flush_lock);
=20
--=20
2.25.1

