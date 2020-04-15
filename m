Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D2FA21A9C5C
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Apr 2020 13:35:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586950505;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=V/SmUEAVvgfuAnj5RMdl22jrG9BRCrNXMO1dGu9cv4w=;
	b=SExl43Fi0+eDkoOLYNfsyliSU25zcwJqiNjAETIbNG8RP2PtHRoQ8yEb9EL9JegxJRpt51
	t9INMrD7mVyzCs0wwND17DltvNpwxdP6CoiUh5SS10FgLJqvoV0PUZPQMDTCxJTWpcfyBE
	DgLJkHo0mHPuiB/7obzXiQmsYN4JDrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-qDRynsc5PqC_VcWMyOjPYQ-1; Wed, 15 Apr 2020 07:35:03 -0400
X-MC-Unique: qDRynsc5PqC_VcWMyOjPYQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E1B7107B103;
	Wed, 15 Apr 2020 11:35:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C08B360BE2;
	Wed, 15 Apr 2020 11:35:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55D2F93374;
	Wed, 15 Apr 2020 11:35:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03FBYvFl026251 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Apr 2020 07:34:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 72CDE2166B2B; Wed, 15 Apr 2020 11:34:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37C6A2166B31
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 11:34:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12FCB101A55D
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 11:34:55 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-116-SX8BCDDbOeKRdmm9L1YxEQ-1;
	Wed, 15 Apr 2020 07:34:50 -0400
X-MC-Unique: SX8BCDDbOeKRdmm9L1YxEQ-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A70FB2076D;
	Wed, 15 Apr 2020 11:34:47 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Wed, 15 Apr 2020 07:32:37 -0400
Message-Id: <20200415113445.11881-2-sashal@kernel.org>
In-Reply-To: <20200415113445.11881-1-sashal@kernel.org>
References: <20200415113445.11881-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03FBYvFl026251
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.6 002/129] gfs2: clear ail1 list
	when gfs2 withdraws
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: Bob Peterson <rpeterso@redhat.com>

[ Upstream commit 30fe70a85a909a23dcbc2c628ca6655b2c85e7a1 ]

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
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/log.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 00a2e721a374f..d295d2a773314 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -104,16 +104,22 @@ __acquires(&sdp->sd_ail_lock)
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
 =09=09=09=09*withdraw =3D true;
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
@@ -862,6 +868,8 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_g=
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
@@ -874,6 +882,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_g=
lock *gl, u32 flags)
 =09=09=09atomic_set(&sdp->sd_freeze_state, SFS_FROZEN);
 =09}
=20
+out:
 =09trace_gfs2_log_flush(sdp, 0, flags);
 =09up_write(&sdp->sd_log_flush_lock);
=20
--=20
2.20.1


