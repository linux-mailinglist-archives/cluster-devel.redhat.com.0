Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC08117094
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Dec 2019 16:37:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575905836;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3nU8Th0qLrYT3w0ZOBvaxhk1VZ/m/mp/XIR1vRuMHkU=;
	b=UKCa4k83Q+fspx1zBenRr5N9d5kcoJnHn2E+duAFoU/l1vMi+nf31qyxzJnQUrVrlkeWW3
	TsfvmcoFfe7fgw3RbJigH8aw7BBsGgg5LdOi1LkM3dgNmpsjewpBGTalsaFCzgz53YRmv6
	Fb6b7q8AvS6JSoPOpYW2I8sj0iEtN2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-ptA8BmsrPoWEzNgihqHIiw-1; Mon, 09 Dec 2019 10:37:14 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E0D685EE77;
	Mon,  9 Dec 2019 15:37:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ECF045DA75;
	Mon,  9 Dec 2019 15:37:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DCF7C8354F;
	Mon,  9 Dec 2019 15:37:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB9Fb4K9004844 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 9 Dec 2019 10:37:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C715F5D9D6; Mon,  9 Dec 2019 15:37:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-248.phx2.redhat.com [10.3.116.248])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 932A05DA75
	for <cluster-devel@redhat.com>; Mon,  9 Dec 2019 15:37:04 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon,  9 Dec 2019 09:36:40 -0600
Message-Id: <20191209153700.700208-3-rpeterso@redhat.com>
In-Reply-To: <20191209153700.700208-1-rpeterso@redhat.com>
References: <20191209153700.700208-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v8 PATCH 02/22] gfs2: clear ail1 list when
	gfs2 withdraws
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: ptA8BmsrPoWEzNgihqHIiw-1
X-Mimecast-Spam-Score: 0
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
---
 fs/gfs2/log.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 38a03c2203de..5dc889dae01f 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -111,11 +111,17 @@ __acquires(&sdp->sd_ail_lock)
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
@@ -861,6 +867,8 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_g=
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
@@ -873,6 +881,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_g=
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

