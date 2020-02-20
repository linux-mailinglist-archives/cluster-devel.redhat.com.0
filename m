Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B754E16679B
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Feb 2020 20:54:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582228442;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kNMlfHjDQZa1Pq4XkB1s9RKbihIuSv24CltX8Dp8hkc=;
	b=DeZ5/HC7tAtPoxIYfLkpBIR5kBWbwz41SvdlmqcT4m8Uf2b8tT5t6BIiAYr7Ey4DYoNC5f
	iIQ3RwzWpxe3Ov/MH1m2dw0OXQuxvxyMX73fWpjAgiQc0mm6+TK3EBZe1fLuS9gSmnwQds
	lB4rdd9QrQ8X1QNNH5sz2faPIHYjDGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-xXtdiRQGPNyljssyQDUmlA-1; Thu, 20 Feb 2020 14:53:55 -0500
X-MC-Unique: xXtdiRQGPNyljssyQDUmlA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D817925A6;
	Thu, 20 Feb 2020 19:53:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEB3E5C1B0;
	Thu, 20 Feb 2020 19:53:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D6E6418089CD;
	Thu, 20 Feb 2020 19:53:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KJroep009136 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 14:53:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B3ADE90F74; Thu, 20 Feb 2020 19:53:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9919490F57
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 19:53:49 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 20 Feb 2020 13:53:08 -0600
Message-Id: <20200220195329.952027-8-rpeterso@redhat.com>
In-Reply-To: <20200220195329.952027-1-rpeterso@redhat.com>
References: <20200220195329.952027-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 07/28] gfs2: clear ail1 list when gfs2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
2.24.1

