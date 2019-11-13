Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 73725FBAC1
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Nov 2019 22:30:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573680645;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=evxRioojWdbtZZlKBmwnNa2JM0s8Dwv20nhlULPgjE8=;
	b=LxSMCqkyGpPGp41zhVHq6dirivB811rMmaRsZ1EH7W2MpL0S4bTZdit1daUCUO6op6mXsu
	lAMnLEUQYeDKCTPkwBQ+04TZ6ibSNc9Cb7XOVHAOrHWb38ClujiUr68HqB9vDKfIYrl/e5
	EJd6P/ZF1sWx60IgAuCYg5ax+Nc3ybg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-IGe_SBtKOdKop_cXIM4awQ-1; Wed, 13 Nov 2019 16:30:43 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE1CD106BC0A;
	Wed, 13 Nov 2019 21:30:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0861C18AA0;
	Wed, 13 Nov 2019 21:30:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7FCD24BB65;
	Wed, 13 Nov 2019 21:30:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLUZF5005186 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:30:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1DFFA6973B; Wed, 13 Nov 2019 21:30:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-140.phx2.redhat.com [10.3.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D7D0E69739
	for <cluster-devel@redhat.com>; Wed, 13 Nov 2019 21:30:34 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 13 Nov 2019 15:30:00 -0600
Message-Id: <20191113213030.237431-3-rpeterso@redhat.com>
In-Reply-To: <20191113213030.237431-1-rpeterso@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 02/32] gfs2: clear ail1 list when gfs2
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
X-MC-Unique: IGe_SBtKOdKop_cXIM4awQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
---
 fs/gfs2/log.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 877610e1e3c0..a36889eea302 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -109,11 +109,17 @@ __acquires(&sdp->sd_ail_lock)
 =09=09=09=09=09      &sdp->sd_flags)) {
 =09=09=09=09gfs2_io_error_bh(sdp, bh);
 =09=09=09=09set_bit(SDF_WITHDRAWING, &sdp->sd_flags);
+=09=09=09} else {
+=09=09=09=09list_move(&bd->bd_ail_st_list,
+=09=09=09=09=09  &tr->tr_ail2_list);
+=09=09=09=09continue;
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
@@ -846,6 +852,8 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_g=
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
@@ -858,6 +866,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_g=
lock *gl, u32 flags)
 =09=09=09atomic_set(&sdp->sd_freeze_state, SFS_FROZEN);
 =09}
=20
+out:
 =09trace_gfs2_log_flush(sdp, 0, flags);
 =09up_write(&sdp->sd_log_flush_lock);
=20
--=20
2.23.0

